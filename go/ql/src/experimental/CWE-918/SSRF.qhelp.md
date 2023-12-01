Directly incorporating user input into an HTTP request without validating the input can facilitate server side request forgery attacks, where the attacker controls the request target.


## Recommendation
To guard against server side request forgery, it is advisable to avoid putting user input directly into a network request. If using user input is necessary, then it must be validated. It is recommended to only allow user input consisting of alphanumeric characters. Simply URL-encoding other characters is not always a solution, for example because a downstream entity that is itself vulnerable may decode again before forwarding the request.


## Example
The following example shows an HTTP request parameter being used directly in a URL request without validating the input, which facilitates an SSRF attack. The request `http.Get("https://example.com/current_api/"+target)` is vulnerable since attackers can choose the value of `target` to be anything they want. For instance, the attacker can choose `"../super_secret_api"` as the target, causing the URL to become `"https://example.com/super_secret_api"`.

A request to `https://example.com/super_secret_api` may be problematic if that api is not meant to be directly accessible from the attacker's machine.

{% sample src="SSRF.go" %}
One way to remedy the problem is to validate the user input to only allow alphanumeric values:

{% sample src="SSRFGood.go" %}

## References
* OWASP: [SSRF](https://www.owasp.org/www-community/attacks/Server_Side_Request_Forgery)
{% cwe-references %}
