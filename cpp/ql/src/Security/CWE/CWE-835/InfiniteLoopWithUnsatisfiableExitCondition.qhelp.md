Loops can contain multiple exit conditions, either directly in the loop condition or as guards around `break` or `return` statements. If none of the exit conditions can ever be satisfied, then the loop will never terminate. A program containing an infinite loop could be vulnerable to a denial of service attack if it is possible for an attacker to trigger the loop.


## Recommendation
When writing a loop that is intended to terminate, make sure that all the necessary exit conditions can be satisfied and that loop termination is clear.


## Example
The following example shows an infinite loop. The value of variable `i` is always zero, so the condition guarding the `break` is always false.

{% sample src="InfiniteLoopBad.c" %}
The error has been fixed below by incrementing `i` in the body of the loop.

{% sample src="InfiniteLoopGood.c" %}

## References
{% cwe-references %}
