Find places of confusing use of logical and bitwise operations.


## Recommendation
We recommend using parentheses to explicitly emphasize priority.


## Example
The following example demonstrates fallacious and fixed methods of using logical and bitwise operations.

{% sample src="OperatorPrecedenceLogicErrorWhenUseBitwiseOrLogicalOperations.c" %}

## References
* CERT C Coding Standard: [EXP00-C. Use parentheses for precedence of operation](https://wiki.sei.cmu.edu/confluence/display/c/EXP00-C.+Use+parentheses+for+precedence+of+operation).
{% cwe-references %}
