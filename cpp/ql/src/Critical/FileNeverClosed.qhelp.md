This rule finds calls to `fopen` with no corresponding `fclose` call in the entire program. Leaving files open will cause a resource leak that will persist even after the program terminates.

{% render "aliasAnalysisWarning.inc.qhelp.md" %}


## Recommendation
Ensure that all file or socket descriptors allocated by the program are freed before it terminates.


## Example
{% sample src="FileNeverClosed.cpp" %}
