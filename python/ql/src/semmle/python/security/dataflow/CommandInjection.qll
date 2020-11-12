/**
 * Provides a taint-tracking configuration for detecting command injection
 * vulnerabilities.
 *
 * Note, for performance reasons: only import this file if
 * `CommandInjectionConfiguration` is needed, otherwise the
 * `CommandInjectionCustomizations` module should be imported instead.
 */

import python
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.TaintTracking
import semmle.python.Concepts
import semmle.python.dataflow.new.RemoteFlowSources
private import CommandInjectionCustomizations

/**
 * A taint-tracking configuration for detecting command injection vulnerabilities.
 */
class CommandInjectionConfiguration extends TaintTracking::Configuration {
  CommandInjectionConfiguration() { this = "CommandInjectionConfiguration" }

  override predicate isSource(DataFlow::Node source) { source instanceof CommandInjection::Source }

  override predicate isSink(DataFlow::Node sink) { sink instanceof CommandInjection::Sink }

  override predicate isSanitizer(DataFlow::Node sanitizer) {
    sanitizer instanceof CommandInjection::Sanitizer
  }

  override predicate isSanitizerIn(DataFlow::Node sanitizerIn) {
    sanitizerIn instanceof CommandInjection::SanitizerIn
  }

  override predicate isSanitizerOut(DataFlow::Node sanitizerOut) {
    sanitizerOut instanceof CommandInjection::SanitizerOut
  }

  override predicate isSanitizerGuard(DataFlow::BarrierGuard sanitizerGuard) {
    sanitizerGuard instanceof CommandInjection::SanitizerGuard
  }

  override predicate isAdditionalTaintStep(DataFlow::Node node1, DataFlow::Node node2) {
    any(CommandInjection::AdditionalTaintStep s).step(node1, node2)
  }
}
