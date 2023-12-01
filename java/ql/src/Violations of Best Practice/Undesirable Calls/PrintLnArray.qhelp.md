Printing an array is likely to produce unintended results. That is, the result does not contain the contents of the array. This is because the array is implicitly converted to a `String` using `Object.toString`, which just returns the following value:

` getClass().getName() + '@' + Integer.toHexString(hashCode()) `


## Recommendation
When converting an array to a readable string, use `Arrays.toString` for one-dimensional arrays, or `Arrays.deepToString` for multi-dimensional arrays. These functions iterate over the contents of the array and produce human-readable output.


## Example
In the following example, the contents of the array `words` are printed out only if `Arrays.toString` is called on the array first. Similarly, the contents of the multi-dimensional array `wordMatrix` are printed out only if `Arrays.deepToString` is called on the array first.

{% sample src="PrintLnArray.java" %}

## References
* Java API Specification: [Arrays.toString()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Arrays.html#toString(java.lang.Object[])), [Arrays.deepToString()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Arrays.html#deepToString(java.lang.Object[])), [Object.toString()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Object.html#toString()).
{% cwe-references %}
