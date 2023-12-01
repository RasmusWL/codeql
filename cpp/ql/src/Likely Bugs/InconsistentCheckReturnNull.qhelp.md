A common source of defects is to forget to check if the result of a function call was NULL. This rules detects calls to a function where most other calls check the result for NULL but this particular call does not. This is inconsistent with the rest of the code and may be a defect or at least confusing for other developers.

The flagged calls will not necessarily result in run-time errors, but all of them benefit from being audited. It is important not to mechanically add nullness checks at every flagged location, because an unnecessary nullness check is very confusing to other developers. A developer that is familiar with the code will most likely immediately know what the right action is on a null result, and if that is not the case there is most likely something confusing about the API of the called function.


## Recommendation
Diagnose if the called function can actually return NULL with the context at this particular call. If that is the case the code should be updated to cater for that situation. If the call can not return null in this location, it may be good to add an assert to document that the code does not handle NULL. This documentation is important since most calls expect to receive a NULL value.


## Example
{% sample src="InconsistentCheckReturnNull.cpp" %}

## References
* Tutorialspoint - The C++ Programming Language: [C++ Dynamic Memory](http://www.tutorialspoint.com/cplusplus/cpp_dynamic_memory.htm), [C++ NULL pointers](http://www.tutorialspoint.com/cplusplus/cpp_null_pointers.htm).
* Code project: [Chained null checks and the Maybe monad](http://www.codeproject.com/Articles/109026/Chained-null-checks-and-the-Maybe-monad).
{% cwe-references %}
