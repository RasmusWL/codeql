Using untrusted input to construct an email can cause multiple security vulnerabilities. For instance, inclusion of an untrusted input in an email body may allow an attacker to conduct cross-site scripting (XSS) attacks, while inclusion of an HTTP header may allow a full account compromise as shown in the example below.


## Recommendation
Any data which is passed to an email subject or body must be sanitized before use.


## Example
In the following example snippet, the `host` field is user controlled.

A malicious user can send an HTTP request to the targeted website, but with a Host header that refers to their own website. This means the emails will be sent out to potential victims, originating from a server they trust, but with links leading to a malicious website.

If the email contains a password reset link, and the victim clicks the link, the secret reset token will be leaked to the attacker. Using the leaked token, the attacker can then construct the real reset link and use it to change the victim's password.

{% sample src="EmailBad.go" %}
One way to prevent this is to load the host name from a trusted configuration file instead.

{% sample src="EmailGood.go" %}

## References
* OWASP: [Content Spoofing](https://owasp.org/www-community/attacks/Content_Spoofing) .
{% cwe-references %}
