/**
 * @name User controlled format string
 * @description Using a user-controlled format string can lead to denial of service (DoS) or information exposure.
 * @kind path-problem
 * @problem.severity ???
 * @sub-severity ???
 * @precision ???
 * @id py/format-string-injection
 * @tags security
 *       TODO: CWEs
 */

import python
import semmle.python.security.dataflow.FormatStringInjection
import DataFlow::PathGraph

from FormatStringInjectionConfiguration config, DataFlow::PathNode source, DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
select sink.getNode(), source, sink,
  "$@ flows to here and is used as the format specifier in a formatting operation.",
  source.getNode(), "A user-provided value"
// See if we find anything in https://lgtm.com/query/8589909545435613919/ before running on all projects
