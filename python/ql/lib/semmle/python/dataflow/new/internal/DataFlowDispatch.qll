/**
 * INTERNAL: Do not use.
 *
 * TypeTracker based call-graph.
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
 */

private import python
private import DataFlowPublic

newtype TParameterPosition =
  TSelfParameterPosition() or
  TPositionalParameterPosition(int pos) { pos = any(Parameter p).getPosition() } or
  TKeywordParameterPosition(string name) { name = any(Parameter p).getName() }

/** A parameter position. */
class ParameterPosition extends TParameterPosition {
  /** Holds if this position represents a `self` parameter. */
  predicate isSelf() { this = TSelfParameterPosition() }

  /** Holds if this position represents a positional parameter at (0-based) `index`. */
  predicate isPositional(int index) { this = TPositionalParameterPosition(index) }

  /** Holds if this position represents a keyword parameter named `name`. */
  predicate isKeyword(string name) { this = TKeywordParameterPosition(name) }

  /** Gets a textual representation of this element. */
  string toString() {
    this.isSelf() and result = "self"
    or
    exists(int index | this.isPositional(index) and result = "position " + index)
    or
    exists(string name | this.isKeyword(name) and result = "keyword " + name)
  }
}

newtype TArgumentPosition =
  TSelfArgumentPosition() or
  TPositionalArgumentPosition(int pos) { exists(any(CallNode c).getArg(pos)) } or
  TKeywordArgumentPosition(string name) { exists(any(CallNode c).getArgByName(name)) }

/** An argument position. */
class ArgumentPosition extends TArgumentPosition {
  /** Holds if this position represents a `self` argument. */
  predicate isSelf() { this = TSelfArgumentPosition() }

  /** Holds if this position represents a positional argument at (0-based) `index`. */
  predicate isPositional(int index) { this = TPositionalArgumentPosition(index) }

  /** Holds if this position represents a keyword argument named `name`. */
  predicate isKeyword(string name) { this = TKeywordArgumentPosition(name) }

  /** Gets a textual representation of this element. */
  string toString() {
    this.isSelf() and result = "self"
    or
    exists(int pos | this.isPositional(pos) and result = "position " + pos)
    or
    exists(string name | this.isKeyword(name) and result = "keyword " + name)
  }
}

/** Holds if arguments at position `apos` match parameters at position `ppos`. */
pragma[inline]
predicate parameterMatch(ParameterPosition ppos, ArgumentPosition apos) {
  ppos.isSelf() and apos.isSelf()
  or
  exists(int index | ppos.isPositional(index) and apos.isPositional(index))
  or
  exists(string name | ppos.isKeyword(name) and apos.isKeyword(name))
}

newtype TDataFlowCallable =
  TFunction(Function func) or
  /** For enclosing `ModuleVariableNode`s -- a `TModule` don't actually have calls. */
  TModule(Module m)

/** A callable. */
abstract class DataFlowCallable extends TDataFlowCallable {
  /** Gets a textual representation of this element. */
  abstract string toString();

  /** Gets qualified name for this callable, if any. */
  abstract string getQualifiedName();

  /** Gets the scope of this callable */
  abstract Scope getScope();

  /** Gets the location of this dataflow callable. */
  abstract Location getLocation();

  /** Gets the parameter at position `ppos`, if any. */
  abstract ParameterNode getParameter(ParameterPosition ppos);
}

/** A callable function. */
abstract class DataFlowFunction extends DataFlowCallable, TFunction {
  Function func;

  DataFlowFunction() { this = TFunction(func) }

  override string toString() { result = func.toString() }

  override string getQualifiedName() { result = func.getQualifiedName() }

  override Function getScope() { result = func }

  override Location getLocation() { result = func.getLocation() }
}

/** A plain (non-method) function. */
class DataFlowPlainFunction extends DataFlowFunction {
  DataFlowPlainFunction() { not exists(Class cls | cls.getAMethod() = func) }

  override ParameterNode getParameter(ParameterPosition ppos) {
    exists(int index | ppos.isPositional(index) | result.getParameter() = func.getArg(index))
    or
    exists(string name | ppos.isKeyword(name) | result.getParameter() = func.getArgByName(name))
  }
}

/** A method, except staticmethods. */
class DataFlowMethod extends DataFlowFunction {
  Class cls;

  DataFlowMethod() {
    cls.getAMethod() = func and
    not hasStaticmethodDecorator(func)
  }

  /** Gets the class this function is a method of. */
  Class getClass() { result = cls }

  override ParameterNode getParameter(ParameterPosition ppos) {
    ppos.isSelf() and result.getParameter() = func.getArg(0)
    or
    exists(int index | ppos.isPositional(index) | result.getParameter() = func.getArg(index + 1))
    or
    exists(string name | ppos.isKeyword(name) | result.getParameter() = func.getArgByName(name))
  }
}

