This rule finds code that converts the result of an integer multiplication to a larger type. Since the conversion applies *after* the multiplication, arithmetic overflow may still occur.

The rule flags every multiplication of two non-constant integer expressions that is (explicitly or implicitly) converted to a larger integer type. The conversion is an indication that the expression would produce a result that would be too large to fit in the smaller integer type.


## Recommendation
Use a cast to ensure that the multiplication is done using the larger integer type to avoid overflow.


## Example
{% sample src="IntMultToLong.cpp" %}

## References
* MSDN Library: [Multiplicative Operators and the Modulus Operator](https://docs.microsoft.com/en-us/cpp/cpp/multiplicative-operators-and-the-modulus-operator).
* Cplusplus.com: [Integer overflow](http://www.cplusplus.com/articles/DE18T05o/).
{% cwe-references %}
