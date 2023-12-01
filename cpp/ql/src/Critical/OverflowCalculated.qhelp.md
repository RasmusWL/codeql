This query finds calls to:

* `malloc` that use a `strlen` for the buffer size and do not take the zero terminator into consideration.
* `strcat` or `strncat` that use buffers that are too small to contain the new string.
The highlighted expression will cause a buffer overflow because the buffer is too small to contain the data being copied. Buffer overflows can result to anything from a segmentation fault to a security vulnerability (particularly if the array is on stack-allocated memory).

{% render "aliasAnalysisWarning.inc.qhelp.md" %}


## Recommendation
Increase the size of the buffer being allocated.


## Example
This example includes three annotated calls that copy a string into a buffer. The first call to `malloc` creates a buffer that's the same size as the string, leaving no space for the zero terminator and causing an overflow. The second call to `malloc` correctly calculates the required buffer size. The call to `strcat` appends an additional string to the same buffer causing a second overflow.

{% sample src="OverflowCalculated.cpp" %}

## References
* [CWE-131: Incorrect Calculation of Buffer Size](http://cwe.mitre.org/data/definitions/131.html)
* I. Gerg. *An Overview and Example of the Buffer-Overflow Exploit*. IANewsletter vol 7 no 4. 2005.
* M. Donaldson. *Inside the Buffer Overflow Attack: Mechanism, Method &amp; Prevention*. SANS Institute InfoSec Reading Room. 2002.
{% cwe-references %}
