Code that passes user input directly to `exec`, `eval`, or some other library routine that executes a command, allows the user to execute malicious code.


## Recommendation
If possible, use hard-coded string literals to specify the command to run or the library to load. Instead of passing the user input directly to the process or library function, examine the user input and then choose among hard-coded string literals.

If the applicable libraries or commands cannot be determined at compile time, then add code to verify that the user input string is safe before using it.


## Example
The following example shows two functions. The first is unsafe as it takes a shell script that can be changed by a user, and passes it straight to `subprocess.call()` without examining it first. The second is safe as it selects the command from a predefined allowlist.

{% sample src="examples/command_injection.py" %}

## References
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
{% cwe-references %}
