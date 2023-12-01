{% render "../jsfNote.inc.qhelp.md" %}

This query highlights portions of code that can expose the floating point implementation of the underlying machine. Manually manipulating the bits in the float is prone to mistakes and is unportable. Floating point implementations can vary across architectures, and bit-field packing can differ across compilers, making manual bit-manipulation of floats inadvisable.

The bits of a floating point could be exposed by:

* casting a float pointer to a pointer of another type
* casting a float array to a non-float pointer type
* using a float in a union with another type

## Recommendation
Do not expose the bit contents of a float.


## Example
{% sample src="AV Rule 147.cpp" %}

## References
* AV Rule 147, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
{% cwe-references %}
