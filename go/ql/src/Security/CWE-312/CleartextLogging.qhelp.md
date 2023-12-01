Sensitive information that is logged unencrypted is accessible to an attacker who gains access to the logs.


## Recommendation
Ensure that sensitive information is always encrypted or obfuscated before being logged.

In general, decrypt sensitive information only at the point where it is necessary for it to be used in cleartext.

Be aware that external processes often store the standard out and standard error streams of the application, causing logged sensitive information to be stored.


## Example
The following example code logs user credentials (in this case, their password) in plain text:

{% sample src="CleartextLogging.go" %}
Instead, the credentials should be encrypted, obfuscated, or omitted entirely:

{% sample src="CleartextLoggingGood.go" %}

## References
* M. Dowd, J. McDonald and J. Schuhm, *The Art of Software Security Assessment*, 1st Edition, Chapter 2 - 'Common Vulnerabilities of Encryption', p. 43. Addison Wesley, 2006.
* M. Howard and D. LeBlanc, *Writing Secure Code*, 2nd Edition, Chapter 9 - 'Protecting Secret Data', p. 299. Microsoft, 2002.
* OWASP: [Password Plaintext Storage](https://www.owasp.org/index.php/Password_Plaintext_Storage).
{% cwe-references %}
