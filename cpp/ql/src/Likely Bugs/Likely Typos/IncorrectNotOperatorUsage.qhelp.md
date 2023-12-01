This rule finds logical-not operator usage as an operator for in a bit-wise operation.

Due to the nature of logical operation result value, only the lowest bit could possibly be set, and it is unlikely to be intent in bitwise operations. Violations are often indicative of a typo, using a logical-not (`!`) operator instead of the bit-wise not (`~`) operator.

This rule is restricted to analyze bit-wise and (`&`) and bit-wise or (`|`) operation in order to provide better precision.

This rule ignores instances where a double negation (`!!`) is explicitly used as the operator of the bitwise operation, as this is a commonly used as a mechanism to normalize an integer value to either 1 or 0.

NOTE: It is not recommended to use this rule in kernel code or older C code as it will likely find several false positive instances.


## Recommendation
Carefully inspect the flagged expressions. Consider the intent in the code logic, and decide whether it is necessary to change the not operator.


## Example
{% sample src="IncorrectNotOperatorUsage.cpp" %}

## References
* [warning C6317: incorrect operator: logical-not (!) is not interchangeable with ones-complement (~)](https://docs.microsoft.com/en-us/visualstudio/code-quality/c6317?view=vs-2017)
{% cwe-references %}
