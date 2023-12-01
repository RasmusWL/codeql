A bitfield may be unintentionally truncated when implicitly cast to an integer type storing fewer bits. This can lead to inaccurate iteration or allocation when the bitfield is used to count elements of a data structure, or to loss of information stored in the upper portion of the bitfield.


## Recommendation
Use the bitfield with a wider integer type, or use an explicit cast if the truncation is intended.


## Example
In the following example, a bitfield is accessed both through a method that truncates it and through direct field access. This results in a buffer overflow in the for loop.

{% sample src="ImplicitDowncastFromBitfield.c" %}

## References
* [cpp-reference.com: Bit field](http://en.cppreference.com/w/cpp/language/bit_field)
* [cpp-reference.com: Implicit conversion](http://en.cppreference.com/w/cpp/language/implicit_conversion)
* [https://cwe.mitre.org/data/definitions/681.html](https://cwe.mitre.org/data/definitions/681.html)
{% cwe-references %}
