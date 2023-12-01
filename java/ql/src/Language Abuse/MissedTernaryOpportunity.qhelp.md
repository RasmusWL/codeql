An `if` statement where both branches do nothing but return or write to a variable can be better expressed using the ternary `?` operator.



Use of the ternary operator enhances readability in two ways:

* It focuses the reader's attention on the intent of the code (to return or write) rather than the testing of a condition.
* It is more concise, reducing the amount of code that needs to be read.
* You can initialize a variable conditionally on the line on which it is declared, rather than assigning to it after initialization. This ensures that you initialize the variable as you intended.

## Recommendation
Consider using a ternary operator in this situation.


## Example
The following code includes two examples of `if` statements, `myAbs1` and `1`, which can be simplified using the ternary operator. `myAbs2` and `s2` show how the statements can be improved.

{% sample src="MissedTernaryOpportunity.java" %}
