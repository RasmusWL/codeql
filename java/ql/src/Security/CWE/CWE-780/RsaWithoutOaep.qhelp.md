Cryptographic algorithms often use padding schemes to make the plaintext less predictable. The OAEP (Optimal Asymmetric Encryption Padding) scheme should be used with RSA encryption. Using an outdated padding scheme such as PKCS1, or no padding at all, can weaken the encryption by making it vulnerable to a padding oracle attack.


## Recommendation
Use the OAEP scheme when using RSA encryption.


## Example
In the following example, the BAD case shows no padding being used, whereas the GOOD case shows an OAEP scheme being used.

{% sample src="RsaWithoutOaep.java" %}

## References
* [Mobile Security Testing Guide](https://github.com/MobSF/owasp-mstg/blob/master/Document/0x04g-Testing-Cryptography.md#padding-oracle-attacks-due-to-weaker-padding-or-block-operation-implementations).
* [The Padding Oracle Attack](https://robertheaton.com/2013/07/29/padding-oracle-attack/).
{% cwe-references %}
