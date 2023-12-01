Certificate validation is the standard authentication method of a secure TLS connection. Without it, there is no guarantee about who the other party of a TLS connection is, making man-in-the-middle attacks more likely to occur.

When testing software that uses TLS connections, it may be useful to disable the certificate validation temporarily. But disabling it in production environments is strongly discouraged, unless an alternative method of authentication is used.


## Recommendation
Do not disable certificate validation for TLS connections.


## Example
The following example shows an HTTPS connection that makes a GET request to a remote server. But the connection is not secure since the `verify_mode` option of the connection is set to `OpenSSL::SSL::VERIFY_NONE`. As a consequence, anyone can impersonate the remote server.

{% sample src="examples/RequestWithoutValidation.rb" %}
To make the connection secure, the `verify_mode` option should have its default value, or be explicitly set to `OpenSSL::SSL::VERIFY_PEER`.


## References
* Wikipedia: [Transport Layer Security (TLS)](https://en.wikipedia.org/wiki/Transport_Layer_Security)
* Wikipedia: [Man-in-the-middle attack](https://en.wikipedia.org/wiki/Man-in-the-middle_attack)
* Ruby-doc: [Net::HTTP](https://ruby-doc.org/stdlib-3.0.2/libdoc/net/http/rdoc/Net/HTTP.html)
{% cwe-references %}
