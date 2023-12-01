A common way to check that a user-supplied path `SUBDIR` falls inside a directory `DIR` is to use `getCanonicalPath()` to remove any path-traversal elements and then check that `DIR` is a prefix. However, if `DIR` is not slash-terminated, this can unexpectedly allow access to siblings of `DIR`.

See also `java/partial-path-traversal-from-remote`, which is similar to this query but only flags instances with evidence of remote exploitability.

{% render "PartialPathTraversalRemainder.inc.qhelp.md" %}

