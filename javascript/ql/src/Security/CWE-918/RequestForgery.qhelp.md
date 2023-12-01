Directly incorporating user input in the URL of an outgoing HTTP request can enable a request forgery attack, in which the request is altered to target an unintended API endpoint or resource. If the server performing the request is connected to an internal network, this can give an attacker the means to bypass the network boundary and make requests against internal services. A forged request may perform an unintended action on behalf of the attacker, or cause information leak if redirected to an external server or if the request response is fed back to the user. It may also compromise the server making the request, if the request response is handled in an unsafe way.

{% render "RequestForgeryRecommendation.inc.qhelp.md" %}


## Example
The following example shows an HTTP request parameter being used directly in the URL of a request without validating the input, which facilitates an SSRF attack. The request `http.get(...)` is vulnerable since attackers can choose the value of `target` to be anything they want. For instance, the attacker can choose `"internal.example.com/#"` as the target, causing the URL used in the request to be `"https://internal.example.com/#.example.com/data"`.

A request to `https://internal.example.com` may be problematic if that server is not meant to be directly accessible from the attacker's machine.

{% sample src="examples/RequestForgeryBad.js" %}
One way to remedy the problem is to use the user input to select a known fixed string before performing the request:

{% sample src="examples/RequestForgeryGood.js" %}

## References
* OWASP: [SSRF](https://www.owasp.org/index.php/Server_Side_Request_Forgery)
{% cwe-references %}
