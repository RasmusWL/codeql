Constructing a regular expression with unsanitized user input is dangerous, since a malicious user may be able to modify the meaning of the expression. In particular, such a user may be able to provide a regular expression fragment that takes exponential time in the worst case, and use that to perform a Denial of Service attack.


## Recommendation
Before embedding user input into a regular expression, use a sanitization function such as `Regexp.escape` to escape meta-characters that have special meaning.


## Example
The following examples construct regular expressions from an HTTP request parameter without sanitizing it first:

{% sample src="examples/regexp_injection_bad.rb" %}
Instead, the request parameter should be sanitized first. This ensures that the user cannot insert characters that have special meanings in regular expressions.

{% sample src="examples/regexp_injection_good.rb" %}

## References
* OWASP: [Regular expression Denial of Service - ReDoS](https://www.owasp.org/index.php/Regular_expression_Denial_of_Service_-_ReDoS).
* Wikipedia: [ReDoS](https://en.wikipedia.org/wiki/ReDoS).
* Ruby: [Regexp.escape](https://ruby-doc.org/core-3.0.2/Regexp.html#method-c-escape).
{% cwe-references %}
