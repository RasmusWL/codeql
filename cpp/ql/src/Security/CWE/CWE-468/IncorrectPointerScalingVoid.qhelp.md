Casting arbitrary pointers into `void*` and then accessing their contents should be done with care. The results may not be portable.

This query finds pointer arithmetic expressions where a pointer to `void` (or similar) is then cast to another type and dereferenced.


## Recommendation
1. Whenever possible, use the array subscript operator rather than pointer arithmetic. For example, replace `*(p+k)` with `p[k]`.
1. Cast to the correct type before using pointer arithmetic. For example, if the type of `p` is `void*` but it really points to an array of type `double[]` then use the syntax `(double*)p + k` to get a pointer to the `k`'th element of the array.
1. If pointer arithmetic must be done with a single-byte width, prefer `char *` to `void *`, as pointer arithmetic on `void *` is a nonstandard GNU extension.

## Example
{% sample src="IncorrectPointerScalingVoid.cpp" %}

## References
{% cwe-references %}
