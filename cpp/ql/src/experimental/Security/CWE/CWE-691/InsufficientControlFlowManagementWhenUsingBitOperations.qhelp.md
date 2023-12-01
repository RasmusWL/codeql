Using bitwise operations can be a mistake in some situations. For example, if parameters are evaluated in an expression and the function should be called only upon certain test results. These bitwise operations look suspicious and require developer attention.


## Recommendation
We recommend that you evaluate the correctness of using the specified bit operations.


## Example
The following example demonstrates the erroneous and fixed use of bit and logical operations.

{% sample src="InsufficientControlFlowManagementWhenUsingBitOperations.c" %}

## References
* CWE Common Weakness Enumeration: [ CWE-691: Insufficient Control Flow Management](https://cwe.mitre.org/data/definitions/691.html).
{% cwe-references %}
