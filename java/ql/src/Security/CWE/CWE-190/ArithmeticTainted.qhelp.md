Performing calculations on user-controlled data can result in integer overflows unless the input is validated.

If the user is free to enter very large numbers, even arithmetic operations that would usually result in a small change in magnitude may result in overflows.


## Recommendation
Always guard against overflow in arithmetic operations on user-controlled data by doing one of the following:

* Validate the user input.
* Define a guard on the arithmetic expression, so that the operation is performed only if the result can be known to be less than, or equal to, the maximum value for the type, for example `MAX_VALUE`.
* Use a wider type, so that larger input values do not cause overflow.

## Example
In this example, a value is read from standard input into an `int`. Because the value is a user-controlled value, it could be extremely large. Performing arithmetic operations on this value could therefore cause an overflow. To avoid this happening, the example shows how to perform a check before performing a multiplication.

{% sample src="ArithmeticTainted.java" %}

## References
* SEI CERT Oracle Coding Standard for Java: [NUM00-J. Detect or prevent integer overflow](https://wiki.sei.cmu.edu/confluence/display/java/NUM00-J.+Detect+or+prevent+integer+overflow).
{% cwe-references %}
