Directly incorporating user input into an HTTP request without validating the input can facilitate different kinds of request forgery attacks, where the attacker essentially controls the request. If the vulnerable request is in server-side code, then security mechanisms, such as external firewalls, can be bypassed. If the vulnerable request is in client-side code, then unsuspecting users can send malicious requests to other servers, potentially resulting in a DDOS attack.


## Recommendation
To guard against request forgery, it is advisable to avoid putting user input directly into a network request. If a flexible network request mechanism is required, it is recommended to maintain a list of authorized request targets and choose from that list based on the user input provided.


## Example
The following example shows an HTTP request parameter being used directly in a URL request without validating the input, which facilitates an SSRF attack. The request `http.Get(...)` is vulnerable since attackers can choose the value of `target` to be anything they want. For instance, the attacker can choose `"internal.example.com/#"` as the target, causing the URL used in the request to be `"https://internal.example.com/#.example.com/data"`.

A request to `https://internal.example.com` may be problematic if that server is not meant to be directly accessible from the attacker's machine.

{% sample src="RequestForgery.go" %}
One way to remedy the problem is to use the user input to select a known fixed string before performing the request:

{% sample src="RequestForgeryGood.go" %}

## References
* OWASP: [SSRF](https://www.owasp.org/index.php/Server_Side_Request_Forgery)
{% cwe-references %}
