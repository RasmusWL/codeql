import java

from ControlFlowNode n, ControlFlowNode succ
where
  succ = n.getASuccessor() and
  n.getLocation().getFile().getExtension() = "java" and
  not n.getLocation().getFile().getStem() = "PopulateRuntimeException"
select n, succ
