Converting the result of dividing, or multiplying, two integral expressions to a floating-point value may result in a loss of precision. For integral division, any fractional component of the result will be lost. For integral multiplication, the result may be outside the integral range and overflow.


## Recommendation
For division, unless the intent is to round the result down to a whole number, you should cast one of the operands to a floating-point type before performing the division. For multiplication, unless the intent is to overflow, you should cast one of the operands to a floating-point type before performing the multiplication.


## Example
In this example `c` is equal to 5 because integer division is performed.

{% sample src="PossibleLossOfPrecision.cs" %}
Casting one of the integers to a float ensures that float division is used and the remainder will be maintained, giving `c` the value of 5.25.

{% sample src="PossibleLossOfPrecisionFix.cs" %}
In this example, if `a` is greater than 536,870,911 the result will overflow.

{% sample src="PossibleLossOfPrecision2.cs" %}
Casting one of the integers to a float ensures that float multiplication is used and overflow is avoided.

{% sample src="PossibleLossOfPrecisionFix2.cs" %}

## References
* J. Albahari and B. Albahari, *C\# 4.0 in a Nutshell - The Definitive Reference*, p.24.
* MSDN, C\# Reference [/ operator](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/division-operator), [\* operator](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/multiplication-operator).
{% cwe-references %}
