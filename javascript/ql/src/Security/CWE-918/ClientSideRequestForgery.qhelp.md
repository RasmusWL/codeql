Directly incorporating user input in the URL of an outgoing HTTP request can enable a request forgery attack, in which the request is altered to target an unintended API endpoint or resource. A client-side forged request may perform an unwanted action affecting the victim's account, or may lead to cross-site scripting if the request response is handled in an unsafe way. This is different from CSRF (cross-site request forgery), and will usually bypass CSRF protections. This is usually less severe than SSRF (server-side request forgery), as it does not expose internal services.

{% render "RequestForgeryRecommendation.inc.qhelp.md" %}


## Example
The following example shows an HTTP request used to fetch the pre-rendered HTML body of a message. It is using the endpoint `/api/messages/ID`, which is believed to respond with a safe HTML string, to be embedded in the page:

{% sample src="examples/ClientSideRequestForgeryBad.js" %}
However, the format of the message ID is not checked, and an attacker can abuse this to alter the endpoint targeted by the request. If they can redirect it to an endpoint that returns an untrusted value, this leads to cross-site scripting.

For example, given the query string `message_id=../pastebin/123`, the request will end up targeting the `/api/pastebin` endpoint. Or if there is an open redirect on the login page, a query string like `message_id=../../login?redirect_url=https://evil.com` could give the attacker full control over the response as well.

In example below, the input has been restricted to a number so that the endpoint cannot be altered:

{% sample src="examples/ClientSideRequestForgeryGood.js" %}

## References
* OWASP: [Server-side request forgery](https://cwe.mitre.org/data/definitions/918.html)
* OWASP: [Cross-site request forgery](https://cwe.mitre.org/data/definitions/352.html)
{% cwe-references %}
