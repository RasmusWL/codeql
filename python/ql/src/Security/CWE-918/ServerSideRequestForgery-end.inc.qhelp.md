
## Recommendation
To guard against SSRF attacks you should avoid putting user-provided input directly into a request URL. Instead, either maintain a list of authorized URLs on the server and choose from that list based on the input provided, or perform proper validation of the input.


## Example
The following example shows code vulnerable to a full SSRF attack, because it uses untrusted input (HTTP request parameter) directly to construct a URL. By using `evil.com#` as the `target` value, the requested URL will be `https://evil.com#.example.com/data/`. It also shows how to remedy the problem by using the user input select a known fixed string.

{% sample src="examples/ServerSideRequestForgery_full.py" %}

## Example
The following example shows code vulnerable to a partial SSRF attack, because it uses untrusted input (HTTP request parameter) directly to construct a URL. By using `../transfer-funds-to/123?amount=456` as the `user_id` value, the requested URL will be `https://api.example.com/transfer-funds-to/123?amount=456`. It also shows how to remedy the problem by validating the input.

{% sample src="examples/ServerSideRequestForgery_partial.py" %}

## References
* [OWASP SSRF article](https://owasp.org/www-community/attacks/Server_Side_Request_Forgery)
* [PortSwigger SSRF article](https://portswigger.net/web-security/ssrf)
{% cwe-references %}
