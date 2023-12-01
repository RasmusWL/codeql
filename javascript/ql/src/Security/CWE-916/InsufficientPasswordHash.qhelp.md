Storing cryptographic hashes of passwords is standard security practice, but it is equally important to select the right hashing scheme. If an attacker obtains the hashed passwords of an application, the password hashing scheme should still prevent the attacker from easily obtaining the original cleartext passwords.

A good password hashing scheme requires a computation that cannot be done efficiently. Standard hashing schemes, such as `md5` or `sha1`, are efficiently computable, and are therefore not suitable for password hashing.


## Recommendation
Use a secure password hashing scheme such as `bcrypt`, `scrypt`, `PBKDF2`, or `Argon2`.


## Example
In the example below, the `md5` algorithm computes the hash of a password.

{% sample src="examples/InsufficientPasswordHash.js" %}
This is not secure, since the password can be efficiently cracked by an attacker that obtains the hash. A more secure scheme is to hash the password with the `bcrypt` algorithm:

{% sample src="examples/InsufficientPasswordHash_fixed.js" %}

## References
* OWASP: [Password storage](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html).
{% cwe-references %}
