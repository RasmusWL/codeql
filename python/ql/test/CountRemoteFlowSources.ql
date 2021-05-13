/** How many RemoteFlowSource of each type in a project */

import python
import semmle.python.Concepts
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.RemoteFlowSources

from string type, int c
where
  c =
    strictcount(RemoteFlowSource src |
      type = src.getSourceType() and
      exists(src.getLocation().getFile().getRelativePath())
    )
select type, c
