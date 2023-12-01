Websites that rely on cookie-based authentication may be vulnerable to cross-site request forgery (CSRF). Specifically, a state-changing request should include a secret token so the request can't be forged by an attacker. Otherwise, unwanted requests can be submitted on behalf of a user who visits a malicious website.

This is typically mitigated by embedding a session-specific secret token in each request. This token is then checked as an additional authentication measure. A malicious website should have no way of guessing the correct token to embed in the request.


## Recommendation
Use a middleware package such as `lusca.csrf` to protect against CSRF attacks.


## Example
In the example below, the server authenticates users before performing the `changeEmail` POST action:

{% sample src="examples/MissingCsrfMiddlewareBad.js" %}
This is not secure. An attacker can submit a POST `changeEmail` request on behalf of a user who visited a malicious website. Since authentication happens without any action from the user, the `changeEmail` action would be executed, despite not being initiated by the user.

This vulnerability can be mitigated by installing a CSRF protecting middleware handler:

{% sample src="examples/MissingCsrfMiddlewareGood.js" %}

## References
* OWASP: [Cross-Site Request Forgery (CSRF)](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF))
* NPM: [lusca](https://www.npmjs.com/package/lusca)
{% cwe-references %}
