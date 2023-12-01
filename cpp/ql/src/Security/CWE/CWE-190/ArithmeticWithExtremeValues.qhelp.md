Assigning the maximum or minimum value for a type to a variable of that type and then using the variable in calculations may cause overflows.


## Recommendation
Before using the variable, ensure that it is reassigned a value that does not cause an overflow, or use a wider type to do the arithmetic.


## Example
In this example, assigning `INT_MAX` to a variable and adding one causes an overflow. However, casting to a `long` beforehand ensures that the arithmetic is done in the wider type, and so does not overflow.

{% sample src="ArithmeticWithExtremeValues.c" %}

## References
{% cwe-references %}
