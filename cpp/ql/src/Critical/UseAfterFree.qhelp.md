This rule finds accesses through a pointer of a memory location that has already been freed (i.e. through a dangling pointer). Such memory blocks have already been released to the dynamic memory manager, and modifying them can lead to anything from a segfault to memory corruption that would cause subsequent calls to the dynamic memory manger to behave erratically, to a possible security vulnerability.

{% render "pointsToWarning.inc.qhelp.md" %}


## Recommendation
Ensure that all execution paths that access memory through a pointer never access that pointer after it is freed.


## Example
{% sample src="UseAfterFree.cpp" %}

## References
* I. Gerg. *An Overview and Example of the Buffer-Overflow Exploit*. IANewsletter vol 7 no 4. 2005.
* M. Donaldson. *Inside the Buffer Overflow Attack: Mechanism, Method &amp; Prevention*. SANS Institute InfoSec Reading Room. 2002.
{% cwe-references %}
