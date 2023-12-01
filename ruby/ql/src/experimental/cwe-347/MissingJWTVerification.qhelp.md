Applications decoding a JSON Web Token (JWT) may be vulnerable when the key isn't verified.


## Recommendation
Calls to `verify()` functions should use a cryptographic secret or key to decode JWT payloads.


## Example
In the example below, false is used to disable the integrity enforcement of a JWT payload and none algorithm is used. This may allow a malicious actor to make changes to a JWT payload.

{% sample src="examples/MissingJWTVerificationBad.rb" %}
The following code fixes the problem by using a cryptographic secret or key to decode JWT payloads.

{% sample src="examples/MissingJWTVerificationGood.rb" %}

## References
* Auth0 Blog: [Meet the "None" Algorithm](https://auth0.com/blog/critical-vulnerabilities-in-json-web-token-libraries/#Meet-the--None--Algorithm).
{% cwe-references %}
