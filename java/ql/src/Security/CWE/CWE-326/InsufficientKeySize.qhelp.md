Modern encryption relies on the computational infeasibility of breaking a cipher and decoding its message without the key. As computational power increases, the ability to break ciphers grows, and key sizes need to become larger as a result. Cryptographic algorithms that use too small of a key size are vulnerable to brute force attacks, which can reveal sensitive data.


## Recommendation
Use a key of the recommended size or larger. The key size should be at least 128 bits for AES encryption, 256 bits for elliptic-curve cryptography (ECC), and 2048 bits for RSA, DSA, or DH encryption.


## Example
The following code uses cryptographic algorithms with insufficient key sizes.

{% sample src="InsufficientKeySizeBad.java" %}
To fix the code, change the key sizes to be the recommended size or larger for each algorithm.


## References
* Wikipedia: [Key size](http://en.wikipedia.org/wiki/Key_size).
* Wikipedia: [Strong cryptography](https://en.wikipedia.org/wiki/Strong_cryptography).
* OWASP: [ Cryptographic Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html#algorithms).
* OWASP: [ Testing for Weak Encryption](https://owasp.org/www-project-web-security-testing-guide/stable/4-Web_Application_Security_Testing/09-Testing_for_Weak_Cryptography/04-Testing_for_Weak_Encryption).
* NIST: [ Transitioning the Use of Cryptographic Algorithms and Key Lengths](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-131Ar2.pdf).
{% cwe-references %}
