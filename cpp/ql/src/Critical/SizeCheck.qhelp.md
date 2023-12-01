When you allocate an array from memory using `malloc`, `calloc` or `realloc`, you should ensure that you allocate enough memory to contain an instance of the required pointer type. Calls that are assigned to a non-void pointer variable, but do not allocate enough memory will cause a buffer overflow when a field accessed on the pointer points to memory that is beyond the allocated array. Buffer overflows can lead to anything from a segmentation fault to a security vulnerability.


## Recommendation
The highlighted call allocates memory that is too small to contain an instance of the type of the pointer, which can cause a memory overrun. Use the `sizeof` operator to ensure that the function call allocates enough memory for that type.


## Example
{% sample src="SizeCheck.cpp" %}

## References
* I. Gerg. *An Overview and Example of the Buffer-Overflow Exploit*. IANewsletter vol 7 no 4. 2005.
* M. Donaldson. *Inside the Buffer Overflow Attack: Mechanism, Method &amp; Prevention*. SANS Institute InfoSec Reading Room. 2002.
{% cwe-references %}
