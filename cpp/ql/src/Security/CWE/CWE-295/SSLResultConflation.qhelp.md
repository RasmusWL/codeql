When checking the result of SSL certificate verification, accepting any error code may allow an attacker to impersonate someone who is trusted.


## Recommendation
When checking an SSL certificate with `SSL_get_verify_result`, only `X509_V_OK` is a success code. If there is any other result the certificate should not be accepted.


## Example
In this example the error code `X509_V_ERR_CERT_HAS_EXPIRED` is treated the same as an OK result. An expired certificate should not be accepted as it is more likely to be compromised than a valid certificate.

{% sample src="SSLResultConflationBad.cpp" %}
In the corrected example, only a result of `X509_V_OK` is accepted.

{% sample src="SSLResultConflationGood.cpp" %}

## References
{% cwe-references %}
