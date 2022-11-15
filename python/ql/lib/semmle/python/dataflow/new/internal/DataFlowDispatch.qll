/**
 * INTERNAL: Do not use.
 *
 * TypeTracker based call-graph.
 *
 * The overall scheme for resolving calls, is to notice that Python has different kinds
 * of callables, and resolve those with different strategies. Currently we handle these
 * completely separately:
 * 1. plain functions (and lambdas)
 * 2. methods on classes
 * 3. class instantiation
 *
 * So we have type-trackers for each of the 3 categories above, with some considerable
 * effort to handle different kinds of methods on classes (staticmethod, classmethod,
 * normal), and resolving methods correctly in regards to MRO.
 *
 *
 * A goal of this library is to support modeling calls that happens by third-party
 * libraries. For example `call_later(func, arg0, arg1, foo=val)`, and the fact that the
 * library might inject it's own arguments, for example a context that will always be
 * passed as the actual first argument to the function. Currently the aim is to provide
 * enough predicates for such `call_later` function to be modeled by providing
 * additional data-flow steps for the arguments/parameters. This means we cannot have
 * any special logic that requires an AST call to be made before we care to figure out
 * what callable this call might end up targeting.
 *
 * Specifically this means that we cannot use type-backtrackes from the function of a
 * `CallNode`, since there is no `CallNode` to backtrack from for `func` in the example
 * above.
 *
 * Note: This hasn't been 100% realized yet, so we don't currently expose a predicate to
 * ask what targets any data-flow node has. But it's still the plan to do this!
 */

private import python
private import DataFlowPublic
private import DataFlowPrivate
private import FlowSummaryImpl as FlowSummaryImpl

newtype TParameterPosition =
  /** Used for `self` in methods, and `cls` in classmethods. */
  TSelfParameterPosition() or
  TPositionalParameterPosition(int pos) { pos = any(Parameter p).getPosition() } or
  TKeywordParameterPosition(string name) { name = any(Parameter p).getName() } or
  TStarArgsParameterPosition(int pos) {
    // since `.getPosition` does not work for `*args`, we need *args parameter positions
    // at index 1 larger than the largest positional parameter position (and 0 must be
    // included as well). This is a bit of an over-approximation.
    pos = 0 or
    pos = any(Parameter p).getPosition() + 1
  } or
  TSynthStarArgsElementParameterPosition(int pos) { exists(TStarArgsParameterPosition(pos)) } or
  TSynthLateStarArgsParameterPosition(int pos) { exists(TStarArgsParameterPosition(pos)) } or
  TDictSplatParameterPosition()

/** A parameter position. */
class ParameterPosition extends TParameterPosition {
  /** Holds if this position represents a `self`/`cls` parameter. */
  predicate isSelf() { this = TSelfParameterPosition() }

  /** Holds if this position represents a positional parameter at (0-based) `index`. */
  predicate isPositional(int index) { this = TPositionalParameterPosition(index) }

  /** Holds if this position represents a keyword parameter named `name`. */
  predicate isKeyword(string name) { this = TKeywordParameterPosition(name) }

  /** Holds if this position represents a `*args` parameter at (0-based) `index`. */
  predicate isStarArgs(int index) { this = TStarArgsParameterPosition(index) }

  /**
   * Holds if this position represents a synthetic parameter at or after (0-based)
   * position `index`, from which there will be made a store step to the real
   * `*args` parameter.
   */
  predicate isSynthStarArgsElement(int index) {
    this = TSynthStarArgsElementParameterPosition(index)
  }

  /**
   * Holds if this position represents a synthetic `*args` parameter after the real
   * `*args` parameter. The real `*args` parameter is at the 0-based index `index`.
   */
  predicate isSynthLateStarArgsParameterPosition(int index) {
    this = TSynthLateStarArgsParameterPosition(index)
  }

  /** Holds if this position represents a `**kwargs` parameter. */
  predicate isDictSplat() { this = TDictSplatParameterPosition() }

  /** Gets a textual representation of this element. */
  string toString() {
    this.isSelf() and result = "self"
    or
    exists(int index | this.isPositional(index) and result = "position " + index)
    or
    exists(string name | this.isKeyword(name) and result = "keyword " + name)
    or
    exists(int index | this.isStarArgs(index) and result = "*args at " + index)
    or
    exists(int index |
      this.isSynthStarArgsElement(index) and
      result = "synthetic *args element at (or after) " + index
    )
    or
    exists(int index |
      this.isSynthLateStarArgsParameterPosition(index) and
      result = "synthetic late *args after " + index
    )
    or
    this.isDictSplat() and result = "**"
  }
}

newtype TArgumentPosition =
  /** Used for `self` in methods, and `cls` in classmethods. */
  TSelfArgumentPosition() or
  TPositionalArgumentPosition(int pos) { exists(any(CallNode c).getArg(pos)) } or
  TKeywordArgumentPosition(string name) { exists(any(CallNode c).getArgByName(name)) } or
  TStarArgsArgumentPosition(int pos) { exists(Call c | c.getPositionalArg(pos) instanceof Starred) } or
  TDictSplatArgumentPosition()

/** An argument position. */
class ArgumentPosition extends TArgumentPosition {
  /** Holds if this position represents a `self`/`cls` argument. */
  predicate isSelf() { this = TSelfArgumentPosition() }

  /** Holds if this position represents a positional argument at (0-based) `index`. */
  predicate isPositional(int index) { this = TPositionalArgumentPosition(index) }

  /** Holds if this position represents a keyword argument named `name`. */
  predicate isKeyword(string name) { this = TKeywordArgumentPosition(name) }

  /** Holds if this position represents a `*args` argument at (0-based) `index`. */
  predicate isStarArgs(int index) { this = TStarArgsArgumentPosition(index) }

  /** Holds if this position represents a `**kwargs` argument. */
  predicate isDictSplat() { this = TDictSplatArgumentPosition() }

  /** Gets a textual representation of this element. */
  string toString() {
    this.isSelf() and result = "self"
    or
    exists(int pos | this.isPositional(pos) and result = "position " + pos)
    or
    exists(string name | this.isKeyword(name) and result = "keyword " + name)
    or
    exists(int index | this.isStarArgs(index) and result = "*args at " + index)
    or
    this.isDictSplat() and result = "**"
  }
}

