This query finds pointer arithmetic expressions that use a value returned from a function without checking that the value is positive. Most pointer arithmetic and almost all array element accesses use a positive value for offsets. A negative value is likely to be a defect in the returning function. Checking pointer offsets (particularly if they derive from user input) is necessary to avoid buffer overruns.

The query looks only at the return values of functions that may return a negative value (not all functions).

{% render "dataFlowWarning.inc.qhelp.md" %}


## Recommendation
Review the function. Determine whether it needs to check that the value is positive before performing pointer arithmetic.


## Example
The example below shows an example of this problem. There is no check to ensure that the value of `recordIdx` is positive and safe to use as an array offset.

{% sample src="MissingNegativityTest.cpp" %}

## References
* cplusplus.com: [Pointers](http://www.cplusplus.com/doc/tutorial/pointers/).
* SEI CERT C Coding Standard: [ARR30-C. Do not form or use out-of-bounds pointers or array subscripts](https://wiki.sei.cmu.edu/confluence/display/c/ARR30-C.+Do+not+form+or+use+out-of-bounds+pointers+or+array+subscripts).
{% cwe-references %}
