When you use static arrays you must ensure that you do not exceed the size of the array during write and access operations. If an operation attempts to write to or access an element that is outside the range of the array then this results in a buffer overflow. Buffer overflows can lead to anything from a segmentation fault to a security vulnerability.


## Recommendation
Check the offsets and sizes used in the highlighted operations to ensure that a buffer overflow will not occur.


## Example
{% sample src="OverflowStatic.cpp" %}

## References
* I. Gerg. *An Overview and Example of the Buffer-Overflow Exploit*. IANewsletter vol 7 no 4. 2005.
* M. Donaldson. *Inside the Buffer Overflow Attack: Mechanism, Method &amp; Prevention*. SANS Institute InfoSec Reading Room. 2002.
{% cwe-references %}
