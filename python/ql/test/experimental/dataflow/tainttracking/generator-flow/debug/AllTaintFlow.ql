/**
 * @kind path-problem
 */

import python
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.TaintTracking
import DataFlow::PathGraph

class AllFlow extends TaintTracking::Configuration {
  AllFlow() { this = "AllFlow" }

  override predicate isSource(DataFlow::Node node) {
    any()
    // node.getLocation().getStartLine() = 13 and
    // node.getLocation().getFile().getShortName() = "test_taint.py"
  }

  override predicate isSink(DataFlow::Node node) {
    node.getLocation().getStartLine() = 10 and
    node.getLocation().getFile().getShortName() = "test_taint.py"
  }
}

from AllFlow cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink) and not source = sink
select sink, source, sink, "taint flow from $@ to $@", source.getNode(),
  source.getNode().toString(), sink.getNode(), sink.getNode().toString()
