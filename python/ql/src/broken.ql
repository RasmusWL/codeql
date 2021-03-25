/**
 * @name Use of a broken or weak cryptographic hashing algorithm on sensitive data
 * @description Using broken or weak cryptographic hashing algorithms can compromise security.
 * @kind path-problem
 * @problem.severity warning
 * @precision TODO
 * @id py/weak-cryptographic-hashing-algorithm
 * @tags security
 *       external/cwe/cwe-327
 */

import python
import HasProblems
import DataFlow::PathGraph

from
  WeakCryptographicHashingAlgorithmConfiguration config, DataFlow::PathNode source,
  DataFlow::PathNode sink, Cryptography::HashingAlgorithm algorithm
where
  config.hasFlowPath(source, sink) and
  sink.getNode().(Cryptography::CryptographicOperation).getAlgorithm() = algorithm
select sink.getNode(), source, sink,
  "$@ is used in a broken or weak cryptographic hashing algorithm (" + algorithm.getName() + ").",
  source.getNode(), "Sensitive data"
