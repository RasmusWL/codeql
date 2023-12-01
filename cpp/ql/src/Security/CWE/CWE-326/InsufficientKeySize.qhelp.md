Using cryptographic algorithms with a small key size can leave data vulnerable to being decrypted.

Many cryptographic algorithms provided by cryptography libraries can be configured with key sizes that are vulnerable to brute force attacks. Using such a key size means that an attacker may be able to easily decrypt the encrypted data.


## Recommendation
Ensure that you use a strong, modern cryptographic algorithm. Use at least AES-128 or RSA-2048.


## Example
The following code shows an example of using the `openssl` library to generate an RSA key. When creating a key, you must specify which key size to use. The first example uses 1024 bits, which is not considered sufficient. The second example uses 2048 bits, which is currently considered sufficient.

{% sample src="InsufficientKeySize.c" %}

## References
* NIST, FIPS 140 Annex a: [ Approved Security Functions](http://csrc.nist.gov/publications/fips/fips140-2/fips1402annexa.pdf).
* NIST, SP 800-131A: [ Transitions: Recommendation for Transitioning the Use of Cryptographic Algorithms and Key Lengths](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-131Ar2.pdf).
{% cwe-references %}
