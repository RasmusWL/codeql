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
  TypePlainFunctionCall() or
  TypeNormalMethodCall() or
  TypeStaticMethodCall() or
  TypeClassMethodCall() or
  TypeMethodAsPlainFunctionCall() or
  TypeClassCall()

class CallType extends TCallType {
  string toString() {
    this instanceof TypePlainFunctionCall and
    result = "TypePlainFunctionCall"
    or
    this instanceof TypeNormalMethodCall and
    result = "TypeNormalMethodCall"
    or
    this instanceof TypeStaticMethodCall and
    result = "TypeStaticMethodCall"
    or
    this instanceof TypeClassMethodCall and
    result = "TypeClassMethodCall"
    or
    this instanceof TypeMethodAsPlainFunctionCall and
    result = "TypeMethodAsPlainFunctionCall"
    or
    this instanceof TypeClassCall and
    result = "TypeClassCall"
  }
}

// TODO: this has TERRIBLE performance though
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
    type instanceof TypeNormalMethodCall and
    (
      self = classInstanceTracker(_)
      or
      self = selfTracker(_)
    ) and
    not hasStaticmethodDecorator(target) and
    not hasClassmethodDecorator(target)
    or
    // method as plain function call
    type instanceof TypeMethodAsPlainFunctionCall and
    self = classTracker(_) and
    not hasStaticmethodDecorator(target) and
    not hasClassmethodDecorator(target)
    or
    // staticmethod call
    type instanceof TypeStaticMethodCall and
    hasStaticmethodDecorator(target)
    or
    // classmethod call
    type instanceof TypeClassMethodCall and
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
  type instanceof TypePlainFunctionCall and
  call.(CallNode).getFunction() = functionTracker(target).asCfgNode() and
  not exists(Class cls | cls.getAMethod() = target)
  or
  resolveMethodCall(call, target, type, _)
  or
  type instanceof TypeClassCall and
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

