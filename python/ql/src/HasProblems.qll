import python
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.TaintTracking
import semmle.python.Concepts
import semmle.python.dataflow.new.RemoteFlowSources
import semmle.python.dataflow.new.BarrierGuards

/**
 * Provides a taint-tracking configuration for detecting use of a broken or weak cryptographic hashing algorithm on sensitive data.
 */
class WeakCryptographicHashingAlgorithmConfiguration extends TaintTracking::Configuration {
  WeakCryptographicHashingAlgorithmConfiguration() {
    this = "WeakCryptographicHashingAlgorithmConfiguration"
  }

  override predicate isSource(DataFlow::Node source) {
    none() // TODO
  }

  override predicate isSink(DataFlow::Node sink) {
    exists(
      Cryptography::CryptographicOperation operation, Cryptography::HashingAlgorithm algorithm
    |
      algorithm = operation.getAlgorithm() and
      algorithm.isWeak() and
      sink = operation.getAnInput()
    )
  }
}
