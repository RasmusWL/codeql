Using a broken or weak cryptographic hash function can leave data vulnerable, and should not be used in security related code.

A strong cryptographic hash function should be resistant to:

* **Pre-image attacks**. If you know a hash value `h(x)`, you should not be able to easily find the input `x`.
* **Collision attacks**. If you know a hash value `h(x)`, you should not be able to easily find a different input `y` with the same hash value `h(x) = h(y)`.
As an example, both MD5 and SHA-1 are known to be vulnerable to collision attacks.

Since it's OK to use a weak cryptographic hash function in a non-security context, this query only alerts when these are used to hash sensitive data (such as passwords, certificates, usernames).


## Recommendation
Ensure that you use a strong, modern cryptographic hash function, such as:

* Argon2, scrypt, bcrypt, or PBKDF2 for passwords and other data with limited input space where a dictionary-like attack is feasible.
* SHA-2, or SHA-3 in other cases.
Note that special purpose algorithms, which are used to ensure that a message comes from a particular sender, exist for message authentication. These algorithms should be used when appropriate, as they address common vulnerabilities of simple hashing schemes in this context.


## Example
The following examples show a function for fetching data from a URL along with a hash of the data, perhaps to check the data has not been tampered with.

In the first case the MD5 hashing algorithm is used that is known to be vulnerable to collision attacks.

{% sample src="WeakSensitiveDataHashingBad.swift" %}
Here is the same function using SHA-512, which is a strong cryptographic hashing function.

{% sample src="WeakSensitiveDataHashingGood.swift" %}

## References
* OWASP: [Password Storage Cheat Sheet ](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html) and [ Transport Layer Protection Cheat Sheet ](https://cheatsheetseries.owasp.org/cheatsheets/Transport_Layer_Protection_Cheat_Sheet.html#use-strong-cryptographic-hashing-algorithms)
{% cwe-references %}
