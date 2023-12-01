This rule finds uses of the equality operator `==` in places where the assignment operator `=` would make more sense. This is a common mistake in C and C++, because of the similarity of the `=` and the `==` operator, and the fact that expressions are valid as top-level statements.

The rule flags every occurrence of an equality operator in a position where its result is discarded.


## Recommendation
Check to ensure that the flagged expressions are not typos. If the result of an equality test is really intended to be discarded, it should be explicitly cast to `void`.


## Example
{% sample src="CompareWhereAssignMeant.cpp" %}

## References
* Tutorialspoint - The C++ Programming Language: [Operators in C++](http://www.tutorialspoint.com/cplusplus/cpp_operators.htm)
* Wikipedia: [Operators in C and C++](http://en.wikipedia.org/wiki/Operators_in_C_and_C%2B%2B#Comparison_operators.2Frelational_operators)
{% cwe-references %}
