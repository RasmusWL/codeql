import python

from ControlFlowNode node, string pointsToInfo
where
    node.getLocation().getFile().getRelativePath() = "top-level-folder/file.py" and
    node.getLocation().getStartLine() in [50..60] and
    (
        pointsToInfo = node.pointsTo().toString()
        or
        not exists(node.pointsTo()) and
        pointsToInfo = "<NO POINTS-TO>"
    ) and
    node instanceof BinaryExprNode
select node.getLocation(), node, pointsToInfo
