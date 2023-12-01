Constructing a regular expression with unsanitized user input is dangerous as a malicious user may be able to modify the meaning of the expression. In particular, such a user may be able to provide a regular expression fragment that takes exponential time in the worst case, and use that to perform a Denial of Service attack.


## Recommendation
Before embedding user input into a regular expression, use a sanitization function such as lodash's `_.escapeRegExp` to escape meta-characters that have special meaning.


## Example
The following example shows a HTTP request parameter that is used to construct a regular expression without sanitizing it first:

{% sample src="examples/RegExpInjection.js" %}
Instead, the request parameter should be sanitized first, for example using the function `_.escapeRegExp` from the lodash package. This ensures that the user cannot insert characters which have a special meaning in regular expressions.

{% sample src="examples/RegExpInjectionGood.js" %}

## References
* OWASP: [Regular expression Denial of Service - ReDoS](https://www.owasp.org/index.php/Regular_expression_Denial_of_Service_-_ReDoS).
* Wikipedia: [ReDoS](https://en.wikipedia.org/wiki/ReDoS).
* npm: [lodash](https://www.npmjs.com/package/lodash).
{% cwe-references %}
