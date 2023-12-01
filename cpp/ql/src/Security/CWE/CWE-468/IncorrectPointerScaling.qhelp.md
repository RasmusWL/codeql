Pointer arithmetic in C and C++ is automatically scaled according to the size of the data type. For example, if the type of `p` is `T*` and `sizeof(T) == 4` then the expression `p+1` adds 4 bytes to `p`. This can cause a buffer overflow condition if the programmer forgets that they are adding a multiple of `sizeof(T)`, rather than a number of bytes.

This query finds pointer arithmetic expressions where it appears likely that the programmer has forgotten that the offset is automatically scaled.


## Recommendation
1. Whenever possible, use the array subscript operator rather than pointer arithmetic. For example, replace `*(p+k)` with `p[k]`.
1. Cast to the correct type before using pointer arithmetic. For example, if the type of `p` is `int*` but it really points to an array of type `double[]` then use the syntax `(double*)p + k` to get a pointer to the `k`'th element of the array.

## Example
{% sample src="IncorrectPointerScaling.cpp" %}

## References
{% cwe-references %}
