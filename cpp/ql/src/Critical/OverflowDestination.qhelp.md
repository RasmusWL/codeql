The bounded copy functions `memcpy`, `memmove`, `strncpy`, `strncat` accept a size argument. You should call these functions with a size argument that is derived from the size of the destination buffer. Using a size argument that is derived from the source buffer may cause a buffer overflow. Buffer overflows can lead to anything from a segmentation fault to a security vulnerability.


## Recommendation
Check the highlighted function calls carefully. Ensure that the size parameter is derived from the size of the destination buffer, and not the source buffer.

{% render "aliasAnalysisWarning.inc.qhelp.md" %}


## Example
The code below shows an example where `strncpy` is called incorrectly, without checking the size of the destination buffer. In the second example the call has been updated to include the size of the destination buffer.

{% sample src="OverflowDestination.cpp" %}

## References
* I. Gerg. *An Overview and Example of the Buffer-Overflow Exploit*. IANewsletter vol 7 no 4. 2005.
* M. Donaldson. *Inside the Buffer Overflow Attack: Mechanism, Method &amp; Prevention*. SANS Institute InfoSec Reading Room. 2002.
{% cwe-references %}
