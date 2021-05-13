import python
import semmle.python.Concepts
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.RemoteFlowSources

from RemoteFlowSource src
where exists(src.getLocation().getFile().getRelativePath())
select src.getLocation(), src, src.getSourceType()
