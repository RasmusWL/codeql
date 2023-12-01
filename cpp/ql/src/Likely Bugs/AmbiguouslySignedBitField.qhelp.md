The signedness of a plain char, short, int, or long bit field is implementation-specific in C and in older versions of C++, and declaring their signedness explicitly removes the ambiguity and ensures portability.


## Recommendation
Declare all members of the bit field with explicit signedness.


## Example
{% sample src="AmbiguouslySignedBitField.cpp" %}

## References
* AV Rule 154, *Joint Strike Fighter Air Vehicle C++ Coding Standards*. Lockheed Martin Corporation, 2005.
* [C++ Bit Fields](http://en.cppreference.com/w/cpp/language/bit_field)
{% cwe-references %}
