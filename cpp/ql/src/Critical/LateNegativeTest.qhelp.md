This query finds integer values that are first used to index an array and subsequently tested for being negative. If it is relevant to perform this test at all then it should happen *before* the indexing, not after. Otherwise, if the value is negative then the program will have failed before performing the test.

{% render "dataFlowWarning.inc.qhelp.md" %}


## Recommendation
See if the value needs to be checked before being used as array index. Double-check if the value is derived from user input. If the value clearly cannot be negative then the negativity test is redundant and can be removed.


## Example
The example below includes two functions that use the value `recordIdx` to index an array and a test to verify that the value is positive. The test is made after `records` is indexed for `printRecord` and before `records` is indexed for `processRecord`. Unless the value of `recordIdx` cannot be negative, the test should be updated to run before *both* times the array is indexed. If the value cannot be negative, the test should be removed.

{% sample src="LateNegativeTest.cpp" %}

## References
* cplusplus.com: [Pointers](http://www.cplusplus.com/doc/tutorial/pointers/).
* SEI CERT C Coding Standard: [ARR30-C. Do not form or use out-of-bounds pointers or array subscripts](https://wiki.sei.cmu.edu/confluence/display/c/ARR30-C.+Do+not+form+or+use+out-of-bounds+pointers+or+array+subscripts).
{% cwe-references %}
