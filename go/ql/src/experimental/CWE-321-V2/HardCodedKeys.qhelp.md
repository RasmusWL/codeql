A JSON Web Token (JWT) is used for authenticating and managing users in an application.

Using a hard-coded secret key for parsing JWT tokens in open source projects can leave the application using the token vulnerable to authentication bypasses.

A JWT token is safe for enforcing authentication and access control as long as it can't be forged by a malicious actor. However, when a project exposes this secret publicly, these seemingly unforgeable tokens can now be easily forged. Since the authentication as well as access control is typically enforced through these JWT tokens, an attacker armed with the secret can create a valid authentication token for any user and may even gain access to other privileged parts of the application.


## Recommendation
Generating a cryptographically secure secret key during application initialization and using this generated key for future JWT parsing requests can prevent this vulnerability.


## Example
The following code uses a hard-coded string as a secret for parsing user provided JWTs. In this case, an attacker can very easily forge a token by using the hard-coded secret.

{% sample src="ExampleBad.go" %}

## References
* CVE-2022-0664: [Use of Hard-coded Cryptographic Key in Go github.com/gravitl/netmaker prior to 0.8.5,0.9.4,0.10.0,0.10.1. ](https://nvd.nist.gov/vuln/detail/CVE-2022-0664)
{% cwe-references %}
