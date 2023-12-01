A mismatch between conditionals and `switch` cases can lead to control-flow violations (CWE-691) where the developer either does not handle all combinations of conditions or unintentionally created dead code (CWE-561).


## Example
The following example demonstrates fallacious and fixed ways of using a `switch` statement.

{% sample src="FindIncorrectlyUsedSwitch.c" %}

## References
* CERT C Coding Standard: [MSC12-C. Detect and remove code that has no effect or is never executed](https://wiki.sei.cmu.edu/confluence/display/c/MSC12-C.+Detect+and+remove+code+that+has+no+effect+or+is+never+executed).
{% cwe-references %}
