If an XPath expression is built using string concatenation, and the components of the concatenation include user input, a user is likely to be able to create a malicious XPath expression.


## Recommendation
If user input must be included in an XPath expression, pre-compile the query and use variable references to include the user input.

For example, when using the `github.com/ChrisTrenkamp/goxpath` API, you can do this by creating a function that takes an `*goxpath.Opts` structure. In this structure you can then set the values of the variable references. This function can then be specified when calling `Exec()`, `Exec{Bool|Num|Node}()`, `ParseExec()`, or `MustExec()`.


## Example
In the first example, the code accepts a username specified by the user, and uses this unvalidated and unsanitized value in an XPath expression. This is vulnerable to the user providing special characters or string sequences that change the meaning of the XPath expression to search for different values.

In the second example, the XPath expression is a hard-coded string that specifies some variables, which are safely resolved at runtime using the `goxpath.Opts` structure.

{% sample src="XPathInjection.go" %}

## References
* OWASP: [Testing for XPath Injection](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/09-Testing_for_XPath_Injection).
* OWASP: [XPath Injection](https://www.owasp.org/index.php/XPATH_Injection).
{% cwe-references %}
