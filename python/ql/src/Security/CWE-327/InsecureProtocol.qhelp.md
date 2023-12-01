Using a broken or weak cryptographic protocol may make a connection vulnerable to interference from an attacker.


## Recommendation
Ensure that a modern, strong protocol is used. All versions of SSL, and TLS versions 1.0 and 1.1 are known to be vulnerable to attacks. Using TLS 1.2 or above is strongly recommended.


## Example
The following code shows a variety of ways of setting up a connection using SSL or TLS. They are all insecure because of the version specified.

{% sample src="examples/insecure_protocol.py" %}
All cases should be updated to use a secure protocol, such as `PROTOCOL_TLSv1_2`.

Note that `ssl.wrap_socket` has been deprecated in Python 3.7. The recommended alternatives are:

* `ssl.SSLContext` - supported in Python 2.7.9, 3.2, and later versions
* `ssl.create_default_context` - a convenience function, supported in Python 3.4 and later versions.
Even when you use these alternatives, you should ensure that a safe protocol is used. The following code illustrates how to use flags (available since Python 3.2) or the \`minimum_version\` field (favored since Python 3.7) to restrict the protocols accepted when creating a connection.

{% sample src="examples/secure_default_protocol.py" %}

## References
* Wikipedia: [ Transport Layer Security](https://en.wikipedia.org/wiki/Transport_Layer_Security).
* Python 3 documentation: [ class ssl.SSLContext](https://docs.python.org/3/library/ssl.html#ssl.SSLContext).
* Python 3 documentation: [ ssl.wrap_socket](https://docs.python.org/3/library/ssl.html#ssl.wrap_socket).
* Python 3 documentation: [ notes on context creation](https://docs.python.org/3/library/ssl.html#functions-constants-and-exceptions).
* Python 3 documentation: [ notes on security considerations](https://docs.python.org/3/library/ssl.html#ssl-security).
* pyOpenSSL documentation: [ An interface to the SSL-specific parts of OpenSSL](https://pyopenssl.org/en/stable/api/ssl.html).
{% cwe-references %}
