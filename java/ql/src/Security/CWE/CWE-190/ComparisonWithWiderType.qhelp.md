In a loop condition, comparison of a value of a narrow type with a value of a wide type may always evaluate to `true` if the wider value is sufficiently large (or small). This is because the narrower value may overflow. This can lead to an infinite loop.


## Recommendation
Change the types of the compared values so that the value on the narrower side of the comparison is at least as wide as the value it is being compared with.


## Example
In this example, `bytesReceived` is compared against `MAXGET` in a `while` loop. However, `bytesReceived` is a `short`, and `MAXGET` is a `long`. Because `MAXGET` is larger than `Short.MAX_VALUE`, the loop condition is always `true`, so the loop never terminates.

This problem is avoided in the 'GOOD' case because `bytesReceived2` is a `long`, which is as wide as the type of `MAXGET`.

{% sample src="ComparisonWithWiderType.java" %}

## References
* SEI CERT Oracle Coding Standard for Java: [NUM00-J. Detect or prevent integer overflow](https://wiki.sei.cmu.edu/confluence/display/java/NUM00-J.+Detect+or+prevent+integer+overflow).
{% cwe-references %}
