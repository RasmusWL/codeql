Double release of the descriptor can lead to a crash of the program. Requires the attention of developers.


## Recommendation
We recommend that you exclude situations of possible double release.


## Example
The following example demonstrates an erroneous and corrected use of descriptor deallocation.

{% sample src="DoubleRelease.c" %}

## References
* CERT C Coding Standard: [FIO46-C. Do not access a closed file](https://wiki.sei.cmu.edu/confluence/display/c/FIO46-C.+Do+not+access+a+closed+file).
{% cwe-references %}
