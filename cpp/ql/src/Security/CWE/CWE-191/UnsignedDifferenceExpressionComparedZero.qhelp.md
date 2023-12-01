This rule finds relational comparisons between the result of an unsigned subtraction and the value `0`. Such comparisons are likely to be wrong as the value of an unsigned subtraction can never be negative. So the relational comparison ends up checking whether the result of the subtraction is equal to `0`. This is probably not what the programmer intended.


## Recommendation
If a relational comparison is intended, consider casting the result of the subtraction to a signed type. If the intention was to test for equality, consider replacing the relational comparison with an equality test.


## Example
{% sample src="UnsignedDifferenceExpressionComparedZero.c" %}

## References
* SEI CERT C Coding Standard: [INT02-C. Understand integer conversion rules](https://wiki.sei.cmu.edu/confluence/display/c/INT02-C.+Understand+integer+conversion+rules).
{% cwe-references %}
