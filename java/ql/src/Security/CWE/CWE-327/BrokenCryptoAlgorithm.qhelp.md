Using broken or weak cryptographic algorithms can leave data vulnerable to being decrypted.

Many cryptographic algorithms provided by cryptography libraries are known to be weak, or flawed. Using such an algorithm means that an attacker may be able to easily decrypt the encrypted data.


## Recommendation
Ensure that you use a strong, modern cryptographic algorithm. Use at least AES-128 or RSA-2048. Do not use the ECB encryption mode since it is vulnerable to replay and other attacks.


## Example
The following code shows an example of using a java `Cipher` to encrypt some data. When creating a `Cipher` instance, you must specify the encryption algorithm to use. The first example uses DES, which is an older algorithm that is now considered weak. The second example uses AES, which is a strong modern algorithm.

{% sample src="BrokenCryptoAlgorithm.java" %}

## References
* NIST, FIPS 140 Annex a: [ Approved Security Functions](http://csrc.nist.gov/publications/fips/fips140-2/fips1402annexa.pdf).
* NIST, SP 800-131A: [ Transitions: Recommendation for Transitioning the Use of Cryptographic Algorithms and Key Lengths](http://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-131Ar1.pdf).
{% cwe-references %}
