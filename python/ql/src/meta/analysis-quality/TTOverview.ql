/**
 * @name Overview from using type-tracking instead of points-to, for both call-graph and
 * argument passing
 * @id py/meta/type-tracking-overview
 * @precision very-low
 */

import python
import CallGraphQuality
import ArgumentPassing

from string part, string tag, int c
where
  part = "call-graph" and
  (
    tag = "SHARED" and
    c =
      count(CallNode call, Target target |
        target.isRelevant() and
        call.(PointsToBasedCallGraph::ResolvableCall).getTarget() = target and
        call.(TypeTrackingBasedCallGraph::ResolvableCall).getTarget() = target
      )
    or
    tag = "NEW" and
    c =
      count(CallNode call, Target target |
        target.isRelevant() and
        not call.(PointsToBasedCallGraph::ResolvableCall).getTarget() = target and
        call.(TypeTrackingBasedCallGraph::ResolvableCall).getTarget() = target
      )
    or
    tag = "MISSING" and
    c =
      count(CallNode call, Target target |
        target.isRelevant() and
        call.(PointsToBasedCallGraph::ResolvableCall).getTarget() = target and
        not call.(TypeTrackingBasedCallGraph::ResolvableCall).getTarget() = target
      )
  )
  or
  part = "argument-passing" and
  (
    tag = "SHARED" and
    c =
      count(ControlFlowNode arg, Parameter param |
        PointsToArgumentPassing::argumentPassing(arg, param) and
        TypeTrackingArgumentPassing::argumentPassing(arg, param)
      )
    or
    tag = "NEW" and
    c =
      count(ControlFlowNode arg, Parameter param |
        not PointsToArgumentPassing::argumentPassing(arg, param) and
        TypeTrackingArgumentPassing::argumentPassing(arg, param)
      )
    or
    tag = "MISSING" and
    c =
      count(ControlFlowNode arg, Parameter param |
        PointsToArgumentPassing::argumentPassing(arg, param) and
        not TypeTrackingArgumentPassing::argumentPassing(arg, param)
      )
  )
select part, tag, c order by part, tag
