Shifting an integer value by more than the number of bits in its type always results in -1 for right-shifts of negative values and 0 for other shifts. Hence, such a shift expression is either redundant or indicates a logic mistake.


## Recommendation
Examine the length check to see whether it is redundant and can be removed, or a mistake that should be fixed.


## Example
The following code snippet attempts to compute the value 2<sup>40</sup> (1099511627776). However, since the left operand `base` is of type `int32` (32 bits), the shift operation overflows, yielding zero.

{% sample src="ShiftOutOfRange.go" %}
To prevent this, the type of `base` should be changed to `int64`:

{% sample src="ShiftOutOfRangeGood.go" %}

## References
* The Go Programming Language Specification: [Arithmetic operators](https://golang.org/ref/spec#Arithmetic_operators).
{% cwe-references %}