// TODO: need to highlight that target is actually needed, to avoid cross-talk in
// if cond:
//     func = objx.setx
// else:
//     func = objy.sety
//
// # What we're testing for is whether both objects are passed as self to both methods,
// # which would be wrong.
//
// func(42)
//
predicate getCallArg(ControlFlowNode call, Function target, CallType type, Node arg, ArgumentPosition apos) {
  // normal calls with a real call node
  resolveCall(call, target, type) and
  call instanceof CallNode and
  (
    type instanceof TypePlainFunctionCall and
    normalCallArg(call, arg, apos)
    or
    // self argument for normal method calls/cls argument for classmethod calls
    (type instanceof TypeNormalMethodCall or type instanceof TypeClassMethodCall) and
    apos.isSelf() and
    resolveMethodCall(call, target, type, arg)
    or
    // normal arguments for method calls
    (
      type instanceof TypeNormalMethodCall or
      type instanceof TypeStaticMethodCall or
      type instanceof TypeClassMethodCall
    ) and
    normalCallArg(call, arg, apos)
    or
    // method as plain function call.
    //
    // argument index 0 of call has position self (and MUST be given as positional
    // argument in call). This also means that call-arguments are shifted by 1, such
    // that argument index 1 of call has argument position 0
    type instanceof TypeMethodAsPlainFunctionCall and
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
    type instanceof TypeClassCall and
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

class NewNormalCall extends DataFlowCall, TNormalCall {
  CallNode call;
  Function target;
  CallType type;

  NewNormalCall() { this = TNormalCall(call, target, type) }

  override string toString() { result = "[" + type + "->" + target.getQualifiedName() + "]" + call.toString() }

  override ControlFlowNode getNode() { result = call }

  override DataFlowCallable getEnclosingCallable() { result.getScope() = call.getScope() }

  override DataFlowCallable getCallable() { result.(DataFlowFunction).getScope() = target }

  override ArgumentNode getArgument(ArgumentPosition apos) { getCallArg(call, target, type, result, apos) }
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

// /** A normal call, with an underlying `CallNode`. */
// abstract class NormalCall extends DataFlowCall, TNormalCall {
//   CallNode call;
//   NormalCall() { this = TNormalCall(call) }
//   override string toString() { result = call.toString() }
//   override ControlFlowNode getNode() { result = call }
//   override DataFlowCallable getEnclosingCallable() { result.getScope() = call.getScope() }
//   override ArgumentNode getArgument(ArgumentPosition apos) {
//     exists(int index |
//       apos.isPositional(index) and
//       result.asCfgNode() = call.getArg(index)
//     )
//     or
//     exists(string name |
//       apos.isKeyword(name) and
//       result.asCfgNode() = call.getArgByName(name)
//     )
//   }
// }
// class PlainFunctionCall extends NormalCall {
//   Function target;
//   PlainFunctionCall() {
//     call.getFunction() = functionTracker(target).asCfgNode() and
//     not exists(Class cls | cls.getAMethod() = target)
//   }
//   override DataFlowCallable getCallable() { result.(DataFlowFunction).getScope() = target }
//   // override ArgumentNode getArgument(ArgumentPosition apos) { result = super.getArgument(apos) }
// }
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
    // TODO: we actually want the inner-most function that contains the expression,
    // in case of nested function definitions
    func.contains(call.asExpr())
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
 * inheritance chains (such as the result `C` for `cls=B` in the example below -- this
 * might be difficult to see if the definition of `D` is located in an other file)
 *
 * For more info on the C3 MRO used in Python see:
 * - https://docs.python.org/3/glossary.html#term-method-resolution-order
 * - https://www.python.org/download/releases/2.3/mro/
 */
private Class getNextClassInMro(Class cls) {
  // class A(B, ...):
  // `B` can be the next class after `A` in MRO.
  cls.getBase(0) = classTracker(result).asExpr()
  or
  // class A(B, C, D):
  // - `C` can be the next class after `B` in MRO.
  // - `D` can be the next class after `C` in MRO.
  // TODO: in some cases, C can be next class after superclass of B in MRO (when that superclass is the last in the MRO of B not in MRO of C or in MRO of D)
  exists(Class sub, int i |
    sub.getBase(i) = classTracker(cls).asExpr() and
    sub.getBase(i + 1) = classTracker(result).asExpr() and
    not result = cls
  )
  // There are two important properties for MRO computed with C3 in Python:
  //
  // 1) monotonicity: if C1 precedes C2 in the MRO of C, then C1 precedes C2 in the MRO
  //    of any subclass of C.
  // 2) local precedence ordering: if C1 precedes C2 in the list of superclasses, they
  //    will keep the same order in the MRO for C (and due to monotonicity, any
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

/**
 * Holds if `call` is a call to a method `target` on an instance or class, where the
 * instance or class is not derived from an implicit `self`/`cls` argument to a method
 * -- for that, see `callWithinMethodImplicitSelfOrCls`.
 *
 * It is found by making an attribute read `attr` with the name `functionName` on a
 * reference to the class `cls`, or to an instance of the class `cls`. The reference the
 * attribute-read is made on is `self`.
 */
private predicate directCall(
  CallNode call, Function target, string functionName, Class cls, AttrRead attr, Node self
) {
  // method calls on reference of class, or direct instance of class
  target = findFunctionAccordingToMroKnownStartingClass(cls, cls, functionName) and
  target.getName() = functionName and
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
 * Holds if `call` is a call to a method `target` derived from an implicit `self`/`cls`
 * argument to a method within the class `methodWithinClass`.
 *
 * It is found by making an attribute read `attr` with the name `functionName` on a
 * reference to an implicit `self`/`cls` argument. The reference the attribute-read is
 * made on is `self`.
 */
private predicate callWithinMethodImplicitSelfOrCls(
  CallNode call, Function target, string functionName, Class methodWithinClass, AttrRead attr,
  Node self
) {
  // method call on self/cls reference from within a method
  target = findFunctionAccordingToMro(getADirectSubclass*(methodWithinClass), functionName) and
  target.getName() = functionName and
  (
    call.getFunction() = clsAttrTracker(attr).asCfgNode() and
    attr.accesses(clsTracker(methodWithinClass), functionName)
    or
    call.getFunction() = selfAttrTracker(attr).asCfgNode() and
    attr.accesses(selfTracker(methodWithinClass), functionName)
  ) and
  attr.accesses(self, functionName)
}

predicate oops(
  CallNode call, Function target, string functionName, Class classUsedInSuper, AttrRead attr,
  Node self
) {
  fromSuper(call, target, functionName, classUsedInSuper, attr, self) and
  not self instanceof ArgumentNode
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
predicate fromSuper(
  CallNode call, Function target, string functionName, Class classUsedInSuper, AttrRead attr,
  Node self
) {
  // method call on self/cls reference from within a method
  target.getName() = functionName and
  call.getFunction() = superCallAttrTracker(attr).asCfgNode() and
  (
    exists(Function func |
      attr.accesses(superCallNoArgumentTracker(func), functionName) and
      // TODO: Handling of nested scopes, and nested classes
      func.getEnclosingScope() = classUsedInSuper and
      self.(ParameterNode).getParameter() = func.getArg(0)
    )
    or
    attr.accesses(superCallTwoArgumentTracker(classUsedInSuper, self), functionName)
  ) and
  target = findFunctionAccordingToMro(getNextClassInMro(classUsedInSuper), functionName)
}

// /**
//  * A call to a method on a class.
//  *
//  * These are separated further to handle different argument passing, but share a core
//  * logic of attribute lookup going through inheritance.
//  */
// abstract class MethodCall extends NormalCall {
//   Function target;
//   Node self;
//   MethodCall() {
//     directCall(call, target, _, _, _, self)
//     or
//     callWithinMethodImplicitSelfOrCls(call, target, _, _, _, self)
//     or
//     fromSuper(call, target, _, _, _, self)
//   }
//   override DataFlowCallable getCallable() { result.(DataFlowFunction).getScope() = target }
// }
// /**
//  * A call to an "normal" method on a class instance.
//  * Does not include staticmethods or classmethods.
//  *
//  * See 'instance methods' in https://docs.python.org/3/reference/datamodel.html
//  */
// class NormalMethodCall extends MethodCall {
//   NormalMethodCall() {
//     (
//       self = classInstanceTracker(_)
//       or
//       self = selfTracker(_)
//     ) and
//     not hasStaticmethodDecorator(target) and
//     not hasClassmethodDecorator(target)
//   }
//   override ArgumentNode getArgument(ArgumentPosition apos) {
//     result = super.getArgument(apos)
//     or
//     apos.isSelf() and
//     result = self
//   }
//   // override DataFlowCallable getCallable() { result.(DataFlowFunction).getScope() = target }
//   // override DataFlowCallable getCallable() { result = super.getCallable() }
// }
// /**
//  * A call to method on a class, not going through an instance method, such as
//  *
//  * ```py
//  * class Foo:
//  *     def method(self, arg):
//  *         pass
//  *
//  * foo = Foo()
//  * Foo.method(foo, 42)
//  * ```
//  */
// class MethodAsPlainFunctionCall extends MethodCall {
//   MethodAsPlainFunctionCall() {
//     self = classTracker(_) and
//     not hasStaticmethodDecorator(target) and
//     not hasClassmethodDecorator(target)
//   }
//   override ArgumentNode getArgument(ArgumentPosition apos) {
//     apos.isSelf() and result.asCfgNode() = call.getArg(0)
//     or
//     exists(int index |
//       apos.isPositional(index) and
//       result.asCfgNode() = call.getArg(index + 1)
//     )
//     or
//     exists(string name |
//       apos.isKeyword(name) and
//       result.asCfgNode() = call.getArgByName(name)
//     )
//   }
// }
// /** A call to a classmethod. */
// class ClassmethodCall extends MethodCall {
//   ClassmethodCall() { hasClassmethodDecorator(target) }
//   override ArgumentNode getArgument(ArgumentPosition apos) {
//     result = super.getArgument(apos)
//     or
//     // only set `self` argument when it's a class, and not when it's a class instance.
//     apos.isSelf() and
//     result = self and
//     (
//       self = classTracker(_)
//       or
//       self = clsTracker(_)
//     )
//   }
// }
// /** A call to a staticmethod. */
// class StaticmethodCall extends MethodCall {
//   StaticmethodCall() { hasStaticmethodDecorator(target) }
//   override ArgumentNode getArgument(ArgumentPosition apos) { result = super.getArgument(apos) }
// }
Function invokedFunctionFromClassConstruction(Class cls) {
  result = findFunctionAccordingToMroKnownStartingClass(cls, cls, "__new__")
  or
  // as described in https://docs.python.org/3/reference/datamodel.html#object.__new__
  // __init__ will only be called when __new__ returns an instance of the class (which
  // is not a requirement). However, for simplicity, we assume that __init__ will always
  // be called.
  result = findFunctionAccordingToMroKnownStartingClass(cls, cls, "__init__")
}

// /** A call to a class. */
// class ClassCall extends NormalCall {
//   Class cls;
//   ClassCall() { call.getFunction() = classTracker(cls).asCfgNode() }
//   override DataFlowCallable getCallable() {
//     result.(DataFlowFunction).getScope() = invokedFunctionFromClassConstruction(cls)
//   }
//   Class getClass() { result = cls }
//   override ArgumentNode getArgument(ArgumentPosition apos) {
//     apos.isSelf() and
//     result = TSyntheticPreUpdateNode(call)
//     or
//     result = super.getArgument(apos)
//   }
// }
predicate wat(DataFlowCall call, ArgumentPosition apos, Node arg) { arg = call.getArgument(apos) }

// Non-monotonic recursion:
// characteristic predicate of DataFlowDispatch::ClassCall
// --> DataFlowDispatch::classTracker
// --> DataFlowDispatch::classTracker
// --> LocalSources::LocalSourceNode::track
// --> TypeTracker::TypeTracker::step
// --> TypeTracker::StepSummary::step
// --> TypeTracker::Cached::stepCall
// --> TypeTracker::smallstepCall
// --> TypeTrackerSpecific::callStep
// -!->(via dispatch of DataFlowDispatch::DataFlowCall::getArgument) DataFlowDispatch::ClassCall
// --> characteristic predicate of DataFlowDispatch::ClassCall
//
// in human words:
// Wheter a call is a class call, depends on whether we can track a class reference
// using type-tracking. Type-tracking uses `getArgument` member-predicate to perform
// this type-tracking. SO, whether a call is a ClassCall depends on `getArgument`
// (through type tracking), and the results for _this_, depends on whether the call is a
// ClassCall... in conclusion, whether a call is a classcall depends on whether it's a class call :|
//
// The compiler thinks it _could_ be the case that getArgument had no results
// 1) if a call was part of ClassCall, that would be because we could track a class
//    value to the function of that call, and the step that might have allowed this
//    could have been a arg->param call step. However, now that this call is part of
//    ClassCall, the ClassCall.getArgument might be the most specific implementation,
//    and if that has no results we suddenly don't have a arg->param call step any
//    longer...
//
// or is it like this? I think it's a bit of a bollocks argument, since
// ClassCall.getArgument is going to happen in addition to the other most-specific
// implementations... it WONT remove previously valid results...
//
// ACTUALLY, if something could be BOTH a plain function call, and a
// method-as-plain-function-call, since plain function call doesn't override
// getArgument, the most-specific implementation will be the
// method-as-plain-function-call, and it won't be possible to treat arg0 as arg0 :O will
// have to test this out though :O
//
// Will need some better test setup, since I already wrote such a test, but that only
// covers that callables are resolved correctly, not that arguments are passed correctly :|
//
// I guess we do have the dataflow argument-passing tests that could be used :shrug:
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
