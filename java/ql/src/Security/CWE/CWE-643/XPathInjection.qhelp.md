If an XPath expression is built using string concatenation, and the components of the concatenation include user input, it makes it very easy for a user to create a malicious XPath expression.


## Recommendation
If user input must be included in an XPath expression, either sanitize the data or pre-compile the query and use variable references to include the user input.

XPath injection can also be prevented by using XQuery.


## Example
In the first three examples, the code accepts a name and password specified by the user, and uses this unvalidated and unsanitized value in an XPath expression. This is vulnerable to the user providing special characters or string sequences that change the meaning of the XPath expression to search for different values.

In the fourth example, the code uses `setXPathVariableResolver` which prevents XPath injection.

The final two examples are for dom4j. They show an example of XPath injection and one method of preventing it.

{% sample src="XPathInjection.java" %}

## References
* OWASP: [Testing for XPath Injection](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/09-Testing_for_XPath_Injection).
* OWASP: [XPath Injection](https://owasp.org/www-community/attacks/XPATH_Injection).
{% cwe-references %}
