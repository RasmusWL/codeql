A JSON Web Token (JWT) consists of three parts: header, payload, and signature. The `io.jsonwebtoken.jjwt` library is one of many libraries used for working with JWTs. It offers different methods for parsing tokens like `parse`, `parseClaimsJws`, and `parsePlaintextJws`. The last two correctly verify that the JWT is properly signed. This is done by computing the signature of the combination of header and payload and comparing the locally computed signature with the signature part of the JWT.

Therefore it is necessary to provide the `JwtParser` with a key that is used for signature validation. Unfortunately the `parse` method **accepts** a JWT whose signature is empty although a signing key has been set for the parser. This means that an attacker can create arbitrary JWTs that will be accepted if this method is used.


## Recommendation
Always verify the signature by using either the `parseClaimsJws` and `parsePlaintextJws` methods or by overriding the `onPlaintextJws` or `onClaimsJws` of `JwtHandlerAdapter`.


## Example
The following example shows four cases where a signing key is set for a parser. In the first 'BAD' case the `parse` method is used, which will not validate the signature. The second 'BAD' case uses a `JwtHandlerAdapter` where the `onPlaintextJwt` method is overriden, so it will not validate the signature. The third and fourth 'GOOD' cases use `parseClaimsJws` method or override the `onPlaintextJws` method.

{% sample src="MissingJWTSignatureCheck.java" %}

## References
* zofrex: [How I Found An alg=none JWT Vulnerability in the NHS Contact Tracing App](https://www.zofrex.com/blog/2020/10/20/alg-none-jwt-nhs-contact-tracing-app/).
{% cwe-references %}
