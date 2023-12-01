An `if-else-if` statement without a terminating `else` clause may allow execution to 'fall through' silently, if none of the `if` clauses are matched.


## Recommendation
Include a terminating `else` clause to `if-else-if` statements to prevent execution from falling through silently. If the terminating `else` clause is intended to be unreachable code, it is advisable that it throws a `RuntimeException` to alert the user of an internal error.


## Example
In the following example, the `if` statement outputs the grade that is achieved depending on the test score. However, if the score is less than 60, execution falls through silently.

{% sample src="TerminateIfElseIfWithElse.java" %}
In the following modified example, the `if` statement includes a terminating `else` clause, to allow for scores that are less than 60.

{% sample src="TerminateIfElseIfWithElseGood.java" %}

## References
* Java SE Documentation: [7.4 if, if-else, if else-if else Statements](https://www.oracle.com/java/technologies/javase/codeconventions-statements.html#449).
{% cwe-references %}
