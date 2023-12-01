The standard library function `strncpy` copies a source string to a destination buffer. The third argument defines the maximum number of characters to copy and should be less than or equal to the size of the destination buffer. Calls of the form `strncpy(dest, src, strlen(src))` or `strncpy(dest, src, sizeof(src))` incorrectly set the third argument to the size of the source buffer. Executing a call of this type may cause a buffer overflow. Buffer overflows can lead to anything from a segmentation fault to a security vulnerability.


## Recommendation
Check the highlighted function calls carefully, and ensure that the size parameter is derived from the size of the destination buffer, not the source buffer.


## Example
{% sample src="StrncpyFlippedArgs.cpp" %}

## References
* cplusplus.com: [strncpy](http://www.cplusplus.com/reference/clibrary/cstring/strncpy/).
* I. Gerg. *An Overview and Example of the Buffer-Overflow Exploit*. IANewsletter vol 7 no 4. 2005.
* M. Donaldson. *Inside the Buffer Overflow Attack: Mechanism, Method &amp; Prevention*. SANS Institute InfoSec Reading Room. 2002.
{% cwe-references %}
