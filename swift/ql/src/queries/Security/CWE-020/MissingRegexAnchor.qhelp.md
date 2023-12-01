Sanitizing untrusted input with regular expressions is a common technique, but malicious actors may be able to embed one of the allowed patterns in an unexpected location. To prevent this, you should use anchors in your regular expressions, such as `^` or `$`.

Even if the matching is not done in a security-critical context, it may still cause undesirable behavior when the regular expression accidentally matches.


## Recommendation
Use anchors to ensure that regular expressions match at the expected locations.


## Example
The following example code attempts to check that a URL redirection will reach the `example.com` domain, and not a malicious site:

{% sample src="MissingRegexAnchorBad.swift" %}
However, this regular expression check can be easily bypassed, and a malicious actor could embed `http://www.example.com/` in the query string component of a malicious site. For example, `http://evil-example.net/?x=http://www.example.com/`. Instead, you should use anchors in the regular expression check:

{% sample src="MissingRegexAnchorGood.swift" %}
If you need to write a regular expression to match multiple hosts, you should include an anchor for all of the alternatives. For example, the regular expression `/^www\.example\.com|beta\.example\.com/` will match the host `evil.beta.example.com`, because the regular expression is parsed as `/(^www\.example\.com)|(beta\.example\.com)/`.


## References
* OWASP: [SSRF](https://www.owasp.org/index.php/Server_Side_Request_Forgery)
* OWASP: [XSS Unvalidated Redirects and Forwards Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html).
{% cwe-references %}
