This rule finds `switch` statements that use an integer instead of an enumeration. Enumerations are preferred when dealing with a limited number of choices as they makes it easier to see if a case has been left out.


## Recommendation
Use an enumeration instead of an integer to represent a limited set of choices.


## Example
{% sample src="AV Rule 148.cpp" %}

## References
* AV Rule 148, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
* [C++ Switch statement](http://www.tutorialspoint.com/cplusplus/cpp_switch_statement.htm)
{% cwe-references %}
