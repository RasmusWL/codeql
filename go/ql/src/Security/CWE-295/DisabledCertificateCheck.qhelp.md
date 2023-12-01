The field `InsecureSkipVerify` controls whether a TLS client verifies the server's certificate chain and host name. If set to `true`, the client will accept any certificate and any host name in that certificate, making it susceptible to man-in-the-middle attacks.


## Recommendation
Do not set `InsecureSkipVerify` to `true` except in tests.


## Example
The following code snippet shows a function that performs an HTTP request over TLS with certificate verification disabled:

{% sample src="DisabledCertificateCheck.go" %}
While this is acceptable in a test, it should not be used in production code. Instead, certificates should be configured such that verification can be performed.


## References
* Package tls: [Config](https://golang.org/pkg/crypto/tls/#Config).
* SSL.com: [Browsers and Certificate Validation](https://www.ssl.com/article/browsers-and-certificate-validation/).
{% cwe-references %}
