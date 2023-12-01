ECB should not be used as a mode for encryption as it has dangerous weaknesses. Data is encrypted the same way every time, which means that the same plaintext input will always produce the same ciphertext. This behavior makes messages encrypted with ECB more vulnerable to replay attacks.


## Recommendation
Use a different cipher mode such as CBC.


## Example
The following example shows six cases of instantiating a cipher with various encryption keys and block modes. In the 'BAD' cases, the mode of encryption is ECB, making the encrypted data vulnerable to replay attacks. In the 'GOOD' cases, the encryption mode is CBC, which protects the encrypted data against replay attacks.

{% sample src="ECBEncryption.swift" %}

## References
* Wikipedia, block cipher modes of operation, [Electronic codebook (ECB)](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Electronic_codebook_.28ECB.29).
{% cwe-references %}
