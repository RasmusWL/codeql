Deriving password-based encryption keys using hardcoded passwords is insecure, because the generated key may be easily discovered. Data hashed using constant salts is vulnerable to dictionary attacks, enabling attackers to recover the original input.

In particular, constant passwords would enable easier recovery of the key, even in the presence of a salt. If that salt is random enough, then key recovery is not as easy as just looking up a hardcoded credential in the source code.


## Recommendation
Use randomly generated passwords to securely derive a password-based encryption key.


## Example
The following example shows a few cases of hashing input data. In the 'BAD' cases, the password is constant, making the derived key vulnerable to dictionary attakcs. In the 'GOOD' cases, the password is randomly generated, which protects the hashed data against recovery.

{% sample src="ConstantPassword.swift" %}

## References
* Okta blog: [What are Salted Passwords and Password Hashing?](https://www.okta.com/blog/2019/03/what-are-salted-passwords-and-password-hashing/)
* RFC 2898: [Password-Based Cryptography Specification](https://www.rfc-editor.org/rfc/rfc2898).
{% cwe-references %}
