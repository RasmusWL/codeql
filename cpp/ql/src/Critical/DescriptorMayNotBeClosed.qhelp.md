This query looks at functions that return file or socket descriptors, but may return an error value before actually closing the resource. This can occur when an operation performed on the open descriptor fails, and the function returns with an error before it closes the open resource. An improperly handled error could cause the function to leak resource descriptors. Failing to close resources in the function that opened them also makes it more difficult to detect leaks.

{% render "dataFlowWarning.inc.qhelp.md" %}


## Recommendation
When an error occurs, ensure that the function frees all the resources it holds open.


## Example
In the example below, the `sockfd` socket may remain open if an error is triggered. The code should be updated to ensure that the socket is always closed when the function ends.

{% sample src="DescriptorMayNotBeClosed.cpp" %}

## References
* SEI CERT C++ Coding Standard: [ERR57-CPP. Do not leak resources when handling exceptions](https://wiki.sei.cmu.edu/confluence/display/cplusplus/ERR57-CPP.+Do+not+leak+resources+when+handling+exceptions).
{% cwe-references %}
