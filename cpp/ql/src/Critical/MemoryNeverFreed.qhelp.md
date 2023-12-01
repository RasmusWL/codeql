This rule finds calls to the `alloc` family of functions without a corresponding `free` call in the entire program. This leads to memory leaks.

{% render "aliasAnalysisWarning.inc.qhelp.md" %}


## Recommendation
Ensure that all memory allocated by the program is freed before it terminates.


## Example
{% sample src="MemoryNeverFreed.cpp" %}
