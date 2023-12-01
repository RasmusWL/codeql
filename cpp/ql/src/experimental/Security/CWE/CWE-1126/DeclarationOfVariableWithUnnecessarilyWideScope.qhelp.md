Using variables with the same name is dangerous. However, such a situation inside the while loop can create an infinite loop exhausting resources. Requires the attention of developers.


## Recommendation
We recommend not to use local variables inside a loop if their names are the same as the variables in the condition of this loop.


## Example
The following example demonstrates an erroneous and corrected use of a local variable within a loop.

{% sample src="DeclarationOfVariableWithUnnecessarilyWideScope.c" %}

## References
* CERT C Coding Standard: [DCL01-C. Do not reuse variable names in subscopes](https://wiki.sei.cmu.edu/confluence/display/c/DCL01-C.+Do+not+reuse+variable+names+in+subscopes).
{% cwe-references %}
