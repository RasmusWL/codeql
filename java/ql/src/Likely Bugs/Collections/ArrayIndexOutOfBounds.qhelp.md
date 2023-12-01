When accessing an array element, one must ensure that the index is less than the length of the array. Using an index that is greater than or equal to the array length causes an `ArrayIndexOutOfBoundsException`.


## Recommendation
Ensure that the index is less than the array length.


## Example
The following example causes an `ArrayIndexOutOfBoundsException` in the final loop iteration.

{% sample src="ArrayIndexOutOfBoundsBad.java" %}
The condition should be changed as follows to correctly guard the array access.

{% sample src="ArrayIndexOutOfBoundsGood.java" %}

## References
* Java API Specification: [ArrayIndexOutOfBoundsException](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/ArrayIndexOutOfBoundsException.html).
{% cwe-references %}
