import python
import semmle.python.dataflow.TaintTracking
import semmle.python.web.HttpRequest
import semmle.python.security.strings.Untrusted

from ControlFlowNode node, TaintKind kind
where
    kind.taints(node) and
    node.getLocation().getFile().getShortName() = "parse.py" and
    node.getLocation().getStartLine() in [650 .. 747]
select node.getLocation(), node.getScope().(Function).getName(), node, kind
