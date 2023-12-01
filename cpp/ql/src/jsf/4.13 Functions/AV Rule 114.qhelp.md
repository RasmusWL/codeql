This rule finds non-void functions with an execution path that does not return through an explicit return statement. The return value in such a case is undefined. For example, in the `cdecl` calling convention for x86, it would be whatever value was in the AX/EAX register when the function returned, assuming the function had a non-float return type that can fit in a machine word.

{% render "../../Critical/dataFlowWarning.inc.qhelp.md" %}


## Recommendation
Make sure that all execution paths in the function exit through an explicit return statement.


## Example
{% sample src="AV Rule 114.cpp" %}

## References
* AV Rule 114, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
* MISRA C++ Rule 8-4-3, *Guidelines for the use of the C++ language in critical systems*. The Motor Industry Software Reliability Associate, 2008.
* MSDN Library: [return Statement (C++)](https://docs.microsoft.com/en-us/cpp/cpp/return-statement-cpp).
{% cwe-references %}
