A JSON Web Token (JWT) is used for authenticating and managing users in an application.

Only Decoding JWTs without checking if they have a valid signature or not can lead to security vulnerabilities.


## Recommendation
Don't use methods that only decode JWT, Instead use methods that verify the signature of JWT.


## Example
In the following code you can see an Example from a popular Library.

{% sample src="Example.go" %}

## References
* [JWT audience claim is not verified](https://github.com/argoproj/argo-cd/security/advisories/GHSA-q9hr-j4rf-8fjc)
{% cwe-references %}
