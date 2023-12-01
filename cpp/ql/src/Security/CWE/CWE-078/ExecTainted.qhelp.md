The code passes user input as part of a call to `system` or `popen` without escaping special elements. It generates a command line using `sprintf`, with the user-supplied data directly passed as a formatting argument. This leaves the code vulnerable to attack by command injection.


## Recommendation
Use a library routine to escape characters in the user-supplied string before passing it to a command shell.


## Example
The following example runs an external command in two ways. The first way uses `sprintf` to build a command directly out of a user-supplied argument. As such, it is vulnerable to command injection. The second way quotes the user-provided value before embedding it in the command; assuming the `encodeShellString` utility is correct, this code should be safe against command injection.

{% sample src="ExecTainted.c" %}

## References
* CERT C Coding Standard: [STR02-C. Sanitize data passed to complex subsystems](https://www.securecoding.cert.org/confluence/display/c/STR02-C.+Sanitize+data+passed+to+complex+subsystems).
* OWASP: [Command Injection](https://www.owasp.org/index.php/Command_Injection).
{% cwe-references %}