/** Holds if arguments at position `apos` match parameters at position `ppos`. */
predicate parameterMatch(ParameterPosition ppos, ArgumentPosition apos) {
  ppos.isSelf() and apos.isSelf()
  or
  exists(int index | ppos.isPositional(index) and apos.isPositional(index))
  or
  exists(string name | ppos.isKeyword(name) and apos.isKeyword(name))
  or
  exists(int index | ppos.isStarArgs(index) and apos.isStarArgs(index))
  or
  exists(int paramIndex, int argIndex | argIndex >= paramIndex |
    ppos.isSynthStarArgsElement(paramIndex) and apos.isPositional(argIndex)
  )
  or
  exists(int realStarArgsIndex, int argIndex | argIndex > realStarArgsIndex |
    ppos.isSynthLateStarArgsParameterPosition(realStarArgsIndex) and apos.isStarArgs(argIndex)
  )
  or
  ppos.isDictSplat() and apos.isDictSplat()
}

// =============================================================================
// Helper predicates
// =============================================================================
/**
 * Holds if the function `func` is a staticmethod -- either by having a
 * `@staticmethod` decorator or by convention
 * (like a `__new__` method on a class is a classmethod even without the decorator).
 */
predicate isStaticmethod(Function func) {
  exists(NameNode id | id.getId() = "staticmethod" and id.isGlobal() |
    func.getADecorator() = id.getNode()
  )
}

/**
 * Holds if the function `func` is a classmethod -- either by having a
 * `@classmethod` decorator or by convention
 * (like a `__new__` method on a class is a classmethod even without the decorator).
 */
predicate isClassmethod(Function func) {
  exists(NameNode id | id.getId() = "classmethod" and id.isGlobal() |
    func.getADecorator() = id.getNode()
  )
  or
  exists(Class cls |
    cls.getAMethod() = func and
    func.getName() in [
        "__new__", // https://docs.python.org/3.10/reference/datamodel.html#object.__new__
        "__init_subclass__", // https://docs.python.org/3.10/reference/datamodel.html#object.__init_subclass__
        "__class_getitem__", // https://docs.python.org/3.10/reference/datamodel.html#object.__class_getitem__
      ]
  )
}

/** Holds if the function `func` has a `property` decorator. */
predicate hasPropertyDecorator(Function func) {
  exists(NameNode id | id.getId() = "property" and id.isGlobal() |
    func.getADecorator() = id.getNode()
  )
}

// =============================================================================
// Callables
// =============================================================================
/** A callable defined in library code, identified by a unique string. */
abstract class LibraryCallable extends string {
  bindingset[this]
  LibraryCallable() { any() }

  /** Gets a call to this library callable. */
  abstract CallCfgNode getACall();

  /** Gets a data-flow node, where this library callable is used as a call-back. */
  abstract ArgumentNode getACallback();
}

newtype TDataFlowCallable =
  TFunction(Function func) or
  /** see QLDoc for `DataFlowModuleScope` for why we need this. */
  TModule(Module m) or
  TLibraryCallable(LibraryCallable callable)

/** A callable. */
abstract class DataFlowCallable extends TDataFlowCallable {
  /** Gets a textual representation of this element. */
  abstract string toString();

  /** Gets qualified name for this callable, if any. */
  abstract string getQualifiedName();

  /** Gets the scope of this callable */
  abstract Scope getScope();

  /** Gets the parameter at position `ppos`, if any. */
  abstract ParameterNode getParameter(ParameterPosition ppos);

  /** Gets the underlying library callable, if any. */
  LibraryCallable asLibraryCallable() { this = TLibraryCallable(result) }

  /** Gets the location of this dataflow callable. */
  abstract Location getLocation();
}

/** A callable function. */
abstract class DataFlowFunction extends DataFlowCallable, TFunction {
  Function func;

  DataFlowFunction() {
    this = TFunction(func) and
    // TODO: Handle @property decorators
    not hasPropertyDecorator(func)
  }

  override string toString() { result = func.toString() }

  override string getQualifiedName() { result = func.getQualifiedName() }

  override Function getScope() { result = func }

  override Location getLocation() { result = func.getLocation() }

  /** Gets the positional parameter offset, to take into account self/cls parameters. */
  int positionalOffset() { result = 0 }

  override ParameterNode getParameter(ParameterPosition ppos) {
    exists(int index | ppos.isPositional(index) |
      result.getParameter() = func.getArg(index + this.positionalOffset())
    )
    or
    exists(string name | ppos.isKeyword(name) | result.getParameter() = func.getArgByName(name))
    or
    exists(int index |
      (
        ppos.isStarArgs(index) and
        result.getParameter() = func.getVararg()
        or
        ppos.isSynthStarArgsElement(index) and
        result = TSynthStarArgsElementParameterNode(this)
        or
        ppos.isSynthLateStarArgsParameterPosition(index) and
        result = TSynthLateStarArgsParameterNode(this)
      )
    |
      // a `*args` parameter comes after the last positional parameter. We need to take
      // self parameter into account, so for
      // `def func(foo, bar, *args)` it should be index 2 (1 + max-index == 1 + 1)
      // `class A: def func(self, foo, bar, *args)` it should be index 2 (1 + max-index - 1 == 1 + 2 - 1)
      index =
        1 + max(int positionalIndex | exists(func.getArg(positionalIndex)) | positionalIndex) -
          this.positionalOffset()
      or
      // no positional argument
      not exists(func.getArg(_)) and index = 0
    )
    or
    ppos.isDictSplat() and result.getParameter() = func.getKwarg()
    or
    ppos.isDictSplat() and result = TSynthDictSplatParameterNode(this)
  }
}

/** A plain (non-method) function. */
class DataFlowPlainFunction extends DataFlowFunction {
  DataFlowPlainFunction() { not this instanceof DataFlowMethod }
}

/** A method, except staticmethods. */
class DataFlowMethod extends DataFlowFunction {
  Class cls;

  DataFlowMethod() { cls.getAMethod() = func }

  /** Gets the class this function is a method of. */
  Class getClass() { result = cls }

  override int positionalOffset() { result = 1 }

  override ParameterNode getParameter(ParameterPosition ppos) {
    ppos.isSelf() and result.getParameter() = func.getArg(0)
    or
    result = super.getParameter(ppos)
  }
}

/** A classmethod. */
class DataFlowClassmethod extends DataFlowMethod {
  DataFlowClassmethod() { isClassmethod(func) }
}

/** A staticmethod. */
class DataFlowStaticmethod extends DataFlowMethod, DataFlowFunction {
  DataFlowStaticmethod() { isStaticmethod(func) }

  override int positionalOffset() { result = 0 }

