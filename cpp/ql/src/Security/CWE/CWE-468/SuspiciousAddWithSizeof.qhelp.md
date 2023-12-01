Pointer arithmetic in C and C++ is automatically scaled according to the size of the data type. For example, if the type of `p` is `T*` and `sizeof(T) == 4` then the expression `p+1` adds 4 bytes to `p`.

This query finds code of the form `p + k*sizeof(T)`. Such code is usually a mistake because there is no need to manually scale the offset by `sizeof(T)`.


## Recommendation
1. Whenever possible, use the array subscript operator rather than pointer arithmetic. For example, replace `*(p+k)` with `p[k]`.
1. Cast to the correct type before using pointer arithmetic. For example, if the type of `p` is `char*` but it really points to an array of type `double[]` then use the syntax `(double*)p + k` to get a pointer to the `k`'th element of the array.

## Example
{% sample src="SuspiciousAddWithSizeof.cpp" %}

## References
{% cwe-references %}
