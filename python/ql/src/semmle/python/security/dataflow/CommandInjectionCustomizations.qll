/**
 * Provides a taint-tracking configuration for detecting command injection
 * vulnerabilities.
 */

import python
import Unit
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.TaintTracking
import semmle.python.Concepts
import semmle.python.dataflow.new.RemoteFlowSources

module CommandInjection {
  /**
   * A Source for command injection vulnerabilities.
   *
   * See `isSource` on `TaintTracking::Configuration`.
   */
  abstract class Source extends DataFlow::Node { }

  /**
   * A Sink for command injection vulnerabilities.
   *
   * See `isSink` on `TaintTracking::Configuration`.
   */
  abstract class Sink extends DataFlow::Node { }

  /**
   * A Sanitizer for command injection vulnerabilities.
   *
   * See `isSanitizer` on `TaintTracking::Configuration`.
   */
  abstract class Sanitizer extends DataFlow::Node { }

  /**
   * A SanitizerIn for command injection vulnerabilities.
   *
   * See `isSanitizerIn` on `TaintTracking::Configuration`.
   */
  abstract class SanitizerIn extends DataFlow::Node { }

  /**
   * A SanitizerOut for command injection vulnerabilities.
   *
   * See `isSanitizerOut` on `TaintTracking::Configuration`.
   */
  abstract class SanitizerOut extends DataFlow::Node { }

  /**
   * A SanitizerGuard for command injection vulnerabilities.
   *
   * See `isSanitizerGuard` on `TaintTracking::Configuration`.
   */
  abstract class SanitizerGuard extends DataFlow::BarrierGuard { }

  /**
   * An additional taint step for command injection vulnerabilities.
   *
   * See `isAdditionalTaintStep` on `TaintTracking::Configuration`.
   */
  class AdditionalTaintStep extends Unit {
    /**
     * Holds if the step from `node1` to `node2` should be considered a taint
     * step for command injection.
     */
    abstract predicate step(DataFlow::Node node1, DataFlow::Node node2);
  }

  // ---------------------------------------------------------------------------
  /** A source of remote user input, as a source for code injection. */
  class RemoteFlowSourceAsSource extends Source {
    RemoteFlowSourceAsSource() { this instanceof RemoteFlowSource }
  }

  /** A `SystemCommandExecution` consdiered as a code injection sink */
  class SystemCommandExecutionSink extends Sink {
    SystemCommandExecutionSink() {
      this = any(SystemCommandExecution e).getCommand() and
      // Since the implementation of standard library functions such `os.popen` looks like
      // ```py
      // def popen(cmd, mode="r", buffering=-1):
      //     ...
      //     proc = subprocess.Popen(cmd, ...)
      // ```
      // any time we would report flow to the `os.popen` sink, we can ALSO report the flow
      // from the `cmd` parameter to the `subprocess.Popen` sink -- obviously we don't
      // want that.
      //
      // However, simply removing taint edges out of a sink is not a good enough solution,
      // since we would only flag one of the `os.system` calls in the following example
      // due to use-use flow
      // ```py
      // os.system(cmd)
      // os.system(cmd)
      // ```
      //
      // Best solution I could come up with is to exclude all sinks inside the modules of
      // known sinks. This does have a downside: If we have overlooked a function in any
      // of these, that internally runs a command, we no longer give an alert :| -- and we
      // need to keep them updated (which is hard to remember)
      //
      // This does not only affect `os.popen`, but also the helper functions in
      // `subprocess`. See:
      // https://github.com/python/cpython/blob/fa7ce080175f65d678a7d5756c94f82887fc9803/Lib/os.py#L974
      // https://github.com/python/cpython/blob/fa7ce080175f65d678a7d5756c94f82887fc9803/Lib/subprocess.py#L341
      not this.getScope().getEnclosingModule().getName() in [
          "os", "subprocess", "platform", "popen2"
        ]
    }
  }
}