  override ParameterNode getParameter(ParameterPosition ppos) {
    result = DataFlowFunction.super.getParameter(ppos)
  }
}

/**
 * A module. This is not actually a callable, but we need this so a
 * `ModuleVariableNode` have an enclosing callable.
 */
class DataFlowModuleScope extends DataFlowCallable, TModule {
  Module mod;

  DataFlowModuleScope() { this = TModule(mod) }

  override string toString() { result = mod.toString() }

  override string getQualifiedName() { result = mod.getName() }

  override Module getScope() { result = mod }

  override Location getLocation() { result = mod.getLocation() }

  override ParameterNode getParameter(ParameterPosition ppos) { none() }
}

class LibraryCallableValue extends DataFlowCallable, TLibraryCallable {
  LibraryCallable callable;

  LibraryCallableValue() { this = TLibraryCallable(callable) }

  override string toString() { result = callable.toString() }

  override string getQualifiedName() { result = callable.toString() }

  /** Gets a data-flow node, where this library callable is used as a call-back. */
  ArgumentNode getACallback() { result = callable.getACallback() }

  override Scope getScope() { none() }

  override ParameterNode getParameter(ParameterPosition ppos) { none() }

  override LibraryCallable asLibraryCallable() { result = callable }

  override Location getLocation() { none() }
}

// =============================================================================
// Type trackers used to resolve calls.
// =============================================================================
/** Gets a call to `type`. */
private CallCfgNode getTypeCall() {
  exists(NameNode id | id.getId() = "type" and id.isGlobal() |
    result.getFunction().asCfgNode() = id
  )
}

/** Gets a call to `super`. */
private CallCfgNode getSuperCall() {
  // While it is possible to reference super and call it later, it's almost never done in
  // practice. From looking at top 1000 projects, there were a few uses around mocking (see
  // link below), but otherwise only 2 edgecases. Overall it seems ok to ignore this complexity.
  //
  // https://github.com/python/cpython/blob/18b1782192f85bd26db89f5bc850f8bee4247c1a/Lib/unittest/mock.py#L48-L50
  exists(NameNode id | id.getId() = "super" and id.isGlobal() |
    result.getFunction().asCfgNode() = id
  )
}

/**
 * Gets a reference to the function `func`.
 */
private TypeTrackingNode functionTracker(TypeTracker t, Function func) {
  t.start() and
  (
    result.asExpr() = func.getDefinition()
    or
    // when a function is decorated, it's the result of the (last) decorator call that
    // is used
    result.asExpr() = func.getDefinition().(FunctionExpr).getADecoratorCall()
  )
  or
  exists(TypeTracker t2 | result = functionTracker(t2, func).track(t2, t))
}

/**
 * Gets a reference to the function `func`.
 */
Node functionTracker(Function func) { functionTracker(TypeTracker::end(), func).flowsTo(result) }

/**
 * Gets a reference to the class `cls`.
 */
private TypeTrackingNode classTracker(TypeTracker t, Class cls) {
  t.start() and
  (
    result.asExpr() = cls.getParent()
    or
    // when a class is decorated, it's the result of the (last) decorator call that
    // is used
    result.asExpr() = cls.getParent().(ClassExpr).getADecoratorCall()
    or
    // `type(obj)`, where obj is an instance of this class
    result = getTypeCall() and
    result.(CallCfgNode).getArg(0) = classInstanceTracker(cls)
  )
  or
  exists(TypeTracker t2 | result = classTracker(t2, cls).track(t2, t)) and
  not result.(ParameterNodeImpl).isParameterOf(_, any(ParameterPosition pp | pp.isSelf()))
}

/**
 * Gets a reference to the class `cls`.
 */
Node classTracker(Class cls) { classTracker(TypeTracker::end(), cls).flowsTo(result) }

/**
 * Gets a reference to an instance of the class `cls`.
 */
private TypeTrackingNode classInstanceTracker(TypeTracker t, Class cls) {
  t.start() and
  resolveClassCall(result.(CallCfgNode).asCfgNode(), cls)
  or
  exists(TypeTracker t2 | result = classInstanceTracker(t2, cls).track(t2, t)) and
  not result.(ParameterNodeImpl).isParameterOf(_, any(ParameterPosition pp | pp.isSelf()))
}

/**
 * Gets a reference to an instance of the class `cls`.
 */
Node classInstanceTracker(Class cls) {
  classInstanceTracker(TypeTracker::end(), cls).flowsTo(result)
}

/**
 * Gets a reference to the `self` argument of a method on class `classWithMethod`.
 * The method cannot be a `staticmethod` or `classmethod`.
 */
private TypeTrackingNode selfTracker(TypeTracker t, Class classWithMethod) {
  t.start() and
  exists(Function func |
    func = classWithMethod.getAMethod() and
    not isStaticmethod(func) and
    not isClassmethod(func)
  |
    result.asExpr() = func.getArg(0)
  )
  or
  exists(TypeTracker t2 | result = selfTracker(t2, classWithMethod).track(t2, t)) and
  not result.(ParameterNodeImpl).isParameterOf(_, any(ParameterPosition pp | pp.isSelf()))
}

/**
 * Gets a reference to the `self` argument of a method on class `classWithMethod`.
 * The method cannot be a `staticmethod` or `classmethod`.
 */
Node selfTracker(Class classWithMethod) {
  selfTracker(TypeTracker::end(), classWithMethod).flowsTo(result)
}

/**
 * Gets a reference to the `cls` argument of a classmethod on class `classWithMethod`.
 */
private TypeTrackingNode clsTracker(TypeTracker t, Class classWithMethod) {
  t.start() and
  (
    exists(Function func |
      func = classWithMethod.getAMethod() and
      isClassmethod(func)
    |
      result.asExpr() = func.getArg(0)
    )
    or
    // type(self)
    result = getTypeCall() and
    result.(CallCfgNode).getArg(0) = selfTracker(classWithMethod)
  )
  or
  exists(TypeTracker t2 | result = clsTracker(t2, classWithMethod).track(t2, t)) and
  not result.(ParameterNodeImpl).isParameterOf(_, any(ParameterPosition pp | pp.isSelf()))
}

/**
 * Gets a reference to the `cls` argument of a classmethod on class `classWithMethod`.
 */
Node clsTracker(Class classWithMethod) {
  clsTracker(TypeTracker::end(), classWithMethod).flowsTo(result)
}

/**
 * Gets a reference to the result of calling `super` without any argument, where the
 * call happened in the method `func` (either a method or a classmethod).
 */
