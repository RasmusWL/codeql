Including unencrypted hard-coded authentication credentials in source code is dangerous because the credentials may be easily discovered. For example, the code may be open source, or it may be leaked or accidentally revealed, making the credentials visible to an attacker. This, in turn, might enable them to gain unauthorized access, or to obtain privileged information.


## Recommendation
Remove hard-coded credentials, such as user names, passwords and certificates, from source code. Instead, place them in configuration files, environment variables or other data stores if necessary. If possible, store configuration files including credential data separately from the source code, in a secure location with restricted access.


## Example
The following code example connects to a Postgres database using the `lib/pq` package and hard-codes user name and password:

{% sample src="HardcodedCredentials.go" %}
Instead, user name and password can be supplied through the environment variables `PGUSER` and `PGPASSWORD`, which can be set externally without hard-coding credentials in the source code.


## References
* OWASP: [Use of hard-coded password](https://www.owasp.org/index.php/Use_of_hard-coded_password).
{% cwe-references %}
