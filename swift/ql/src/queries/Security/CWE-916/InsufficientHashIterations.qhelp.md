Storing cryptographic hashes of passwords is standard security practice, but it is equally important to select the right hashing scheme. If an attacker obtains the hashed passwords of an application, the password hashing scheme should still prevent the attacker from easily obtaining the original cleartext passwords.

A good password hashing scheme requires a computation that cannot be done efficiently. Hashing schemes with low number of iterations are efficiently computable, and are therefore not suitable for password hashing.


## Recommendation
Use the OWASP recommendation for sufficient number of iterations (currently, that is greater than or equal to 120,000) for password hashing schemes.


## Example
The following example shows a few cases where a password hashing scheme is instantiated. In the 'BAD' cases, the scheme is initialized with insufficient iterations, making it susceptible to password cracking attacks. In the 'GOOD' cases, the scheme is initialized with at least 120,000 iterations, which protects the hashed data against recovery.

{% sample src="InsufficientHashIterations.swift" %}

## References
* Password-Based Cryptography Specification Version 2.0. 2000.[RFC2898](https://www.rfc-editor.org/rfc/rfc2898).
* OWASP [Password Storage Cheat Sheet.](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html)
{% cwe-references %}
