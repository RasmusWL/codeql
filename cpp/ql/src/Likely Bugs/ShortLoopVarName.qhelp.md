This rule finds loops with an iteration variable that has a short name. The iteration variable of a nested loop should have a descriptive name: avoid short names like i, j, or k that can cause confusion except in very simple loops.


## Recommendation
Change the name of the inner loop's iteration variables to something more descriptive, to make it easier to understand code in complex, nested loops.


## Example
{% sample src="ShortLoopVarName.cpp" %}

## References
* [ROS C++ Style Guide: Variables](http://wiki.ros.org/CppStyleGuide#Variables)
{% cwe-references %}
