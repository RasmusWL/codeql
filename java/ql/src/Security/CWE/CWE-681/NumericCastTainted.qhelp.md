Casting a user-controlled numeric value to a narrower type can result in truncated values unless the input is validated.

Narrowing conversions may cause potentially unintended results. For example, casting the positive integer value `128` to type `byte` yields the negative value `-128`.


## Recommendation
Guard against unexpected truncation of user-controlled arithmetic data by doing one of the following:

* Validate the user input.
* Define a guard on the cast expression, so that the cast is performed only if the input is known to be within the range of the resulting type.
* Avoid casting to a narrower type, and instead continue to use a wider type.

## Example
In this example, a value is read from standard input into a `long`. Because the value is a user-controlled value, it could be extremely large. Casting this value to a narrower type could therefore cause unexpected truncation. The `scaled2` example uses a guard to avoid this problem and checks the range of the input before performing the cast. If the value is too large to cast to type `int` it is rejected as invalid.

{% sample src="NumericCastTainted.java" %}

## References
* SEI CERT Oracle Coding Standard for Java: [NUM12-J. Ensure conversions of numeric types to narrower types do not result in lost or misinterpreted data](https://wiki.sei.cmu.edu/confluence/display/java/NUM12-J.+Ensure+conversions+of+numeric+types+to+narrower+types+do+not+result+in+lost+or+misinterpreted+data).
{% cwe-references %}
