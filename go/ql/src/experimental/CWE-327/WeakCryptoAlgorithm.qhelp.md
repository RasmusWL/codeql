Using weak cryptographic algorithms can leave data vulnerable to being decrypted or forged by an attacker.

Many cryptographic algorithms provided by cryptography libraries are known to be weak. Using such an algorithm means that encrypted or hashed data is less secure than it appears to be.


## Recommendation
Ensure that you use a strong, modern cryptographic algorithm. Use at least AES-128 or RSA-2048 for encryption, and SHA-2 or SHA-3 for secure hashing.


## Example
The following code uses the different packages to encrypt/hash some secret data. The first few examples uses DES, MD5, RC4, and SHA1, which are older algorithms that are now considered weak. The following examples use AES and SHA256, which are stronger, more modern algorithms.

{% sample src="examples/Crypto.go" %}

## References
* OWASP: [Cryptographic Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html).
* Wikipedia: [Cryptographically Strong Algorithms](https://en.wikipedia.org/wiki/Strong_cryptography#Cryptographically_strong_algorithms).
* Wikipedia: [Strong Cryptography Examples](https://en.wikipedia.org/wiki/Strong_cryptography#Examples).
* NIST, FIPS 140 Annex a: [ Approved Security Functions](http://csrc.nist.gov/publications/fips/fips140-2/fips1402annexa.pdf).
* NIST, SP 800-131A: [ Transitions: Recommendation for Transitioning the Use of Cryptographic Algorithms and Key Lengths](http://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-131Ar1.pdf).
{% cwe-references %}
