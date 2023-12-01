Sanitizing untrusted URLs is a common technique for preventing attacks such as request forgeries and malicious redirections. Usually, this is done by checking that the host of a URL is in a set of allowed hosts.

However, treating the URL as a string and checking if one of the allowed hosts is a substring of the URL is very prone to errors. Malicious URLs can bypass such security checks by embedding one of the allowed hosts in an unexpected location.

Even if the substring check is not used in a security-critical context, the incomplete check may still cause undesirable behaviors when the check succeeds accidentally.


## Recommendation
Parse a URL before performing a check on its host value, and ensure that the check handles arbitrary subdomain sequences correctly.


## Example
The following example code checks that a URL redirection will reach the `example.com` domain.

{% sample src="examples/IncompleteUrlSubstringSanitization.py" %}
The first two examples show unsafe checks that are easily bypassed. In `unsafe1` the attacker can simply add `example.com` anywhere in the url. For example, `http://evil-example.net/example.com`.

In `unsafe2` the attacker must use a hostname ending in `example.com`, but that is easy to do. For example, `http://benign-looking-prefix-example.com`.

The second two examples show safe checks. In `safe1`, an allowlist is used. Although fairly inflexible, this is easy to get right and is most likely to be safe.

In `safe2`, `urlparse` is used to parse the URL, then the hostname is checked to make sure it ends with `.example.com`.


## References
* OWASP: [SSRF](https://www.owasp.org/index.php/Server_Side_Request_Forgery)
* OWASP: [XSS Unvalidated Redirects and Forwards Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html).
{% cwe-references %}
