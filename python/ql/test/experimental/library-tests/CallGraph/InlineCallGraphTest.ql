import python
import TestUtilities.InlineExpectationsTest
private import semmle.python.dataflow.new.internal.DataFlowDispatch as TT

/** A call graph edge resolved based on Type Trackers */
predicate pointsToCallEdge(CallNode call, Function callable) {
  exists(PythonFunctionValue funcValue |
    funcValue.getScope() = callable and
    call = funcValue.getACall()
  )
}

/** A call graph edge resolved based on Type Trackers */
predicate typeTrackerCallEdge(CallNode call, Function callable) {
  TT::TFunction(callable) = TT::viableCallable(TT::TNormalCall(call))
}

/** Holds if the call edge is from a class call. */
predicate typeTrackerClassCall(CallNode call, Function callable) {
  exists(TT::ClassCall cc |
    cc.getNode() = call and
    TT::TFunction(callable) = cc.getCallable()
  )
}

class CallGraphTest extends InlineExpectationsTest {
  CallGraphTest() { this = "CallGraphTest" }

  override string getARelevantTag() { result in ["pt", "tt"] }

  override predicate hasActualResult(Location location, string element, string tag, string value) {
    exists(location.getFile().getRelativePath()) and
    exists(CallNode call, Function target |
      tag = "tt" and
      typeTrackerCallEdge(call, target)
      or
      tag = "pt" and
      pointsToCallEdge(call, target)
    |
      location = call.getLocation() and
      element = call.toString() and
      if call.getLocation().getFile() = target.getLocation().getFile()
      then value = betterQualName(target)
      else value = target.getLocation().getFile() + ":" + betterQualName(target)
    )
  }
}

bindingset[func]
string betterQualName(Function func) {
  // note: `target.getQualifiedName` for Lambdas is just "lambda", so is not very useful :|
  not func.isLambda() and
  result = func.getQualifiedName()
  or
  func.isLambda() and
  result =
    "lambda[" + func.getLocation().getFile().getShortName() + ":" +
      func.getLocation().getStartLine() + ":" + func.getLocation().getStartColumn() + "]"
}

query predicate debug_callableNotUnique(Function callable, string message) {
  exists(Function f |
    f != callable and
    f.getQualifiedName() = callable.getQualifiedName() and
    f.getLocation().getFile() = callable.getLocation().getFile()
  ) and
  message =
    "Qualified function name '" + callable.getQualifiedName() +
      "' is not unique within its file. Please fix."
}

query predicate pointsTo_found_typeTracker_notFound(CallNode call, string qualname) {
  exists(Function target |
    pointsToCallEdge(call, target) and
    not typeTrackerCallEdge(call, target) and
    qualname = betterQualName(target)
  )
}

query predicate pointsTo_notFound_typeTracker_found(CallNode call, string qualname) {
  exists(Function target |
    not pointsToCallEdge(call, target) and
    typeTrackerCallEdge(call, target) and
    qualname = betterQualName(target) and
    // We filter out result differences for points-to and type-tracking for class calls,
    // since otherwise it gives too much noise (these are just handled differently
    // between the two).
    not typeTrackerClassCall(call, target)
  )
}