private TypeTrackingNode superCallNoArgumentTracker(TypeTracker t, Function func) {
  not isStaticmethod(func) and
  t.start() and
  exists(CallCfgNode call | result = call |
    call = getSuperCall() and
    not exists(call.getArg(_)) and
    call.getScope() = func
  )
  or
  exists(TypeTracker t2 | result = superCallNoArgumentTracker(t2, func).track(t2, t)) and
  not result.(ParameterNodeImpl).isParameterOf(_, any(ParameterPosition pp | pp.isSelf()))
}

/**
 * Gets a reference to the result of calling `super` without any argument, where the
 * call happened in the method `func` (either a method or a classmethod).
 */
Node superCallNoArgumentTracker(Function func) {
  superCallNoArgumentTracker(TypeTracker::end(), func).flowsTo(result)
}

/**
 * Gets a reference to the result of calling `super` with 2 arguments, where the
 * first is a reference to the class `cls`, and the second argument is `obj`.
 */
private TypeTrackingNode superCallTwoArgumentTracker(TypeTracker t, Class cls, Node obj) {
  t.start() and
  exists(CallCfgNode call | result = call |
    call = getSuperCall() and
    call.getArg(0) = classTracker(cls) and
    call.getArg(1) = obj
  )
  or
  exists(TypeTracker t2 | result = superCallTwoArgumentTracker(t2, cls, obj).track(t2, t)) and
  not result.(ParameterNodeImpl).isParameterOf(_, any(ParameterPosition pp | pp.isSelf()))
}

/**
 * Gets a reference to the result of calling `super` with 2 arguments, where the
 * first is a reference to the class `cls`, and the second argument is `obj`.
 */
Node superCallTwoArgumentTracker(Class cls, Node obj) {
  superCallTwoArgumentTracker(TypeTracker::end(), cls, obj).flowsTo(result)
}

// =============================================================================
// MRO
// =============================================================================
/**
 * Gets a direct superclass of the argument `cls`, if any.
 *
 * For `A` with the class definition `class A(B, C)` it will have results `B` and `C`.
 */
Class getADirectSuperclass(Class cls) { cls.getABase() = classTracker(result).asExpr() }

/**
 * Gets a direct subclass of the argument `cls`, if any.
 *
 *For `B` with the class definition `class A(B)` it will have result `A`.
 */
Class getADirectSubclass(Class cls) { cls = getADirectSuperclass(result) }

/**
 * Gets a class that, from an approximated MRO calculation, might be the next class used
 * for member-lookup when `super().attr` is used inside the class `cls`.
 *
 * In the example below, with `cls=B`, this predicate will have `A` and `C` as results.
 * ```py
 * class A: pass
 * class B(A): pass
 * class C(A): pass
 * class D(B, C): pass
 * ```
 *
 * NOTE: This approximation does not handle all cases correctly, and in the example
 * below, with `cls=A` will not have any results, although it should include `Y`.
 *
 * ```py
 * class A: pass
 * class B(A): pass
 * class X: pass
 * class Y(X): pass
 * class Ex(B, Y): pass
 * ```
 *
 * NOTE for debugging the results of this predicate: Since a class can be part of
 * multiple MROs, results from this predicate might only be valid in some, but not all,
 * inheritance chains (such as the result `C` for `cls=B` in the first example -- this
 * might make it difficult to see if the definition of `D` is located in an other file)
 *
 * For more info on the C3 MRO used in Python see:
 * - https://docs.python.org/3/glossary.html#term-method-resolution-order
 * - https://www.python.org/download/releases/2.3/mro/
 */
private Class getNextClassInMro(Class cls) {
  // class A(B, ...):
  // `B` must be the next class after `A` in the MRO for A.
  cls.getBase(0) = classTracker(result).asExpr()
  or
  // class A(B, C, D):
  // - `C` could be the next class after `B` in MRO.
  // - `D` could be the next class after `C` in MRO.
  exists(Class sub, int i |
    sub.getBase(i) = classTracker(cls).asExpr() and
    sub.getBase(i + 1) = classTracker(result).asExpr() and
    not result = cls
  )
  // There are two important properties for MRO computed with C3 in Python:
  //
  // 1) monotonicity: if C1 precedes C2 in the MRO of C, then C1 precedes C2 in the MRO
  //    of any subclass of C.
  // 2) local precedence ordering: if C1 precedes C2 in the list of superclasses for C,
  //    they will keep the same order in the MRO for C (and due to monotonicity, any
  //    subclass).
}

/**
 * Gets a potential definition of the function `name` according to our approximation of
 * MRO for the class `cls` (see `getNextClassInMro` for more information).
 */
Function findFunctionAccordingToMro(Class cls, string name) {
  result = cls.getAMethod() and
  result.getName() = name
  or
  not exists(Function f | f.getName() = name and f = cls.getAMethod()) and
  result = findFunctionAccordingToMro(getNextClassInMro(cls), name)
}

/**
 * Gets a class that, from an approximated MRO calculation, might be the next class
 * after `cls` in the MRO for `startingClass`.
 *
 * Note: this is almost the same as `getNextClassInMro`, except we know the
 * `startingClass`, which can give slightly more precise results.
 *
 * See QLDoc for `getNextClassInMro`.
 */
Class getNextClassInMroKnownStartingClass(Class cls, Class startingClass) {
  cls.getBase(0) = classTracker(result).asExpr() and
  cls = getADirectSuperclass*(startingClass)
  or
  exists(Class sub, int i | sub = getADirectSuperclass*(startingClass) |
    sub.getBase(i) = classTracker(cls).asExpr() and
    sub.getBase(i + 1) = classTracker(result).asExpr() and
    not result = cls
  )
}

private Function findFunctionAccordingToMroKnownStartingClass(
  Class cls, Class startingClass, string name
) {
  result = cls.getAMethod() and
  result.getName() = name and
  cls = getADirectSuperclass*(startingClass)
  or
  not exists(Function f | f.getName() = name and f = cls.getAMethod()) and
  result =
    findFunctionAccordingToMroKnownStartingClass(getNextClassInMroKnownStartingClass(cls,
        startingClass), startingClass, name)
}

/**
 * Gets a potential definition of the function `name` according to our approximation of
 * MRO for the class `cls` (see `getNextClassInMroKnownStartingClass` for more information).
 *
 * Note: this is almost the same as `findFunctionAccordingToMro`, except we know the
 * `startingClass`, which can give slightly more precise results.
 */
