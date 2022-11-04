/**
 * @kind path-problem
 */

import python
import experimental.dataflow.testConfig
import DataFlow::PathGraph

class TestConfigurationWithBarrierIn extends TestConfiguration {
  override predicate isBarrierIn(DataFlow::Node node) { this.isSource(node) }
}

from TestConfigurationWithBarrierIn config, DataFlow::PathNode source, DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
select sink.getNode(), source, sink, "DataFlow"
