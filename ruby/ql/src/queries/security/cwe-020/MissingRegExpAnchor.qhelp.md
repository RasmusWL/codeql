Sanitizing untrusted input with regular expressions is a common technique. However, it is error-prone to match untrusted input against regular expressions without anchors such as `\A` or `\z`. Malicious input can bypass such security checks by embedding one of the allowed patterns in an unexpected location.

Even if the matching is not done in a security-critical context, it may still cause undesirable behavior when the regular expression accidentally matches.


## Recommendation
Use anchors to ensure that regular expressions match at the expected locations.


## Example
The following example code checks that a URL redirection will reach the `example.com` domain, or one of its subdomains, and not some malicious site.

{% sample src="examples/missing_regexp_anchor_bad.rb" %}
The check with the regular expression match is, however, easy to bypass. For example by embedding `http://example.com/` in the query string component: `http://evil-example.net/?x=http://example.com/`. Address these shortcomings by using anchors in the regular expression instead:

{% sample src="examples/missing_regexp_anchor_good.rb" %}
A related mistake is to write a regular expression with multiple alternatives, but to only include an anchor for one of the alternatives. As an example, the regular expression `/^www\.example\.com|beta\.example\.com/` will match the host `evil.beta.example.com` because the regular expression is parsed as `/(^www\.example\.com)|(beta\.example\.com)/`

In Ruby the anchors `^` and `$` match the start and end of a line, whereas the anchors `\A` and `\z` match the start and end of the entire string. Using line anchors can be dangerous, as this can allow malicious input to be hidden using newlines, leading to vulnerabilities such as HTTP header injection. Unless you specifically need the line-matching behaviour of `^` and `$`, you should use `\A` and `\z` instead.


## References
* OWASP: [SSRF](https://www.owasp.org/index.php/Server_Side_Request_Forgery)
* OWASP: [XSS Unvalidated Redirects and Forwards Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html).
{% cwe-references %}