pragma[inline]
Function findFunctionAccordingToMroKnownStartingClass(Class startingClass, string name) {
  result = findFunctionAccordingToMroKnownStartingClass(startingClass, startingClass, name)
}

// =============================================================================
// attribute trackers
// =============================================================================
/** Gets a reference to the attribute read `attr` */
private TypeTrackingNode attrReadTracker(TypeTracker t, AttrRead attr) {
  t.start() and
  result = attr and
  attr.getObject() in [
      classTracker(_), classInstanceTracker(_), selfTracker(_), clsTracker(_),
      superCallNoArgumentTracker(_), superCallTwoArgumentTracker(_, _)
    ]
  or
  exists(TypeTracker t2 | result = attrReadTracker(t2, attr).track(t2, t))
}

/** Gets a reference to the attribute read `attr` */
Node attrReadTracker(AttrRead attr) { attrReadTracker(TypeTracker::end(), attr).flowsTo(result) }

// =============================================================================
// call and argument resolution
// =============================================================================
newtype TCallType =
  /** A call to a function that is not part of a class. */
  CallTypePlainFunction() or
  /**
   * A call to an "normal" method on a class instance.
   * Does not include staticmethods or classmethods.
   */
  CallTypeNormalMethod() or
  /** A call to a staticmethod. */
  CallTypeStaticMethod() or
  /** A call to a classmethod. */
  CallTypeClassMethod() or
  /**
   * A call to method on a class, not going through an instance method, such as
   *
   * ```py
   * class Foo:
   *     def method(self, arg):
   *         pass
   *
   * foo = Foo()
   * Foo.method(foo, 42)
   * ```
   */
  CallTypeMethodAsPlainFunction() or
  /** A call to a class. */
  CallTypeClass() or
  /** A call on a class instance, that goes to the `__call__` method of the class */
  CallTypeClassInstanceCall()

/** A type of call. */
class CallType extends TCallType {
  string toString() {
    this instanceof CallTypePlainFunction and
    result = "CallTypePlainFunction"
    or
    this instanceof CallTypeNormalMethod and
    result = "CallTypeNormalMethod"
    or
    this instanceof CallTypeStaticMethod and
    result = "CallTypeStaticMethod"
    or
    this instanceof CallTypeClassMethod and
    result = "CallTypeClassMethod"
    or
    this instanceof CallTypeMethodAsPlainFunction and
    result = "CallTypeMethodAsPlainFunction"
    or
    this instanceof CallTypeClass and
    result = "CallTypeClass"
    or
    this instanceof CallTypeClassInstanceCall and
    result = "CallTypeClassInstanceCall"
  }
}

// -------------------------------------
// method call resolution
// -------------------------------------
private module MethodCalls {
  /**
   * Holds if `call` is a call to a method `target` on an instance or class, where the
   * instance or class is not derived from an implicit `self`/`cls` argument to a method
   * -- for that, see `callWithinMethodImplicitSelfOrCls`.
   *
   * It is found by making an attribute read `attr` with the name `functionName` on a
   * reference to the class `cls`, or to an instance of the class `cls`. The reference the
   * attribute-read is made on is `self`.
   */
  pragma[noinline]
  private predicate directCall(
    CallNode call, Function target, string functionName, Class cls, AttrRead attr, Node self
  ) {
    target = findFunctionAccordingToMroKnownStartingClass(cls, functionName) and
    directCall_join(call, functionName, cls, attr, self)
  }

  /** Extracted to give good join order */
  pragma[noinline]
  private predicate directCall_join(
    CallNode call, string functionName, Class cls, AttrRead attr, Node self
  ) {
    (
      call.getFunction() = attrReadTracker(attr).asCfgNode() and
      attr.accesses(classTracker(cls), functionName)
      or
      call.getFunction() = attrReadTracker(attr).asCfgNode() and
      attr.accesses(classInstanceTracker(cls), functionName)
    ) and
    attr.accesses(self, functionName)
  }

  /**
   * Holds if `call` is a call to a method `target` derived from an implicit `self`/`cls`
   * argument to a method within the class `classWithMethod`.
   *
   * It is found by making an attribute read `attr` with the name `functionName` on a
   * reference to an implicit `self`/`cls` argument. The reference the attribute-read is
   * made on is `self`.
   */
  pragma[noinline]
  private predicate callWithinMethodImplicitSelfOrCls(
    CallNode call, Function target, string functionName, Class classWithMethod, AttrRead attr,
    Node self
  ) {
    target = findFunctionAccordingToMro(getADirectSubclass*(classWithMethod), functionName) and
    callWithinMethodImplicitSelfOrCls_join(call, functionName, classWithMethod, attr, self)
  }

  /** Extracted to give good join order */
  pragma[noinline]
  private predicate callWithinMethodImplicitSelfOrCls_join(
    CallNode call, string functionName, Class classWithMethod, AttrRead attr, Node self
  ) {
    (
      call.getFunction() = attrReadTracker(attr).asCfgNode() and
      attr.accesses(clsTracker(classWithMethod), functionName)
      or
      call.getFunction() = attrReadTracker(attr).asCfgNode() and
      attr.accesses(selfTracker(classWithMethod), functionName)
    ) and
    attr.accesses(self, functionName)
  }

  /**
   * Holds if `call` is a call to a method `target`, derived from a use of `super`, either
   * as:
   *
   * (1) `super(SomeClass, obj)`, where the first argument is a reference to the class
   * `classUsedInSuper`, and the second argument is `self`.
   *
   * (2) `super()`. This implicit version can only happen within a method in a class.
   * The implicit first argument is the class the call happens within `classUsedInSuper`.
   * The implicit second argument is the `self`/`cls` parameter of the method this happens
   * within.
   *
   * The method call is found by making an attribute read `attr` with the name
   * `functionName` on the return value from the `super` call.
   */
  pragma[noinline]
  predicate fromSuper(
    CallNode call, Function target, string functionName, Class classUsedInSuper, AttrRead attr,
    Node self
  ) {
    target = findFunctionAccordingToMro(getNextClassInMro(classUsedInSuper), functionName) and
    fromSuper_join(call, functionName, classUsedInSuper, attr, self)
  }

