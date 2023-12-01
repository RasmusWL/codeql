The TLS (Transport Layer Security) protocol secures communications over the Internet. The protocol allows client/server applications to communicate in a way that is designed to prevent eavesdropping, tampering, or message forgery.

The current latest version is 1.3 (with the 1.2 version still being considered secure). Older versions are not deemed to be secure anymore because of various security vulnerabilities, and tht makes them unfit for use in securing your applications.

Unfortunately, many applications and websites still support deprecated SSL/TLS versions and cipher suites.


## Recommendation
Only use secure TLS versions (1.3 and 1.2) and avoid using insecure cipher suites (you can see a list here: https://golang.org/src/crypto/tls/cipher_suites.go\#L81)


## Example
The following example shows a few ways how an insecure TLS configuration can be created:

{% sample src="InsecureTLS.go" %}
The following example shows how to create a safer TLS configuration:

{% sample src="SaferTLS.go" %}

## References
* Wikipedia: [Transport Layer Security](https://en.wikipedia.org/wiki/Transport_Layer_Security)
* Mozilla: [Security/Server Side TLS](https://wiki.mozilla.org/Security/Server_Side_TLS)
* OWASP: [Transport Layer Protection Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Transport_Layer_Protection_Cheat_Sheet.html)
{% cwe-references %}
