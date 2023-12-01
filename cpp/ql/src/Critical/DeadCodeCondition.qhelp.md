This query finds branching statements with conditions that always evaluate to the same value. It is likely that these conditions indicate an error in the branching condition. Alternatively, the conditions may have been left behind after debugging.

{% render "aliasAnalysisWarning.inc.qhelp.md" %}


## Recommendation
Check the branch condition for logic errors. Check whether it is still required.


## Example
This example shows two branch conditions that always evaluate to the same value. The two conditions and their associated branches should be deleted. This will simplify the code and make it easier to maintain.

{% sample src="DeadCodeCondition.cpp" %}

## References
* SEI CERT C++ Coding Standard [MSC12-C. Detect and remove code that has no effect or is never executed](https://wiki.sei.cmu.edu/confluence/display/c/MSC12-C.+Detect+and+remove+code+that+has+no+effect+or+is+never+executed).
{% cwe-references %}
