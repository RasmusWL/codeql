In a loop condition, comparison of a value of a narrow type with a value of a wide type may result in unexpected behavior if the wider value is sufficiently large (or small). This is because the narrower value may overflow. This can lead to an infinite loop.


## Recommendation
Change the types of the compared values so that the value on the narrower side of the comparison is at least as wide as the value it is being compared with.


## Example
In this example, `bytes_received` is compared against `max_get` in a `while` loop. However, `bytes_received` is an `int16_t`, and `max_get` is an `int32_t`. Because `max_get` is larger than `INT16_MAX`, the loop condition is always `true`, so the loop never terminates.

This problem is avoided in the 'GOOD' case because `bytes_received2` is an `int32_t`, which is as wide as the type of `max_get`.

{% sample src="ComparisonWithWiderType.c" %}

## References
* [Data type ranges](https://docs.microsoft.com/en-us/cpp/cpp/data-type-ranges)
* [INT18-C. Evaluate integer expressions in a larger size before comparing or assigning to that size ](https://wiki.sei.cmu.edu/confluence/display/c/INT18-C.+Evaluate+integer+expressions+in+a+larger+size+before+comparing+or+assigning+to+that+size)
{% cwe-references %}
