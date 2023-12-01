After fetching an SSL certificate, always check the result of certificate verification.


## Recommendation
Always check the result of SSL certificate verification. A certificate that has been revoked may indicate that data is coming from an attacker, whereas a certificate that has expired or was self-signed may indicate an increased likelihood that the data is malicious.


## Example
In this example, the `SSL_get_peer_certificate` function is used to get the certificate of a peer. However it is unsafe to use that information without checking if the certificate is valid.

{% sample src="SSLResultNotCheckedBad.cpp" %}
In the corrected example, we use `SSL_get_verify_result` to check that certificate verification was successful.

{% sample src="SSLResultNotCheckedGood.cpp" %}

## References
{% cwe-references %}
