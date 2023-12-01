External Control of File Name or Path, also called File Path Injection, is a vulnerability by which a file path is created using data from outside the application (such as the HTTP request). It allows an attacker to traverse through the filesystem and access arbitrary files.


## Recommendation
Unsanitized user-provided data must not be used to construct file paths. In order to prevent File Path Injection, it is recommended to avoid concatenating user input directly into the file path. Instead, user input should be checked against allowed or disallowed paths (for example, the path must be within `/user_content/` or must not be within `/internal`), ensuring that neither path traversal using `../` nor URL encoding is used to evade these checks.


## Example
The following examples show the bad case and the good case respectively. The `BAD` methods show an HTTP request parameter being used directly to construct a file path without validating the input, which may cause file leakage. In the `GOOD` method, the file path is validated.

{% sample src="FilePathInjection.java" %}

## References
* OWASP: [Path Traversal](https://owasp.org/www-community/attacks/Path_Traversal).
* Veracode: [External Control of File Name or Path Flaw](https://www.veracode.com/security/dotnet/cwe-73).
{% cwe-references %}
