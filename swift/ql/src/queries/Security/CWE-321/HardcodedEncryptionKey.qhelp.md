Hardcoded keys should not be used for creating encryption ciphers. Data encrypted using hardcoded keys are more vulnerable to the possibility of recovering them.


## Recommendation
Use randomly generated key material to initialize the encryption cipher.


## Example
The following example shows a few cases of instantiating a cipher with various encryption keys. In the 'BAD' cases, the key material is hardcoded, making the encrypted data vulnerable to recovery. In the 'GOOD' cases, the key material is randomly generated and not hardcoded, which protects the encrypted data against recovery.

{% sample src="HardcodedEncryptionKey.swift" %}

## References
* OWASP: [Key Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Key_Management_Cheat_Sheet.html)
{% cwe-references %}
