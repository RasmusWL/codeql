An unreachable statement often indicates missing code or a latent bug and should be examined carefully.


## Recommendation
Examine the surrounding code to determine why the statement has become unreachable. If it is no longer needed, remove the statement.


## Example
In the following example, the body of the `for` statement cannot terminate normally, so the update statement `i++` becomes unreachable:

{% sample src="UnreachableStatement.go" %}
Most likely, the `return` statement should be moved inside the `if` statement:

{% sample src="UnreachableStatementGood.go" %}

## References
* Wikipedia: [Unreachable code](http://en.wikipedia.org/wiki/Unreachable_code).
{% cwe-references %}
