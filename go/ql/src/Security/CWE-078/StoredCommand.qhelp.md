If a system command invocation is built from stored data without sufficient sanitization, and that data is stored from a user input, a malicious user may be able to run commands to exfiltrate data or compromise the system.


## Recommendation
If possible, use hard-coded string literals to specify the command to run. Instead of interpreting stored input directly as command names, examine the input and then choose among hard-coded string literals.

If this is not possible, then add sanitization code to verify that the user input is safe before using it.


## Example
In the following example, the function `run` runs a command directly from the result of a query:

{% sample src="StoredCommand.go" %}
The function extracts the name of a system command from the database query, and then runs it without any further checks, which can cause a command-injection vulnerability. A possible solution is to ensure that commands are checked against a whitelist:

{% sample src="StoredCommandGood.go" %}

## References
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
{% cwe-references %}
