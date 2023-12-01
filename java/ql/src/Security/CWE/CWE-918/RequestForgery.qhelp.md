Directly incorporating user input into an HTTP request without validating the input can facilitate server-side request forgery (SSRF) attacks. In these attacks, the server may be tricked into making a request and interacting with an attacker-controlled server.


## Recommendation
To guard against SSRF attacks, you should avoid putting user-provided input directly into a request URL. Instead, maintain a list of authorized URLs on the server; then choose from that list based on the input provided. Alternatively, ensure requests constructed from user input are limited to a particular host or more restrictive URL prefix.


## Example
The following example shows an HTTP request parameter being used directly to form a new request without validating the input, which facilitates SSRF attacks. It also shows how to remedy the problem by validating the user input against a known fixed string.

{% sample src="RequestForgery.java" %}

## References
* [OWASP SSRF](https://owasp.org/www-community/attacks/Server_Side_Request_Forgery)
{% cwe-references %}
