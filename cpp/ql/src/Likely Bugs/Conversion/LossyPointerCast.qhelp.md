This rule finds expressions of pointer type which are (implicitly or explicitly) converted to an integer type of smaller size. This results in truncation of the most significant bits of the larger integer type.

Such conversions are highly non-portable, since the relative size of integer and pointer types may differ between architectures. For example, while on a 32-bit architecture both type `int` and type `char*` are four bytes wide, the latter occupies eight bytes on a 64-bit machine.


## Recommendation
Avoid converting between pointer types and integer types.


## Example
{% sample src="LossyPointerCast.cpp" %}

## References
* MSDN Library: [Type Conversions and Type Safety](https://docs.microsoft.com/en-us/cpp/cpp/type-conversions-and-type-safety-modern-cpp).
* Cplusplus.com: [Type conversions](http://www.cplusplus.com/doc/tutorial/typecasting/).
{% cwe-references %}
