This rule finds calls to `socket` where there is no corresponding `close` call in the program analyzed. Leaving descriptors open will cause a resource leak that will persist even after the program terminates.

{% render "aliasAnalysisWarning.inc.qhelp.md" %}


## Recommendation
Ensure that all socket descriptors allocated by the program are freed before it terminates.


## Example
In the example below, the `sockfd` socket remains open when the `main` program finishes. The code should be updated to ensure that the socket is always closed when the program terminates.

{% sample src="DescriptorNeverClosed.cpp" %}

## References
* SEI CERT C++ Coding Standard: [ERR57-CPP. Do not leak resources when handling exceptions](https://wiki.sei.cmu.edu/confluence/display/cplusplus/ERR57-CPP.+Do+not+leak+resources+when+handling+exceptions).
{% cwe-references %}