  /** Extracted to give good join order */
  pragma[noinline]
  private predicate fromSuper_join(
    CallNode call, string functionName, Class classUsedInSuper, AttrRead attr, Node self
  ) {
    call.getFunction() = attrReadTracker(attr).asCfgNode() and
    (
      exists(Function func |
        attr.accesses(superCallNoArgumentTracker(func), functionName) and
        // Requiring enclosing scope of function to be a class is a little too
        // restrictive, since it is possible to use `super()` in a function defined inside
        // the method, where the first argument to the nested-function will be used as
        // implicit self argument. In practice I don't expect this to be a problem, and we
        // did not support this with points-to either.
        func.getEnclosingScope() = classUsedInSuper and
        self.(ParameterNode).getParameter() = func.getArg(0)
      )
      or
      attr.accesses(superCallTwoArgumentTracker(classUsedInSuper, self), functionName)
    )
  }

  predicate resolveMethodCall(ControlFlowNode call, Function target, CallType type, Node self) {
    (
      directCall(call, target, _, _, _, self)
      or
      callWithinMethodImplicitSelfOrCls(call, target, _, _, _, self)
      or
      fromSuper(call, target, _, _, _, self)
    ) and
    (
      // normal method call
      type instanceof CallTypeNormalMethod and
      (
        self = classInstanceTracker(_)
        or
        self = selfTracker(_)
      ) and
      not isStaticmethod(target) and
      not isClassmethod(target)
      or
      // method as plain function call
      type instanceof CallTypeMethodAsPlainFunction and
      self = classTracker(_) and
      not isStaticmethod(target) and
      not isClassmethod(target)
      or
      // staticmethod call
      type instanceof CallTypeStaticMethod and
      isStaticmethod(target)
      or
      // classmethod call
      type instanceof CallTypeClassMethod and
      isClassmethod(target)
    )
  }
}

import MethodCalls

// -------------------------------------
// class call resolution
// -------------------------------------
/**
 * Holds when `call` is a call to the class `cls`.
 *
 * NOTE: We have this predicate mostly to be able to compare with old point-to
 * call-graph resolution. So it could be removed in the future.
 */
predicate resolveClassCall(CallNode call, Class cls) {
  call.getFunction() = classTracker(cls).asCfgNode()
  or
  // `cls()` inside a classmethod (which also contains `type(self)()` inside a method)
  exists(Class classWithMethod |
    call.getFunction() = clsTracker(classWithMethod).asCfgNode() and
    getADirectSuperclass*(cls) = classWithMethod
  )
}

/**
 * Gets a function, either `__init__` or `__new__` as specified by `funcName`, that will
 * be invoked when `cls` is constructed -- where the function lookup is based on our MRO
 * calculation.
 */
Function invokedFunctionFromClassConstruction(Class cls, string funcName) {
  // as described in https://docs.python.org/3/reference/datamodel.html#object.__new__
  // __init__ will only be called when __new__ returns an instance of the class (which
  // is not a requirement). However, for simplicity, we assume that __init__ will always
  // be called.
  funcName in ["__init__", "__new__"] and
  result = findFunctionAccordingToMroKnownStartingClass(cls, funcName)
}

/**
 * Holds when `call` is a call on a class instance, that goes to the `__call__` method
 * of the class.
 *
 * See https://docs.python.org/3/reference/datamodel.html#object.__call__
 */
predicate resolveClassInstanceCall(CallNode call, Function target, Node self) {
  exists(Class cls |
    call.getFunction() = classInstanceTracker(cls).asCfgNode() and
    target = findFunctionAccordingToMroKnownStartingClass(cls, "__call__")
    or
    call.getFunction() = selfTracker(cls).asCfgNode() and
    target = findFunctionAccordingToMro(getADirectSubclass*(cls), "__call__")
  |
    self.asCfgNode() = call.getFunction()
  )
}

// -------------------------------------
// overall call resolution
// -------------------------------------
/**
 * Holds if `call` is a call to the `target`, with call-type `type`.
 */
predicate resolveCall(ControlFlowNode call, Function target, CallType type) {
  type instanceof CallTypePlainFunction and
  call.(CallNode).getFunction() = functionTracker(target).asCfgNode() and
  not exists(Class cls | cls.getAMethod() = target)
  or
  resolveMethodCall(call, target, type, _)
  or
  type instanceof CallTypeClass and
  exists(Class cls |
    resolveClassCall(call, cls) and
    target = invokedFunctionFromClassConstruction(cls, _)
  )
  or
  type instanceof CallTypeClassInstanceCall and
  resolveClassInstanceCall(call, target, _)
}

// =============================================================================
// Argument resolution
// =============================================================================
/**
 * Holds if the argument of `call` at position `apos` is `arg`. This is just a helper
 * predicate that maps ArgumentPositions to the arguments of the underlying `CallNode`.
 */
private predicate normalCallArg(CallNode call, Node arg, ArgumentPosition apos) {
  exists(int index |
    apos.isPositional(index) and
    arg.asCfgNode() = call.getArg(index)
  )
  or
  exists(string name |
    apos.isKeyword(name) and
    arg.asCfgNode() = call.getArgByName(name)
  )
  or
  exists(int index |
    apos.isStarArgs(index) and
    arg.asCfgNode() = call.getStarArg() and
    call.getStarArg().getNode() = call.getNode().getPositionalArg(index).(Starred).getValue()
  )
  or
  apos.isDictSplat() and
  (
    arg.asCfgNode() = call.getKwargs()
    or
    arg = TSynthDictSplatArgumentNode(call)
  )
}

/**
 * Gets the argument of `call` at position `apos`, if any, where we can resolve `call`
 * to `target` with CallType `type`.
 *
 * It might seem like it's enough to know the CallType to resolve arguments. The reason
 * we also need the `target`, is to avoid cross-talk. In the example below, assuming
 * that `Foo` and `Bar` define their own `meth` methods, we might end up passing _both_
 * `foo` and `bar` to both `Foo.meth` and `Bar.meth`, which is wrong. Since the
 * attribute access uses the same name, we need to also distinguish on the resolved
 * target, to know which of the two objects to pass as the self argument.
 *
 *
 * ```py
 * foo = Foo()
 * bar = Bar()
 * if cond:
 *     func = foo.meth
 * else:
 *     func = bar.meth
 * func(42)
 * ```
 *
 * Note: If `Bar.meth` and `Foo.meth` resolves to the same function, we will end up
 * sending both `self` arguments to that function, which is by definition the right thing to do.
 */
