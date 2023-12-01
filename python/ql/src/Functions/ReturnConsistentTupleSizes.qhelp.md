A common pattern for functions returning multiple arguments is to return a single tuple containing said arguments. If the function has multiple return points, care must be taken to ensure that the tuples returned have the same length.


## Recommendation
Ensure that the function returns tuples of similar lengths.


## Example
In this example, the `sum_length_product1` function simultaneously calculates the sum, length, and product of the values in the given list. For empty lists, however, the returned tuple only contains the sum and length of the list. In `sum_length_product2` this error has been corrected.

{% sample src="ReturnConsistentTupleSizes.py" %}

## References
* Python Language Reference: [Function definitions](http://docs.python.org/2/reference/compound_stmts.html#function).
{% cwe-references %}
