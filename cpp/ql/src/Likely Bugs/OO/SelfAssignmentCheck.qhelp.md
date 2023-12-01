This rule finds copy assignment operators that deallocate memory but do not check for self assignment. This could lead to accessing an already freed memory location.

This rule is particularly important if the copy assignment operator puts the current object in an invalid state before getting a new value from the object on the right hand side.


## Recommendation
Copy assignment operator should check for self-assignment.


## Example
This example shows a copy assignment operator that fails to check for self assignment. The corrected version of the same operator is also included.

{% sample src="SelfAssignmentCheck.cpp" %}

## References
* Standard C++ Foundation: [Assignment Operators](https://isocpp.org/wiki/faq/assignment-operators)
{% cwe-references %}