predicate getCallArg(
  ControlFlowNode call, Function target, CallType type, Node arg, ArgumentPosition apos
) {
  // normal calls with a real call node
  resolveCall(call, target, type) and
  call instanceof CallNode and
  (
    type instanceof CallTypePlainFunction and
    normalCallArg(call, arg, apos)
    or
    // self argument for normal method calls
    type instanceof CallTypeNormalMethod and
    apos.isSelf() and
    resolveMethodCall(call, target, type, arg) and
    // dataflow lib has requirement that arguments and calls are in same enclosing callable.
    exists(CfgNode cfgNode | cfgNode.getNode() = call |
      cfgNode.getEnclosingCallable() = arg.getEnclosingCallable()
    )
    or
    // cls argument for classmethod calls
    type instanceof CallTypeClassMethod and
    apos.isSelf() and
    resolveMethodCall(call, target, type, arg) and
    (arg = classTracker(_) or arg = clsTracker(_)) and
    // dataflow lib has requirement that arguments and calls are in same enclosing callable.
    exists(CfgNode cfgNode | cfgNode.getNode() = call |
      cfgNode.getEnclosingCallable() = arg.getEnclosingCallable()
    )
    or
    // normal arguments for method calls
    (
      type instanceof CallTypeNormalMethod or
      type instanceof CallTypeStaticMethod or
      type instanceof CallTypeClassMethod
    ) and
    normalCallArg(call, arg, apos)
    or
    // method as plain function call.
    //
    // argument index 0 of call has position self (and MUST be given as positional
    // argument in call). This also means that call-arguments are shifted by 1, such
    // that argument index 1 of call has argument position 0
    type instanceof CallTypeMethodAsPlainFunction and
    (
      apos.isSelf() and arg.asCfgNode() = call.(CallNode).getArg(0)
      or
      not apos.isPositional(_) and normalCallArg(call, arg, apos)
      or
      exists(ArgumentPosition normalPos, int index |
        apos.isPositional(index - 1) and
        normalPos.isPositional(index) and
        normalCallArg(call, arg, normalPos)
      )
    )
    or
    // class call
    type instanceof CallTypeClass and
    (
      // only pass synthetic node for created object to __init__, and not __new__ since
      // __new__ is a classmethod.
      target = invokedFunctionFromClassConstruction(_, "__init__") and
      apos.isSelf() and
      arg = TSyntheticPreUpdateNode(call)
      or
      normalCallArg(call, arg, apos)
    )
    or
    // call on class instance, which goes to `__call__` method
    type instanceof CallTypeClassInstanceCall and
    (
      apos.isSelf() and
      resolveClassInstanceCall(call, target, arg)
      or
      normalCallArg(call, arg, apos)
    )
  )
}

// =============================================================================
// DataFlowCall
// =============================================================================
newtype TDataFlowCall =
  TNormalCall(CallNode call, Function target, CallType type) { resolveCall(call, target, type) }
  or
  /** A synthesized call inside a summarized callable */
  TSummaryCall(FlowSummaryImpl::Public::SummarizedCallable c, Node receiver) {
    FlowSummaryImpl::Private::summaryCallbackRange(c, receiver)
  }

/** A call that is taken into account by the global data flow computation. */
abstract class DataFlowCall extends TDataFlowCall {
  /** Gets a textual representation of this element. */
  abstract string toString();

  /** Get the callable to which this call goes. */
  abstract DataFlowCallable getCallable();

  /** Gets the argument at position `apos`, if any. */
  abstract ArgumentNode getArgument(ArgumentPosition apos);

  /** Get the control flow node representing this call, if any. */
  abstract ControlFlowNode getNode();

  /** Gets the enclosing callable of this call. */
  abstract DataFlowCallable getEnclosingCallable();

  /** Gets the location of this dataflow call. */
  abstract Location getLocation();

  /**
   * Holds if this element is at the specified location.
   * The location spans column `startcolumn` of line `startline` to
   * column `endcolumn` of line `endline` in file `filepath`.
   * For more information, see
   * [Locations](https://codeql.github.com/docs/writing-codeql-queries/providing-locations-in-codeql-queries/).
   */
  predicate hasLocationInfo(
    string filepath, int startline, int startcolumn, int endline, int endcolumn
  ) {
    this.getLocation().hasLocationInfo(filepath, startline, startcolumn, endline, endcolumn)
  }
}

/** A call found in the program source (as opposed to a synthesised call). */
abstract class ExtractedDataFlowCall extends DataFlowCall {
  override Location getLocation() { result = this.getNode().getLocation() }
}

/**
 * A resolved call in source code with an underlying `CallNode`.
 *
 * This is considered normal, compared with special calls such as `obj[0]` calling the
 * `__getitem__` method on the object. However, this also includes calls that go to the
 * `__call__` special method.
 */
class NormalCall extends ExtractedDataFlowCall, TNormalCall {
  CallNode call;
  Function target;
  CallType type;

  NormalCall() { this = TNormalCall(call, target, type) }

  override string toString() {
    // note: if we used toString directly on the CallNode we would get
    //     `ControlFlowNode for func()`
    // but the `ControlFlowNode` part is just clutter, so we go directly to the AST node
    // instead.
    result = call.getNode().toString()
  }

  override ControlFlowNode getNode() { result = call }

  override DataFlowCallable getEnclosingCallable() { result.getScope() = call.getScope() }

  override DataFlowCallable getCallable() { result.(DataFlowFunction).getScope() = target }

  override ArgumentNode getArgument(ArgumentPosition apos) {
    getCallArg(call, target, type, result, apos)
  }

  /** Gets the `CallType` of this call. */
  CallType getCallType() { result = type }
}

/**
 * A call to a summarized callable, a `LibraryCallable`.
 *
 * We currently exclude all resolved calls. This means that a call to, say, `map`, which
 * is a `ClassCall`, cannot currently be given a summary.
 * We hope to lift this restriction in the future and include all potential calls to summaries
 * in this class.
 */
class LibraryCall extends DataFlowCall {
  LibraryCall() {
    // TODO(call-graph): implement this!
    none()
  }

  override string toString() {
    // TODO(call-graph): implement this!
    none()
  }

  // We cannot refer to a `LibraryCallable` here,
  // as that could in turn refer to type tracking.
  // This call will be tied to a `LibraryCallable` via
  // `getViableCallabe` when the global data flow is assembled.
  override DataFlowCallable getCallable() { none() }

  override ArgumentNode getArgument(ArgumentPosition apos) {
    // TODO(call-graph): implement this!
    none()
  }

  override ControlFlowNode getNode() {
    // TODO(call-graph): implement this!
    none()
  }

  override DataFlowCallable getEnclosingCallable() {
    // TODO(call-graph): implement this!
    none()
  }

  override Location getLocation() {
    // TODO(call-graph): implement this!
    none()
  }
}

