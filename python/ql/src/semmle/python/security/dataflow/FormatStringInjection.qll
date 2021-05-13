/**
 * Provides a taint-tracking configuration for detecting format string injection
 * vulnerabilities.
 */

import python
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.TaintTracking
import semmle.python.Concepts
import semmle.python.dataflow.new.RemoteFlowSources
import semmle.python.dataflow.new.BarrierGuards

/**
 * A taint-tracking configuration for detecting format string injection vulnerabilities.
 */
class FormatStringInjectionConfiguration extends TaintTracking::Configuration {
  FormatStringInjectionConfiguration() { this = "FormatStringInjectionConfiguration" }

  override predicate isSource(DataFlow::Node source) { source instanceof RemoteFlowSource }

  override predicate isSink(DataFlow::Node sink) {
    exists(CallNode call, DataFlow::AttrRead attr |
      call.getFunction() = attr.asCfgNode() and
      attr.getAttributeName() = "format" and
      sink = attr.getObject()
    )
    or
    exists(CallNode call |
      // TODO: Proper builtin handling
      call.getFunction().(NameNode).getId() = "format" and
      sink.asCfgNode() = call.getArg(1)
    )
   }

  override predicate isSanitizerGuard(DataFlow::BarrierGuard guard) {
    guard instanceof StringConstCompare
  }
}
