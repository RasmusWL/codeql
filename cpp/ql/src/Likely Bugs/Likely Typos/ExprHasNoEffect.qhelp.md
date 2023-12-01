This rule finds expressions without side effects (i.e. changing variable values) that are used in a context where their value is ignored. These expressions are most likely intended to be part of a condition but were coded improperly.

In most cases these are defects caused by the unintended use of the comma operator. It is easy to misuse the comma operator (particularly in conditions) and it would be good practice to use it only when the brevity it allows is absolutely necessary (e.g. macro definitions).


## Recommendation
Make sure that the flagged expressions are not oversights. To document that the value of the expression is deliberately ignored, you could explicitly cast it to `void`.


## Example
{% sample src="ExprHasNoEffect.cpp" %}

## References
* Tutorialspoint - The C++ Programming Language: [C++ Comma Operator](http://www.tutorialspoint.com/cplusplus/cpp_comma_operator.htm)
{% cwe-references %}
