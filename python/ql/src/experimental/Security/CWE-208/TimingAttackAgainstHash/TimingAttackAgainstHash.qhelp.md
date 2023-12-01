Timing Attack is based on the leakage of information by studying how long it takes the system to respond to different inputs. it can be circumvented by using a constant-time algorithm for checking the value of Hash, more precisely, the comparison time should not depend on the content of the input. Otherwise the attacker gains information that is indirectly leaked by the application. This information may then be used for malicious purposes.


## Recommendation
Two types of countermeasures can be applied against timing attacks. The first one consists in eliminating timing variations whereas the second renders these variations useless for an attacker. The only absolute way to prevent timing attacks is to make the computation strictly constant time, independent of the input. Use `hmac.compare_digest()` method to securely check the value of Hash. If this method is used, then the calculation time depends only on the length of input byte arrays, and does not depend on the contents of the arrays. Unlike `==` is a fail fast check, If the first byte is not equal, it will return immediately.


## Example
The following example uses `==` which is a fail fast check for validating a Hash.

{% sample src="UnSafeComparisonOfHash.py" %}
The next example use a safe constant-time algorithm for validating a Hash:

{% sample src="SafeComparisonOfHash.py" %}

## References
* Wikipedia: [Timing attack](https://en.wikipedia.org/wiki/Timing_attack).
* [hmac.compare_digest() method](https://docs.python.org/3/library/hmac.html#hmac.compare_digest)
* HMAC: [RFC 2104](https://datatracker.ietf.org/doc/html/rfc2104.html)
{% cwe-references %}
