A common way to check that a user-supplied path `SUBDIR` falls inside a directory `DIR` is to use `getCanonicalPath()` to remove any path-traversal elements and then check that `DIR` is a prefix. However, if `DIR` is not slash-terminated, this can unexpectedly allow accessing siblings of `DIR`.

See also `java/partial-path-traversal`, which is similar to this query, but may also flag non-remotely-exploitable instances of partial path traversal vulnerabilities.

{% render "PartialPathTraversalRemainder.inc.qhelp.md" %}

