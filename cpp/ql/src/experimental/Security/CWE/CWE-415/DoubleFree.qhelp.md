Freeing a previously allocated resource twice can lead to various vulnerabilities in the program.


## Recommendation
We recommend that you exclude situations of possible double release. For example, use the assignment NULL to a freed variable.


## Example
The following example demonstrates an erroneous and corrected use of freeing a pointer.

{% sample src="DoubleFree.c" %}

## References
* CERT C Coding Standard: [MEM30-C. Do not access freed memory](https://wiki.sei.cmu.edu/confluence/display/c/MEM30-C.+Do+not+access+freed+memory).
{% cwe-references %}
