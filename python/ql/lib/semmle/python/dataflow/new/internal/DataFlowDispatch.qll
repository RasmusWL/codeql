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
  // TODO(call-graph): implement this!
  /** For enclosing `ModuleVariableNode`s -- don't actually have calls. */
  TModule(Module m)

/** A callable. */
abstract class DataFlowCallable extends TDataFlowCallable {
  /** Gets a textual representation of this element. */
  abstract string toString();

  /** Gets the scope of this callable */
  abstract Scope getScope();

  /** Gets the location of this dataflow callable. */
  abstract Location getLocation();

  /** Gets the parameter at position `ppos`, if any. */
  abstract ParameterNode getParameter(ParameterPosition ppos);
}

/**
 * A module. This is not actually a callable, but we need this so a
 * `ModuleVariableNode` have an enclosing callable.
 */
class DataFlowModuleScope extends DataFlowCallable, TModule {
  Module mod;

  DataFlowModuleScope() { this = TModule(mod) }

  override string toString() { result = mod.toString() }

  override Module getScope() { result = mod }

  override Location getLocation() { result = mod.getLocation() }

  override ParameterNode getParameter(ParameterPosition ppos) { none() }
}

newtype TDataFlowCall =
  // TODO(call-graph): implement this!
  MkDataFlowCall()

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
  OutNode() {
    // TODO(call-graph): implement this!
    none()
  }
}

/**
 * Gets a node that can read the value returned from `call` with return kind
 * `kind`.
 */
OutNode getAnOutNode(DataFlowCall call, ReturnKind kind) {
  // TODO(call-graph): implement this!
  none()
}
