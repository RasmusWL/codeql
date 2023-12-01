Directly incorporating user input into an HTTP request without validating the input can facilitate server-side request forgery (SSRF) attacks. In these attacks, the request may be changed, directed at a different server, or via a different protocol. This can allow the attacker to obtain sensitive information or perform actions with escalated privilege.

We make a distinctions between how much of the URL an attacker can control:

* **Full SSRF**: where the full URL can be controlled.
* **Partial SSRF**: where only part of the URL can be controlled, such as the path component of a URL to a hardcoded domain.


Partial control of a URL is often much harder to exploit. Therefore we have created a separate query for each of these.

