Constant salts should not be used for password hashing. Data hashed using constant salts are vulnerable to dictionary attacks, enabling attackers to recover the original input.


## Recommendation
Use randomly generated salts to securely hash input data.


## Example
The following example shows a few cases of hashing input data. In the 'BAD' cases, the salt is constant, making the generated hashes vulnerable to dictionary attacks. In the 'GOOD' cases, the salt is randomly generated, which protects the hashed data against recovery.

{% sample src="ConstantSalt.swift" %}

## References
* [What are Salted Passwords and Password Hashing?](https://www.okta.com/blog/2019/03/what-are-salted-passwords-and-password-hashing/)
{% cwe-references %}
