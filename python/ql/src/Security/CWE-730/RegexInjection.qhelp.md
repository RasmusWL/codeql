Constructing a regular expression with unsanitized user input is dangerous as a malicious user may be able to modify the meaning of the expression. In particular, such a user may be able to provide a regular expression fragment that takes exponential time in the worst case, and use that to perform a Denial of Service attack.


## Recommendation
Before embedding user input into a regular expression, use a sanitization function such as `re.escape` to escape meta-characters that have a special meaning regarding regular expressions' syntax.


## Example
The following examples are based on a simple Flask web server environment.

The following example shows a HTTP request parameter that is used to construct a regular expression without sanitizing it first:

{% sample src="re_bad.py" %}
Instead, the request parameter should be sanitized first, for example using the function `re.escape`. This ensures that the user cannot insert characters which have a special meaning in regular expressions.

{% sample src="re_good.py" %}

## References
* OWASP: [Regular expression Denial of Service - ReDoS](https://www.owasp.org/index.php/Regular_expression_Denial_of_Service_-_ReDoS).
* Wikipedia: [ReDoS](https://en.wikipedia.org/wiki/ReDoS).
* Python docs: [re](https://docs.python.org/3/library/re.html).
* SonarSource: [RSPEC-2631](https://rules.sonarsource.com/python/type/Vulnerability/RSPEC-2631).
{% cwe-references %}
