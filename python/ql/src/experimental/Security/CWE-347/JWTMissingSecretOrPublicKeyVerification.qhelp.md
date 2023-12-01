Applications decoding a JSON Web Token (JWT) may be vulnerable when the key isn't verified in the process.


## Recommendation
Set the `verify` argument to `True` or use a framework that does it by default.


## Example
This example shows a PyJWT encoding call with the `verify` argument set to `False`.

{% sample src="JWTMissingSecretOrPublicKeyVerification.py" %}

## References
* PyJWT: [Documentation](https://pyjwt.readthedocs.io/en/stable/).
* Authlib JWT: [Documentation](https://docs.authlib.org/en/latest/specs/rfc7519.html).
* Python-Jose: [Documentation](https://github.com/mpdavis/python-jose).
{% cwe-references %}
