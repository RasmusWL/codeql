Sensitive information that is stored in an unencrypted SQLite database is accessible to an attacker who gains access to the database.


## Recommendation
Ensure that if sensitive information is stored in a database then the database is always encrypted.


## Example
The following example shows two ways of storing information in an SQLite database. In the 'BAD' case, the credentials are simply stored in cleartext. In the 'GOOD' case, the database (and thus the credentials) are encrypted.

{% sample src="CleartextSqliteDatabase.c" %}

## References
* M. Dowd, J. McDonald and J. Schuhm, *The Art of Software Security Assessment*, 1st Edition, Chapter 2 - 'Common Vulnerabilities of Encryption', p. 43. Addison Wesley, 2006.
* M. Howard and D. LeBlanc, *Writing Secure Code*, 2nd Edition, Chapter 9 - 'Protecting Secret Data', p. 299. Microsoft, 2002.
{% cwe-references %}
