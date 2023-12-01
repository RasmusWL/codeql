If an XPath expression is built using string concatenation, and the components of the concatenation include user input, it makes it very easy for a user to create a malicious XPath expression.


## Recommendation
If user input must be included in an XPath expression, either sanitize the data or use variable references to safely embed it without altering the structure of the expression.


## Example
In this example, the code accepts a user name specified by the user, and uses this unvalidated and unsanitized value in an XPath expression constructed using the `xpath` package. This is vulnerable to the user providing special characters or string sequences that change the meaning of the XPath expression to search for different values.

{% sample src="examples/XpathInjectionBad.js" %}
Instead, embed the user input using the variable replacement mechanism offered by `xpath`:

{% sample src="examples/XpathInjectionGood.js" %}

## References
* OWASP: [Testing for XPath Injection](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/07-Input_Validation_Testing/09-Testing_for_XPath_Injection).
* OWASP: [XPath Injection](https://www.owasp.org/index.php/XPATH_Injection).
* npm: [xpath](https://www.npmjs.com/package/xpath).
{% cwe-references %}
