Using a size argument that is larger than the buffer size will result in an out-of-bounds memory access and possibly overflow. You need to limit the value of the length argument.


## Example
The following example shows the use of a function with and without an error in the size argument.

{% sample src="BufferAccessWithIncorrectLengthValue.cpp" %}

## References
* CERT Coding Standard: [ARR38-C. Guarantee that library functions do not form invalid pointers - SEI CERT C Coding Standard - Confluence](https://wiki.sei.cmu.edu/confluence/display/c/ARR38-C.+Guarantee+that+library+functions+do+not+form+invalid+pointers).
{% cwe-references %}
