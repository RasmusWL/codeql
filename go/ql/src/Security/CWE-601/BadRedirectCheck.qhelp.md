Redirect URLs should be checked to ensure that user input cannot cause a site to redirect to arbitrary domains. This is often done with a check that the redirect URL begins with a slash, which most of the time is an absolute redirect on the same host. However, browsers interpret URLs beginning with `//` or `/\` as absolute URLs. For example, a redirect to `//example.com` will redirect to `https://example.com`. Thus, redirect checks must also check the second character of redirect URLs.


## Recommendation
Also disallow redirect URLs starting with `//` or `/\`.


## Example
The following function validates a (presumably untrusted) redirect URL `redir`. If it does not begin with `/`, the harmless placeholder redirect URL `/` is returned to prevent an open redirect; otherwise `redir` itself is returned.

{% sample src="BadRedirectCheck.go" %}
While this check provides partial protection, it should be extended to cover `//` and `/\` as well:

{% sample src="BadRedirectCheckGood.go" %}

## References
* OWASP: [ XSS Unvalidated Redirects and Forwards Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.html#validating-urls).
{% cwe-references %}
