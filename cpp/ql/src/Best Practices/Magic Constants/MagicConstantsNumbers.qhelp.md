A *magic number* is a numeric literal (for example, `8080`, `2048`) that is used in the middle of a block of code without explanation. It is considered good practice to avoid magic numbers by assigning the numbers to named constants and using the named constants instead. The reasons for this are twofold:

1. A number in isolation can be inexplicable to later programmers, whereas a named constant (such as `MAX_GUESTS`) is more readily understood.
1. Using the same named constant in many places, makes the code much easier to update if the requirements change (for example, one more guest is permitted).
This rule finds magic numbers for which there is no pre-existing named constant (for example, the line marked (4) below).


## Recommendation
Consider creating a `const` or a macro to encapsulate the literal, then replace all the relevant occurrences in the code.


## Example
{% sample src="MagicConstantsNumbers.cpp" %}

## References
* [Magic number (Wikipedia)](http://en.wikipedia.org/wiki/Magic_number_%28programming%29#Unnamed_numerical_constants)
* Mats Henricson and Erik Nyquist, *Industrial Strength C++*, published by Prentice Hall PTR (1997). Chapter 5: Object Life Cycle, Rec 5.4 ([PDF](https://web.archive.org/web/20190919025638/https://mongers.org/industrial-c++/)).
* [DCL06-C. Use meaningful symbolic constants to represent literal values](https://www.securecoding.cert.org/confluence/display/c/DCL06-C.+Use+meaningful+symbolic+constants+to+represent+literal+values)
{% cwe-references %}