/** A staticmethod. */
class DataFlowStaticmethod extends DataFlowFunction {
  Class cls;

  DataFlowStaticmethod() {
    cls.getAMethod() = func and
    hasStaticmethodDecorator(func)
  }

  /** Gets the class this function is a method of. */
  Class getClass() { result = cls }

  override ParameterNode getParameter(ParameterPosition ppos) {
    exists(int index | ppos.isPositional(index) | result.getParameter() = func.getArg(index))
    or
    exists(string name | ppos.isKeyword(name) | result.getParameter() = func.getArgByName(name))
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
  CallTypeClass()

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
  }
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
    not hasStaticmethodDecorator(target) and
    not hasClassmethodDecorator(target)
    or
    // method as plain function call
    type instanceof CallTypeMethodAsPlainFunction and
    self = classTracker(_) and
    not hasStaticmethodDecorator(target) and
    not hasClassmethodDecorator(target)
    or
    // staticmethod call
    type instanceof CallTypeStaticMethod and
    hasStaticmethodDecorator(target)
    or
    // classmethod call
    type instanceof CallTypeClassMethod and
    hasClassmethodDecorator(target)
  )
}

/**
 * Holds when `call` is a call to the class `cls`.
 *
 * NOTE: We have this predicate mostly to be able to compare with old point-to
 * call-graph resolution. So it could be removed in the future.
 */
predicate resolveClassCall(CallNode call, Class cls) {
  call.getFunction() = classTracker(cls).asCfgNode()
}

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
    target = invokedFunctionFromClassConstruction(cls)
  )
}

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
    arg = classTracker(_) and
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
      apos.isSelf() and
      arg = TSyntheticPreUpdateNode(call)
      or
      normalCallArg(call, arg, apos)
    )
  )
}

newtype TDataFlowCall =
  TNormalCall(CallNode call, Function target, CallType type) { resolveCall(call, target, type) }

/** A dataflow call. */
abstract class DataFlowCall extends TDataFlowCall {
  /** Gets a textual representation of this element. */
  abstract string toString();

  /** Gets the location of this dataflow call. */
  Location getLocation() { result = this.getNode().getLocation() }

  /** Get the callable to which this call goes. */
  abstract DataFlowCallable getCallable();

  /** Get the control flow node representing this call. */
  abstract ControlFlowNode getNode();

  /** Gets the enclosing callable of this call. */
  abstract DataFlowCallable getEnclosingCallable();

  /** Gets the argument at position `apos`, if any. */
  abstract ArgumentNode getArgument(ArgumentPosition apos);
}

class NormalCall extends DataFlowCall, TNormalCall {
  CallNode call;
  Function target;
  CallType type;

  NormalCall() { this = TNormalCall(call, target, type) }

