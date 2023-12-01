The `printf` function, related functions like `sprintf` and `fprintf`, and other functions built atop `vprintf` all accept a format string as one of their arguments. When such format strings are literal constants, it is easy for the programmer (and static analysis tools) to verify that the format specifiers (such as `%s` and `%02x`) in the format string are compatible with the trailing arguments of the function call. When such format strings are not literal constants, it is more difficult to maintain the program: programmers (and static analysis tools) must perform non-local data-flow analysis to deduce what values the format string argument might take.


## Recommendation
If the argument passed as a format string is meant to be a plain string rather than a format string, then pass `%s` as the format string, and pass the original argument as the sole trailing argument.

If the argument passed as a format string is a parameter to the enclosing function, then consider redesigning the enclosing function's API to be less brittle.


## Example
The following program is meant to echo its command line arguments:

{% sample src="NonConstantFormat-1-bad.c" %}
The above program behaves as expected in most cases, but breaks when one of its command line arguments contains a percent character. In such cases, the behavior of the program is undefined: it might echo garbage, it might crash, or it might give a malicious attacker root access. One way of addressing the problem is to use a constant `%s` format string, as in the following program:

{% sample src="NonConstantFormat-1-good.c" %}

## Example
The following program defines a `log_with_timestamp` function:

{% sample src="NonConstantFormat-2-bad.c" %}
In the code that is visible, the reader can verify that `log_with_timestamp` is never called with a log message containing a percent character, but even if all current calls are correct, this presents an ongoing maintenance burden to ensure that newly-introduced calls don't contain percent characters. As in the previous example, one solution is to make the log message a trailing argument of the function call:

{% sample src="NonConstantFormat-2-ok.c" %}
An alternative solution is to allow `log_with_timestamp` to accept format arguments:

{% sample src="NonConstantFormat-2-good.c" %}
In this formulation, the non-constant format string to `printf` has been replaced with a non-constant format string to `vprintf`. Semmle will no longer consider the body of `log_with_timestamp` to be a problem, and will instead check that every call to `log_with_timestamp` passes a constant format string.


## References
* CERT C Coding Standard: [FIO30-C. Exclude user input from format strings](https://www.securecoding.cert.org/confluence/display/c/FIO30-C.+Exclude+user+input+from+format+strings).
* M. Howard, D. Leblanc, J. Viega, *19 Deadly Sins of Software Security: Programming Flaws and How to Fix Them*.
{% cwe-references %}
