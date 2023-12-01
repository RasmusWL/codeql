Arithmetic calculations involving integers should be checked to ensure that overflow or underflow cannot occur, as this may cause incorrect results or program crashes.


## Recommendation
Before performing an integer operation that may cause an overflow, check the operands to ensure that the result of the operation will fit into the value range of the type. Alternatively, check the result of the operation to see whether it overflowed.


## Example
In the following example snippet, the addition `start + offset` may overflow if either `start` or `offset` is very large, which will cause the indexing operation to panic at runtime:

{% sample src="IntegerOverflow.go" %}
One way to prevent this is to check whether `start + offset` overflows:

{% sample src="IntegerOverflowGood.go" %}

## References
* Wikipedia [Integer overflow](https://en.wikipedia.org/wiki/Integer_overflow).
{% cwe-references %}
