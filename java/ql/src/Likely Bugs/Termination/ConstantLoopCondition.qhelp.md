Loops can contain multiple exit conditions, either directly in the loop condition or as guards around `break` or `return` statements. If none of the exit conditions can ever be satisfied, then the loop will never terminate.


## Recommendation
When writing a loop that is intended to terminate, make sure that all the necessary exit conditions can be satisfied and that loop termination is clear.


## Example
The following example searches for a field of a given name, and intends to throw an exception if the field cannot be found. However, if the field cannot be found, the double loop structure means that the exit conditions will never be met, resulting in an infinite loop.

{% sample src="ConstantLoopConditionBad.java" %}
The solution is to rewrite the code as follows using an `if`-statement.

{% sample src="ConstantLoopConditionGood.java" %}

## References
* Java Language Specification: [Blocks and Statements](https://docs.oracle.com/javase/specs/jls/se11/html/jls-14.html).
{% cwe-references %}
