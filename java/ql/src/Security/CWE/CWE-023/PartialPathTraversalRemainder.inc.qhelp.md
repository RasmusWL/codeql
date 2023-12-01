
## Recommendation
If the user should only access items within a certain directory `DIR`, ensure that `DIR` is slash-terminated before checking that `DIR` is a prefix of the user-provided path, `SUBDIR`. Note, Java's `getCanonicalPath()` returns a **non**-slash-terminated path string, so a slash must be added to `DIR` if that method is used.


## Example
In this example, the `if` statement checks if `parent.getCanonicalPath()` is a prefix of `dir.getCanonicalPath()`. However, `parent.getCanonicalPath()` is not slash-terminated. This means that users that supply `dir` may be also allowed to access siblings of `parent` and not just children of `parent`, which is a security issue.

{% sample src="PartialPathTraversalBad.java" %}
In this example, the `if` statement checks if `parent.toPath()` is a prefix of `dir.normalize()`. Because `Path#startsWith` does the correct check that `dir` is a child of `parent`, users will not be able to access siblings of `parent`, as desired.

{% sample src="PartialPathTraversalGood.java" %}

## References
* OWASP: [Partial Path Traversal](https://owasp.org/www-community/attacks/Path_Traversal).
* CVE-2022-23457: [ ESAPI Vulnerability Report](https://github.com/ESAPI/esapi-java-legacy/blob/develop/documentation/GHSL-2022-008_The_OWASP_Enterprise_Security_API.md).
{% cwe-references %}