  override string toString() {
    // note: if we used toString directly on the CallNode we would get
    //    `ControlFlowNode for func()`
    // but the `ControlFlowNode` is just clutter, so we go directly to the AST node
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

/** Holds if the function has a `staticmethod` decorator. */
predicate hasStaticmethodDecorator(Function func) {
  exists(NameNode id | id.getId() = "staticmethod" and id.isGlobal() |
    func.getADecorator() = id.getNode()
  )
}

/** Holds if the function has a `classmethod` decorator. */
predicate hasClassmethodDecorator(Function func) {
  exists(NameNode id | id.getId() = "classmethod" and id.isGlobal() |
    func.getADecorator() = id.getNode()
  )
}

/**
 * Gets a reference to the Function `func`.
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
 * Gets a reference to the Function `func`.
 */
Node functionTracker(Function func) { functionTracker(TypeTracker::end(), func).flowsTo(result) }

/** Gets a call to `type`. */
private CallCfgNode getTypeCall() {
  exists(NameNode id | id.getId() = "type" and id.isGlobal() |
    result.getFunction().asCfgNode() = id
  )
}

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
  exists(TypeTracker t2 | result = classTracker(t2, cls).track(t2, t))
}

Node classTracker(Class cls) { classTracker(TypeTracker::end(), cls).flowsTo(result) }

private TypeTrackingNode classAttrTracker(TypeTracker t, AttrRead attr) {
  t.start() and
  attr.getObject() = classTracker(_) and
  result = attr
  or
  exists(TypeTracker t2 | result = classAttrTracker(t2, attr).track(t2, t))
}

Node classAttrTracker(AttrRead attr) { classAttrTracker(TypeTracker::end(), attr).flowsTo(result) }

private TypeTrackingNode classInstanceTracker(TypeTracker t, Class cls) {
  t.start() and
  result.(CallCfgNode).getFunction() = classTracker(cls)
  or
  exists(TypeTracker t2 | result = classInstanceTracker(t2, cls).track(t2, t))
}

Node classInstanceTracker(Class cls) {
  classInstanceTracker(TypeTracker::end(), cls).flowsTo(result)
}

private TypeTrackingNode classInstanceAttrTracker(TypeTracker t, AttrRead attr) {
  t.start() and
  attr.getObject() = classInstanceTracker(_) and
  result = attr
  or
  exists(TypeTracker t2 | result = classInstanceAttrTracker(t2, attr).track(t2, t))
}

Node classInstanceAttrTracker(AttrRead attr) {
  classInstanceAttrTracker(TypeTracker::end(), attr).flowsTo(result)
}

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

private TypeTrackingNode selfTracker(TypeTracker t, Class cls) {
  t.start() and
  exists(Function func |
    func = cls.getAMethod() and
    not hasStaticmethodDecorator(func) and
    not hasClassmethodDecorator(func)
  |
    result.asExpr() = func.getArg(0)
  )
  or
  exists(TypeTracker t2 | result = selfTracker(t2, cls).track(t2, t))
}

Node selfTracker(Class cls) { selfTracker(TypeTracker::end(), cls).flowsTo(result) }

private TypeTrackingNode selfAttrTracker(TypeTracker t, AttrRead attr) {
  t.start() and
  attr.getObject() = selfTracker(_) and
  result = attr
  or
  exists(TypeTracker t2 | result = selfAttrTracker(t2, attr).track(t2, t))
}

Node selfAttrTracker(AttrRead attr) { selfAttrTracker(TypeTracker::end(), attr).flowsTo(result) }

private TypeTrackingNode clsTracker(TypeTracker t, Class cls) {
  t.start() and
  (
    exists(Function func |
      func = cls.getAMethod() and
      hasClassmethodDecorator(func)
    |
      result.asExpr() = func.getArg(0)
    )
    or
    // type(self)
    result = getTypeCall() and
    result.(CallCfgNode).getArg(0) = selfTracker(cls)
  )
  or
  exists(TypeTracker t2 | result = clsTracker(t2, cls).track(t2, t))
}

Node clsTracker(Class cls) { clsTracker(TypeTracker::end(), cls).flowsTo(result) }

private TypeTrackingNode clsAttrTracker(TypeTracker t, AttrRead attr) {
  t.start() and
  attr.getObject() = clsTracker(_) and
  result = attr
  or
  exists(TypeTracker t2 | result = clsAttrTracker(t2, attr).track(t2, t))
}

Node clsAttrTracker(AttrRead attr) { clsAttrTracker(TypeTracker::end(), attr).flowsTo(result) }

/** Gets a reference to `super`. */
private TypeTrackingNode superTracker(TypeTracker t) {
  t.start() and
  exists(NameNode id | id.getId() = "super" and id.isGlobal() | result.asCfgNode() = id)
  or
  exists(TypeTracker t2 | result = superTracker(t2).track(t2, t))
}

/** Gets a reference to `super`. */
Node superTracker() { superTracker(TypeTracker::end()).flowsTo(result) }

/**
 * Gets a reference to the result of calling `super` without any argument, where the
 * call happened in the method `func` (either a method or a class-method).
 */
private TypeTrackingNode superCallNoArgumentTracker(TypeTracker t, Function func) {
  not hasStaticmethodDecorator(func) and
  t.start() and
  exists(CallCfgNode call | result = call |
    call.getFunction() = superTracker() and
    not exists(call.getArg(_)) and
    call.getScope() = func
  )
  or
  exists(TypeTracker t2 | result = superCallNoArgumentTracker(t2, func).track(t2, t))
}

/**
 * Gets a reference to the result of calling `super` without any argument, where the
 * call happened in the method `func`.
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
    call.getFunction() = superTracker() and
    call.getArg(0) = classTracker(cls) and
    call.getArg(1) = obj
  )
  or
  exists(TypeTracker t2 | result = superCallTwoArgumentTracker(t2, cls, obj).track(t2, t))
}

/**
 * Gets a reference to the result of calling `super` with 2 arguments, where the
 * first is a reference to the class `cls`, and the second argument is `obj`.
 */
Node superCallTwoArgumentTracker(Class cls, Node obj) {
  superCallTwoArgumentTracker(TypeTracker::end(), cls, obj).flowsTo(result)
}

/**
 * Gets a reference to an attribute lookup where the object is the result of a `super()`
 * call captured by either `superCallNoArgumentTracker` or `superCallTwoArgumentTracker`
 */
private TypeTrackingNode superCallAttrTracker(TypeTracker t, AttrRead attr) {
  t.start() and
  (
    attr.getObject() = superCallNoArgumentTracker(_)
    or
    attr.getObject() = superCallTwoArgumentTracker(_, _)
  ) and
  result = attr
  or
  exists(TypeTracker t2 | result = superCallAttrTracker(t2, attr).track(t2, t))
}

/**
 * Gets a reference to an attribute lookup where the object is the result of a `super()`
 * call captured by either `superCallNoArgumentTracker` or `superCallTwoArgumentTracker`
 */
Node superCallAttrTracker(AttrRead attr) {
  superCallAttrTracker(TypeTracker::end(), attr).flowsTo(result)
}

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

Function findFunctionAccordingToMroKnownStartingClass(Class cls, Class startingClass, string name) {
  result = cls.getAMethod() and
  result.getName() = name and
  cls = getADirectSuperclass*(startingClass)
  or
  not exists(Function f | f.getName() = name and f = cls.getAMethod()) and
  result =
    findFunctionAccordingToMroKnownStartingClass(getNextClassInMroKnownStartingClass(cls,
        startingClass), startingClass, name)
}

/** Extracted to give good join order */
pragma[noinline]
private predicate directCall_join(
  CallNode call, string functionName, Class cls, AttrRead attr, Node self
) {
  (
    call.getFunction() = classAttrTracker(attr).asCfgNode() and
    attr.accesses(classTracker(cls), functionName)
    or
    call.getFunction() = classInstanceAttrTracker(attr).asCfgNode() and
    attr.accesses(classInstanceTracker(cls), functionName)
  ) and
  attr.accesses(self, functionName)
}

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
  target = findFunctionAccordingToMroKnownStartingClass(cls, cls, functionName) and
  directCall_join(call, functionName, cls, attr, self)
}

