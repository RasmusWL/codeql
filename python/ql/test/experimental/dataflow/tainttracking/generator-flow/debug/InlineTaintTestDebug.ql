/**
 * @kind path-problem
 */

import experimental.meta.InlineTaintTest
import DataFlow::PathGraph
import semmle.python.dataflow.new.internal.DataFlowImplCommon as DFIC

class ConfWithSourceBarrierIn extends Conf::TestTaintTrackingConfiguration {
  override predicate isSanitizerIn(DataFlow::Node node) { this.isSource(node) }
}

from ConfWithSourceBarrierIn config, DataFlow::PathNode source, DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
// and sink.getNode().getLocation().getStartLine() = 34
select sink.getNode(), source, sink, "wat"
