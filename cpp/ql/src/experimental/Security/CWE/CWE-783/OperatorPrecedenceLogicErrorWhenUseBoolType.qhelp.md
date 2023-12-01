Finding places of confusing use of boolean type. For example, a unary minus does not work before a boolean type and an increment always gives true.


## Recommendation
we recommend making the code simpler.


## Example
The following example demonstrates erroneous and fixed methods for using a boolean data type.

{% sample src="OperatorPrecedenceLogicErrorWhenUseBoolType.c" %}

## References
* CERT C Coding Standard: [EXP00-C. Use parentheses for precedence of operation](https://wiki.sei.cmu.edu/confluence/display/c/EXP00-C.+Use+parentheses+for+precedence+of+operation).
{% cwe-references %}
