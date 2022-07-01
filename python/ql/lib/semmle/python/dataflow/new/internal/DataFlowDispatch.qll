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

newtype TDataFlowCall = TNormalCall(CallNode call)

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

/** A normal call, with an underlying `CallNode`. */
abstract class NormalCall extends DataFlowCall, TNormalCall {
  CallNode call;

  NormalCall() { this = TNormalCall(call) }

  override string toString() { result = call.toString() }

  override ControlFlowNode getNode() { result = call }

  override DataFlowCallable getEnclosingCallable() { result.getScope() = call.getScope() }

  override ArgumentNode getArgument(ArgumentPosition apos) {
    exists(int index |
      apos.isPositional(index) and
      result.asCfgNode() = call.getArg(index)
    )
    or
    exists(string name |
      apos.isKeyword(name) and
      result.asCfgNode() = call.getArgByName(name)
    )
  }
}

/**
 * A call to a plain function, not including methods in general, but including
 * staticmethods accessed on a class reference (`MyClass.my_staticmethod()`).
 */
class PlainFunctionCall extends NormalCall {
  Function target;

  PlainFunctionCall() {
    call.getFunction() = functionTracker(target).asCfgNode() and
    not exists(Class cls | cls.getAMethod() = target)
  }

  override DataFlowCallable getCallable() { result.(DataFlowFunction).getScope() = target }
}

private TypeTrackingNode classTracker(TypeTracker t, Class cls) {
  t.start() and
  result.asExpr() = cls.getParent()
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

/**
 * Gets a first function called `name` in subclass search starting in `cls`.
 *
 * Note that this does NOT follow MRO precisely, so if you have `class C(A, B)`,
 * and _both_ `A` and `B` defines a method with `name`, you will get both of them as
 * results.
 *
 * However, in the case where there is no multiple inheritance, this will give a precise
 * answer.
 */
Function findFunctionStartingInClass(Class cls, string name) {
  result = cls.getAMethod() and
  result.getName() = name
  or
  not exists(Function f | f.getName() = name and f = cls.getAMethod()) and
  result = findFunctionStartingInClass(getADirectSuperclass(cls), name)
}

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
  exists(Function func |
    func = cls.getAMethod() and
    hasClassmethodDecorator(func)
  |
    result.asExpr() = func.getArg(0)
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

/**
 * A call to a method on a class.
 *
 * These are separated further to handle different argument passing, but share a core
 * logic of attribute lookup going through inheritance.
 */
abstract class MethodCall extends NormalCall {
  Function target;
  string functionName;
  Class cls;
  AttrRead attr;

  MethodCall() {
    // method calls on reference of class, or direct instance of class
    target = findFunctionStartingInClass(cls, functionName) and
    target.getName() = functionName and
    (
      call.getFunction() = classAttrTracker(attr).asCfgNode() and
      attr.accesses(classTracker(cls), functionName)
      or
      call.getFunction() = classInstanceAttrTracker(attr).asCfgNode() and
      attr.accesses(classInstanceTracker(cls), functionName)
    )
    or
    // method call on self/cls reference from within a method
    target = findFunctionStartingInClass(getADirectSubclass*(cls), functionName) and
    target.getName() = functionName and
    (
      call.getFunction() = clsAttrTracker(attr).asCfgNode() and
      attr.accesses(clsTracker(cls), functionName)
      or
      call.getFunction() = selfAttrTracker(attr).asCfgNode() and
      attr.accesses(selfTracker(cls), functionName)
    )
  }

  override DataFlowCallable getCallable() { result.(DataFlowFunction).getScope() = target }
}

/**
 * A call to an "normal" method on a class instance.
 * Does not include staticmethods or classmethods.
 *
 * See 'instance methods' in https://docs.python.org/3/reference/datamodel.html
 */
class NormalMethodCall extends MethodCall {
  Node self;

  NormalMethodCall() {
    attr.accesses(self, functionName) and
    (
      self = classInstanceTracker(cls)
      or
      self = selfTracker(cls)
    ) and
    not hasStaticmethodDecorator(target) and
    not hasClassmethodDecorator(target)
  }

  override ArgumentNode getArgument(ArgumentPosition apos) {
    result = super.getArgument(apos)
    or
    apos.isSelf() and
    result = self
  }
}

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
class MethodAsPlainFunctionCall extends MethodCall {
  MethodAsPlainFunctionCall() {
    attr.accesses(classTracker(cls), functionName) and
    not hasStaticmethodDecorator(target) and
    not hasClassmethodDecorator(target)
  }

  override ArgumentNode getArgument(ArgumentPosition apos) {
    apos.isSelf() and result.asCfgNode() = call.getArg(0)
    or
    exists(int index |
      apos.isPositional(index) and
      result.asCfgNode() = call.getArg(index + 1)
    )
    or
    exists(string name |
      apos.isKeyword(name) and
      result.asCfgNode() = call.getArgByName(name)
    )
  }
}

/** A call to a classmethod. */
class ClassmethodCall extends MethodCall {
  Node self;

  ClassmethodCall() {
    attr.accesses(self, functionName) and
    hasClassmethodDecorator(target)
  }

  override ArgumentNode getArgument(ArgumentPosition apos) {
    result = super.getArgument(apos)
    or
    // only set `self` argument when it's a class, and not when it's a class instance.
    apos.isSelf() and
    result = self and
    (
      self = classTracker(cls)
      or
      self = clsTracker(cls)
    )
  }
}

/** A call to a staticmethod. */
class StaticmethodCall extends MethodCall {
  StaticmethodCall() { hasStaticmethodDecorator(target) }
}

Function invokedFunctionFromClassConstruction(Class cls) {
  result = findFunctionStartingInClass(cls, "__new__")
  or
  // as described in https://docs.python.org/3/reference/datamodel.html#object.__new__
  // __init__ will only be called when __new__ returns an instance of the class (which
  // is not a requirement). However, for simplicity, we assume that __init__ will always
  // be called.
  result = findFunctionStartingInClass(cls, "__init__")
}

/** A call to a class. */
class ClassCall extends NormalCall {
  Class cls;

  ClassCall() { call.getFunction() = classTracker(cls).asCfgNode() }

  override DataFlowCallable getCallable() {
    result.(DataFlowFunction).getScope() = invokedFunctionFromClassConstruction(cls)
  }

  Class getClass() { result = cls }

  override ArgumentNode getArgument(ArgumentPosition apos) {
    // TODO: pass self, so writes in __init__ is captured by post-update node
    // apos.isSelf() and result.asCfgNode() = call.getArg(0)
    result = super.getArgument(apos)
  }
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
