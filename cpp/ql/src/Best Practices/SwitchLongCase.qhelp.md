This rule finds switch statements that have too much code in their cases. Long case statements often lead to large amounts of nesting, adding to the difficulty of understanding what the code actually does. Consider wrapping the code for each case in a function and just using the switch statement to invoke the appropriate function in each case.

The indicated switch statement has a case that is more than 30 lines long.


## Recommendation
Consider creating a separate function for the code in the long case statement.


## Example
{% sample src="SwitchLongCase.cpp" %}

## References
* [Switch statements](http://www.learncpp.com/cpp-tutorial/53-switch-statements/)
{% cwe-references %}
