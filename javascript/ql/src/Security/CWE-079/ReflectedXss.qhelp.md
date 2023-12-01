Directly writing user input (for example, an HTTP request parameter) to an HTTP response without properly sanitizing the input first, allows for a cross-site scripting vulnerability.

This kind of vulnerability is also called *reflected* cross-site scripting, to distinguish it from other types of cross-site scripting.


## Recommendation
To guard against cross-site scripting, consider using contextual output encoding/escaping before writing user input to the response, or one of the other solutions that are mentioned in the references.


## Example
The following example code writes part of an HTTP request (which is controlled by the user) directly to the response. This leaves the website vulnerable to cross-site scripting.

{% sample src="examples/ReflectedXss.js" %}
Sanitizing the user-controlled data prevents the vulnerability:

{% sample src="examples/ReflectedXssGood.js" %}

## References
* OWASP: [XSS (Cross Site Scripting) Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html).
* OWASP [Types of Cross-Site Scripting](https://www.owasp.org/index.php/Types_of_Cross-Site_Scripting).
* Wikipedia: [Cross-site scripting](http://en.wikipedia.org/wiki/Cross-site_scripting).
{% cwe-references %}
