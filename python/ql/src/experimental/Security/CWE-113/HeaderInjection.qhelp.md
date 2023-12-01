If an HTTP Header is built using string concatenation or string formatting, and the components of the concatenation include user input, a user is likely to be able to manipulate the response.


## Recommendation
User input should not be included in an HTTP Header.


## Example
In the following example, the code appends a user-provided value into a header.

{% sample src="header_injection.py" %}

## References
* OWASP: [HTTP Response Splitting](https://owasp.org/www-community/attacks/HTTP_Response_Splitting).
* Python Security: [HTTP header injection](https://python-security.readthedocs.io/vuln/http-header-injection.html).
* SonarSource: [RSPEC-5167](https://rules.sonarsource.com/python/RSPEC-5167).
{% cwe-references %}
