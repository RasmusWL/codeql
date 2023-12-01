This rule finds a short-circuiting logical operator that is applied to what looks like a bit-mask. This may be a typo for a bitwise operator. Bit-masks are assumed to be constant operands whose value is a power of 2, except 1 and 0, since these could be legitimate truth values. Hexadecimal and octal literals are also considered bit masks.


## Recommendation
Check if there should be a bitwise operator used instead of logical operator, or whether the constant should be compared to something.


## Example
{% sample src="ShortCircuitBitMask.cpp" %}

## References
* B. Stroustrup, *The C++ Programming Language special ed*, p 123 Short-circuit operators. Addison-Wesley, 2000.
{% cwe-references %}
