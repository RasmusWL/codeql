Applications decoding JSON Web Tokens (JWT) may be misconfigured due to the `None` algorithm.

The `None` algorithm is selected by calling the `verify()` function with a falsy value instead of a cryptographic secret or key. The `None` algorithm disables the integrity enforcement of a JWT payload and may allow a malicious actor to make unintended changes to a JWT payload leading to critical security issues like privilege escalation.


## Recommendation
Calls to `verify()` functions should use a cryptographic secret or key to decode JWT payloads.


## Example
In the example below, `false` is used to disable the integrity enforcement of a JWT payload. This may allow a malicious actor to make changes to a JWT payload.

{% sample src="examples/missing-key-verification-bad.js" %}
The following code fixes the problem by using a cryptographic secret or key to decode JWT payloads.

{% sample src="examples/missing-key-verification-good.js" %}

## References
* Auth0 Blog: [Meet the "None" Algorithm](https://auth0.com/blog/critical-vulnerabilities-in-json-web-token-libraries/#Meet-the--None--Algorithm).
{% cwe-references %}
