The program uses input from the user as a format string for `printf` style functions. This can lead to buffer overflows or data representation problems. An attacker can exploit this weakness to crash the program, disclose information or even execute arbitrary code.

The results of this rule do not include inputs from the user that are transferred through global variables. Those can be found in the related rule "Uncontrolled format string (through global variable)".


## Recommendation
Use constant expressions as the format strings. If you need to print a value from the user, use `printf("%s", value_from_user)`.


## Example
{% sample src="UncontrolledFormatString.c" %}

## References
* CERT C Coding Standard: [FIO30-C. Exclude user input from format strings](https://www.securecoding.cert.org/confluence/display/c/FIO30-C.+Exclude+user+input+from+format+strings).
{% cwe-references %}
