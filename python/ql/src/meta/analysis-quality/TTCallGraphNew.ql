/**
 * @name New call graph edge from using type-tracking instead of points-to
 * @problem.severity recommendation
 * @id py/meta/call-graph-new
 * @tags meta
 * @precision very-low
 */

import python
import CallGraphQuality

// in the `hist` function of plotting/_core.py a SINGLE call goes to 177 targets, that are all WRONG :|
// maybe I need to disable that flow into self parameter anyway :D
from CallNode call, int c
where
  c = strictcount(Target target | call.(TypeTrackingBasedCallGraph::ResolvableCall).getTarget() = target) and
  c > 50
select call, c order by c desc
