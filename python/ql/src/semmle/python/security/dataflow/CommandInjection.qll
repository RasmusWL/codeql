/**
 * Provides a taint-tracking configuration for detecting command injection
 * vulnerabilities.
 *
 * Note, for performance reasons: only import this file if
 * `CommandInjectionConfiguration` is needed, otherwise the
 * `CommandInjectionSpecification` module should be imported instead.
 */

import python
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.TaintTracking
import semmle.python.Concepts
import semmle.python.dataflow.new.RemoteFlowSources
import CommandInjectionSpecification

/**
 * A taint-tracking configuration for detecting command injection vulnerabilities.
 */
class CommandInjectionConfiguration extends TaintTracking::Configuration {
  CommandInjectionSpecification spec;

  CommandInjectionConfiguration() { this = "CommandInjectionConfiguration" }

  override predicate isSource(DataFlow::Node source) { spec.isSource(source) }

  override predicate isSink(DataFlow::Node sink) { spec.isSink(sink) }

  override predicate isSanitizer(DataFlow::Node node) { spec.isSanitizer(node) }

  override predicate isSanitizerIn(DataFlow::Node node) { spec.isSanitizerIn(node) }

  override predicate isSanitizerOut(DataFlow::Node node) { spec.isSanitizerOut(node) }

  override predicate isSanitizerGuard(DataFlow::BarrierGuard guard) { spec.isSanitizerGuard(guard) }

  override predicate isAdditionalTaintStep(DataFlow::Node node1, DataFlow::Node node2) {
    spec.isAdditionalTaintStep(node1, node2)
  }
}
