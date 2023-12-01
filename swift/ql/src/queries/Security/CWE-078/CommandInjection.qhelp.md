Constructing a system command with unsanitized user input is dangerous, since a malicious user may be able to craft input that executes arbitrary code.


## Recommendation
If possible, use hard-coded string literals to specify the command to run. Instead of interpreting user input directly as command names, examine the input and then choose among hard-coded string literals.

If this is not possible, then add sanitization code to verify that the user input is safe before using it.


## Example
The following example executes code from user input without sanitizing it first:

{% sample src="CommandInjectionBad.swift" %}
If user input is used to construct a command it should be checked first. This ensures that the user cannot insert characters that have special meanings:

{% sample src="CommandInjectionGood.swift" %}

## References
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
{% cwe-references %}