/**
 * A synthesized call inside a callable with a flow summary.
 *
 * For example, in
 * ```python
 * map(lambda x: x + 1, [1, 2, 3])
 * ```
 *
 * there is a synthesized call to the lambda argument inside `map`.
 */
class SummaryCall extends DataFlowCall, TSummaryCall {
  private FlowSummaryImpl::Public::SummarizedCallable c;
  private Node receiver;

  SummaryCall() { this = TSummaryCall(c, receiver) }

  /** Gets the data flow node that this call targets. */
  Node getReceiver() { result = receiver }

  override DataFlowCallable getEnclosingCallable() { result.asLibraryCallable() = c }

  override DataFlowCallable getCallable() { none() }

  override ArgumentNode getArgument(ArgumentPosition apos) { none() }

  override ControlFlowNode getNode() { none() }

  override string toString() { result = "[summary] call to " + receiver + " in " + c }

  override Location getLocation() { none() }
}

/**
 * The value of a parameter at function entry, viewed as a node in a data
 * flow graph.
 */
abstract class ParameterNodeImpl extends Node {
  /** Gets the `Parameter` this `ParameterNode` represents. */
  abstract Parameter getParameter();

  /**
   * Holds if this node is the parameter of callable `c` at the
   * position `ppos`.
   */
  predicate isParameterOf(DataFlowCallable c, ParameterPosition ppos) {
    this = c.getParameter(ppos)
  }
}

/** A parameter for a library callable with a flow summary. */
class SummaryParameterNode extends ParameterNodeImpl, TSummaryParameterNode {
  private FlowSummaryImpl::Public::SummarizedCallable sc;
  private ParameterPosition pos;

  SummaryParameterNode() { this = TSummaryParameterNode(sc, pos) }

  override Parameter getParameter() { none() }

  override predicate isParameterOf(DataFlowCallable c, ParameterPosition ppos) {
    sc = c.asLibraryCallable() and ppos = pos
  }

  override DataFlowCallable getEnclosingCallable() { result.asLibraryCallable() = sc }

  override string toString() { result = "parameter " + pos + " of " + sc }

  // Hack to return "empty location"
  override predicate hasLocationInfo(
    string file, int startline, int startcolumn, int endline, int endcolumn
  ) {
    file = "" and
    startline = 0 and
    startcolumn = 0 and
    endline = 0 and
    endcolumn = 0
  }
}

/** A data-flow node used to model flow summaries. */
class SummaryNode extends Node, TSummaryNode {
  private FlowSummaryImpl::Public::SummarizedCallable c;
  private FlowSummaryImpl::Private::SummaryNodeState state;

  SummaryNode() { this = TSummaryNode(c, state) }

  override DataFlowCallable getEnclosingCallable() { result.asLibraryCallable() = c }

  override string toString() { result = "[summary] " + state + " in " + c }

  // Hack to return "empty location"
  override predicate hasLocationInfo(
    string file, int startline, int startcolumn, int endline, int endcolumn
  ) {
    file = "" and
    startline = 0 and
    startcolumn = 0 and
    endline = 0 and
    endcolumn = 0
  }
}

private class SummaryReturnNode extends SummaryNode, ReturnNode {
  private ReturnKind rk;

  SummaryReturnNode() { FlowSummaryImpl::Private::summaryReturnNode(this, rk) }

  override ReturnKind getKind() { result = rk }
}

private class SummaryArgumentNode extends SummaryNode, ArgumentNode {
  SummaryArgumentNode() { FlowSummaryImpl::Private::summaryArgumentNode(_, this, _) }

  override predicate argumentOf(DataFlowCall call, ArgumentPosition pos) {
    FlowSummaryImpl::Private::summaryArgumentNode(call, this, pos)
  }
}

private class SummaryPostUpdateNode extends SummaryNode, PostUpdateNodeImpl {
  private Node pre;

  SummaryPostUpdateNode() { FlowSummaryImpl::Private::summaryPostUpdateNode(this, pre) }

  override Node getPreUpdateNode() { result = pre }
}

/** Gets a viable run-time target for the call `call`. */
DataFlowCallable viableCallable(ExtractedDataFlowCall call) {
  result = call.getCallable()
  or
  // A call to a library callable with a flow summary
  // In this situation we can not resolve the callable from the call,
  // as that would make data flow depend on type tracking.
  // Instead we resolve the call from the summary.
  exists(LibraryCallable callable |
    result = TLibraryCallable(callable) and
    call.getNode() = callable.getACall().getNode()
  )
}

// =============================================================================
// Remaining required data-flow things
// =============================================================================
private newtype TReturnKind = TNormalReturnKind()

/**
 * A return kind. A return kind describes how a value can be returned
 * from a callable. For Python, this is simply a method return.
 */
class ReturnKind extends TReturnKind {
  /** Gets a textual representation of this element. */
  string toString() { result = "return" }
}

/** A data flow node that represents a value returned by a callable. */
abstract class ReturnNode extends Node {
  /** Gets the kind of this return node. */
  ReturnKind getKind() { any() }
}

/** A data flow node that represents a value returned by a callable. */
class ExtractedReturnNode extends ReturnNode, CfgNode {
  // See `TaintTrackingImplementation::returnFlowStep`
  ExtractedReturnNode() { node = any(Return ret).getValue().getAFlowNode() }

  override ReturnKind getKind() { any() }
}

/** A data-flow node that represents the output of a call. */
abstract class OutNode extends Node {
  /** Gets the underlying call, where this node is a corresponding output of kind `kind`. */
  abstract DataFlowCall getCall(ReturnKind kind);
}

private module OutNodes {
  /**
   * A data-flow node that reads a value returned directly by a callable.
   */
  class ExprOutNode extends OutNode, ExprNode {
    private DataFlowCall call;

    ExprOutNode() { call.(ExtractedDataFlowCall).getNode() = this.getNode() }

    override DataFlowCall getCall(ReturnKind kind) {
      result = call and
      kind = kind
    }
  }

  private class SummaryOutNode extends SummaryNode, OutNode {
    SummaryOutNode() { FlowSummaryImpl::Private::summaryOutNode(_, this, _) }

    override DataFlowCall getCall(ReturnKind kind) {
      FlowSummaryImpl::Private::summaryOutNode(result, this, kind)
    }
  }
}

/**
 * Gets a node that can read the value returned from `call` with return kind
 * `kind`.
 */
OutNode getAnOutNode(DataFlowCall call, ReturnKind kind) { call = result.getCall(kind) }