/** Extracted to give good join order */
pragma[noinline]
private predicate callWithinMethodImplicitSelfOrCls_join(
  CallNode call, string functionName, Class methodWithinClass, AttrRead attr, Node self
) {
  (
    call.getFunction() = clsAttrTracker(attr).asCfgNode() and
    attr.accesses(clsTracker(methodWithinClass), functionName)
    or
    call.getFunction() = selfAttrTracker(attr).asCfgNode() and
    attr.accesses(selfTracker(methodWithinClass), functionName)
  ) and
  attr.accesses(self, functionName)
}

/**
 * Holds if `call` is a call to a method `target` derived from an implicit `self`/`cls`
 * argument to a method within the class `methodWithinClass`.
 *
 * It is found by making an attribute read `attr` with the name `functionName` on a
 * reference to an implicit `self`/`cls` argument. The reference the attribute-read is
 * made on is `self`.
 */
pragma[noinline]
private predicate callWithinMethodImplicitSelfOrCls(
  CallNode call, Function target, string functionName, Class methodWithinClass, AttrRead attr,
  Node self
) {
  target = findFunctionAccordingToMro(getADirectSubclass*(methodWithinClass), functionName) and
  callWithinMethodImplicitSelfOrCls_join(call, functionName, methodWithinClass, attr, self)
}

/** Extracted to give good join order */
pragma[noinline]
private predicate fromSuper_join(
  CallNode call, string functionName, Class classUsedInSuper, AttrRead attr, Node self
) {
  call.getFunction() = superCallAttrTracker(attr).asCfgNode() and
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

Function invokedFunctionFromClassConstruction(Class cls) {
  result = findFunctionAccordingToMroKnownStartingClass(cls, cls, "__new__")
  or
  // as described in https://docs.python.org/3/reference/datamodel.html#object.__new__
  // __init__ will only be called when __new__ returns an instance of the class (which
  // is not a requirement). However, for simplicity, we assume that __init__ will always
  // be called.
  result = findFunctionAccordingToMroKnownStartingClass(cls, cls, "__init__")
}

/** Gets a viable run-time target for the call `call`. */
DataFlowCallable viableCallable(DataFlowCall call) { result = call.getCallable() }

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
class ReturnNode extends CfgNode {
  Return ret;

  // See `TaintTrackingImplementation::returnFlowStep`
  ReturnNode() { node = ret.getValue().getAFlowNode() }

  /** Gets the kind of this return node. */
  ReturnKind getKind() { any() }
}

/** A data flow node that represents the output of a call. */
class OutNode extends CfgNode {
  DataFlowCall call;

  OutNode() { this.getNode() = call.getNode() }

  /** Gets the underlying call, where this node is a corresponding output of kind `kind`. */
  DataFlowCall getCall(ReturnKind kind) {
    result = call and
    kind = TNormalReturnKind()
  }
}

/**
 * Gets a node that can read the value returned from `call` with return kind
 * `kind`.
 */
OutNode getAnOutNode(DataFlowCall call, ReturnKind kind) { call = result.getCall(kind) }
