This rule looks at functions that return a `FILE*`, but may return an error value before actually closing the resource. This can occur when an operation performed on the open descriptor fails, and the function returns with an error before closing the open resource. An improperly handled error may cause the function to leak file descriptors.

{% render "dataFlowWarning.inc.qhelp.md" %}


## Recommendation
Ensure that the function frees all the resources it acquired when an error occurs.


## Example
{% sample src="FileMayNotBeClosed.cpp" %}
