If an XPath expression is built using string concatenation, and the components of the concatenation include user input, a user is likely to be able to create a malicious XPath expression.


## Recommendation
If user input must be included in an XPath expression, pre-compile the query and use variable references to include the user input.

When using the `System.Xml.XPath` API, this can be done by creating a custom subtype of `System.Xml.Xsl.XsltContext`, and implementing `ResolveVariable(String, String)` to return the user provided data. This custom context can be specified for a given `XPathExpression` using `XPathExpression.SetContext()`. For more details, see the "User Defined Functions and Variables" webpage in the list of references.


## Example
In the first example, the code accepts a user name specified by the user, and uses this unvalidated and unsanitized value in an XPath expression. This is vulnerable to the user providing special characters or string sequences that change the meaning of the XPath expression to search for different values.

In the second example, the XPath expression is a hard-coded string that specifies some variables, which are safely replaced at runtime using a custom `XsltContext` that looks up the variables in an `XsltArgumentList`.

{% sample src="XPathInjection.cs" %}

## References
* OWASP: [Testing for XPath Injection](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/09-Testing_for_XPath_Injection).
* OWASP: [XPath Injection](https://www.owasp.org/index.php/XPATH_Injection).
* MSDN: [User Defined Functions and Variables](https://msdn.microsoft.com/en-us/library/dd567715.aspx).
{% cwe-references %}
