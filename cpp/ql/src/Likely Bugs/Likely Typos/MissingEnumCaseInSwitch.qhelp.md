This rule finds `switch` statements that switch on values of an enumeration type but do not provide cases for all the enumeration constants or a default case. This is an indication that there may be cases unhandled by the `switch` statement.


## Recommendation
Provide a case for every enumeration constant, or introduce a `default` case if several constants should be treated the same way.


## Example
{% sample src="MissingEnumCaseInSwitch.cpp" %}

## References
* Tutorialspoint - The C++ Programming Language: [C++ switch statement](http://www.tutorialspoint.com/cplusplus/cpp_switch_statement.htm)
* MSDN Library: [switch statement (C++)](https://docs.microsoft.com/en-us/cpp/cpp/switch-statement-cpp)
* M. Henricson and E. Nyquist, *Industrial Strength C++*, Chapter 4: Control Flow, Rec 4.5. Prentice Hall PTR, 1997 ([available online](https://web.archive.org/web/20190919025638/https://mongers.org/industrial-c++/)).
{% cwe-references %}
