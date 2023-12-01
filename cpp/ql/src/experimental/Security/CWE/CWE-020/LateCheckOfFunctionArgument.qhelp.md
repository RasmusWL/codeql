Checking the function argument after calling the function itself. This situation looks suspicious and requires the attention of the developer. It may be necessary to add validation before calling the function


## Recommendation
We recommend checking before calling the function.


## Example
The following example demonstrates an erroneous and fixed use of function argument validation.

{% sample src="LateCheckOfFunctionArgument.c" %}

## References
* CWE Common Weakness Enumeration: [ CWE-20: Improper Input Validation](https://cwe.mitre.org/data/definitions/20.html).
{% cwe-references %}
