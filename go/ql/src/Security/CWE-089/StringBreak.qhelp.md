Code that constructs a string containing a quoted substring needs to ensure that any user-provided data embedded in between the quotes does not itself contain a quote. Otherwise the embedded data could (accidentally or intentionally) change the structure of the overall string by terminating the quoted substring early, with potentially severe consequences. If, for example, the string is later interpreted as an operating-system command or database query, a malicious attacker may be able to craft input data that enables a command injection or SQL injection attack.


## Recommendation
Sanitize the embedded data appropriately to ensure quotes are escaped, or use an API that does not rely on manually constructing quoted substrings.


## Example
In the following example, assume that `version` is an object from an untrusted source. The code snippet first uses `json.Marshal` to serialize this object into a string, and then embeds it into a SQL query built using the Squirrel library.

{% sample src="StringBreak.go" %}
Note that while Squirrel provides a structured API for building SQL queries that mitigates against common causes of SQL injection vulnerabilities, this code is still vulnerable: if the JSON-encoded representation of `version` contains a single quote, this will prematurely close the surrounding string, changing the structure of the SQL expression being constructed. This could be exploited to mount a SQL injection attack.

To fix this vulnerability, use Squirrel's placeholder syntax, which avoids the need to explicitly construct a quoted string.

{% sample src="StringBreakGood.go" %}

## References
* Wikipedia: [SQL injection](https://en.wikipedia.org/wiki/SQL_injection).
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
{% cwe-references %}
