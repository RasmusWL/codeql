Constructing a regular expression with unsanitized user input is dangerous, since a malicious user may be able to modify the meaning of the expression. They may be able to cause unexpected program behaviour, or perform a denial-of-service attack. For example, they may provide a regular expression fragment that takes exponential time to evaluate in the worst case.


## Recommendation
Before embedding user input into a regular expression, use a sanitization function such as `NSRegularExpression::escapedPattern(for:)` to escape meta-characters that have special meaning.


## Example
The following examples construct regular expressions from user input without sanitizing it first:

{% sample src="RegexInjectionBad.swift" %}
If user input is used to construct a regular expression it should be sanitized first. This ensures that the user cannot insert characters that have special meanings in regular expressions.

{% sample src="RegexInjectionGood.swift" %}

## References
* OWASP: [Regular expression Denial of Service - ReDoS](https://www.owasp.org/index.php/Regular_expression_Denial_of_Service_-_ReDoS).
* Wikipedia: [ReDoS](https://en.wikipedia.org/wiki/ReDoS).
* Swift: [NSRegularExpression.escapedPattern(for:)](https://developer.apple.com/documentation/foundation/nsregularexpression/1408386-escapedpattern).
{% cwe-references %}
