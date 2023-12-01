{% render "../jsfNote.inc.qhelp.md" %}

This query finds bit fields with members that are not explicitly declared to be unsigned. The sign of plain char, short, int, or long bit field is implementation-specific, and declaring them all to be unsigned removes the ambiguity and ensures portability.


## Recommendation
Declare all members of the bit field to be unsigned.


## Example
The code below shows two examples of bit fields. The second field is declared to be unsigned which ensures portability. The first field should also be declared to be unsigned.

{% sample src="AV Rule 154.cpp" %}

## References
* AV Rule 154, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
* C++ reference: [Bit Fields](http://en.cppreference.com/w/cpp/language/bit_field)
{% cwe-references %}
