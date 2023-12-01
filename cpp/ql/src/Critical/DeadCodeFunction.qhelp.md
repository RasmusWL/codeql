This query highlights functions that are non-public, non-virtual, and are never called. Dead functions are often deprecated pieces of code, and should be removed. If left in the code base they increase object code size, decrease code comprehensibility, and create the possibility of misuse.

`public` and `protected` functions are ignored by this query. This type of function may be part of the program's API and could be used by external programs.

{% render "callGraphWarning.inc.qhelp.md" %}


## Recommendation
Verify that the function is genuinely unused and consider removing it.


## Example
The example below includes a function `f` that is no longer used and should be deleted.

{% sample src="DeadCodeFunction.cpp" %}

## References
* SEI CERT C++ Coding Standard: [MSC12-C. Detect and remove code that has no effect or is never executed](https://wiki.sei.cmu.edu/confluence/display/c/MSC12-C.+Detect+and+remove+code+that+has+no+effect+or+is+never+executed).
{% cwe-references %}
