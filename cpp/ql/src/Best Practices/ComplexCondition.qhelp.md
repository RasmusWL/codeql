This rule finds boolean expressions that have more than 5 consecutive operators that are not of the same type (e.g. alternating `&&` and `||` operators). Long chains of operators of the same type are not flagged as violations of this rule.

Complex boolean expressions are hard to read. Consequently, when modifying such expressions there is an increased risk of introducing defects. Naming intermediate results as local variables will make the logic easier to read and understand.


## Recommendation
Use local variables or macros to represent intermediate values to make the condition easier to understand.


## Example
{% sample src="ComplexCondition.cpp" %}

## References
* [Operators](http://www.cplusplus.com/doc/tutorial/operators/)
* [Conditionals](http://geosoft.no/development/cppstyle.html#Conditionals)
{% cwe-references %}
