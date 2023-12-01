Casting arbitrary pointers into `char*` and then accessing their contents should be done with care. The results may not be portable.

This query finds pointer arithmetic expressions where a pointer to `char` (or similar) is dereferenced even though the underlying value is of a type larger than `char`.


## Recommendation
1. Whenever possible, use the array subscript operator rather than pointer arithmetic. For example, replace `*(p+k)` with `p[k]`.
1. Cast to the correct type before using pointer arithmetic. For example, if the type of `p` is `char*` but it really points to an array of type `double[]` then use the syntax `(double*)p + k` to get a pointer to the `k`'th element of the array.

## Example
{% sample src="IncorrectPointerScalingChar.cpp" %}

## References
{% cwe-references %}
