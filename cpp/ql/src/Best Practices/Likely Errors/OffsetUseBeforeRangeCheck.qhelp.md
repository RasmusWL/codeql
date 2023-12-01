The program contains an and-expression where the array access is defined before the range check. Consequently the array is accessed without any bounds checking. The range check does not protect the program from segmentation faults caused by attempts to read beyond the end of a buffer.


## Recommendation
Update the and-expression so that the range check precedes the array offset. This will ensure that the bounds are checked before the array is accessed.


## Example
The `find` function can read past the end of the buffer pointed to by `str` if `start` is longer than or equal to the length of the buffer (or longer than `len`, depending on the contents of the buffer).

{% sample src="OffsetUseBeforeRangeCheck.c" %}
Update the and-expression so that the range check precedes the array offset (for example, the `findRangeCheck` function).


## References
* cplusplus.com: [ C++: array](http://www.cplusplus.com/reference/array/array/).
* Wikipedia: [ Bounds checking](http://en.wikipedia.org/wiki/Bounds_checking).
{% cwe-references %}
