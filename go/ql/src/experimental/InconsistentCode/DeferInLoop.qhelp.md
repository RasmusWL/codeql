A deferred statement in a loop will not execute until the end of the function. This can lead to unintentionally holding resources open, like file handles or database transactions.


## Recommendation
Either run the deferred function manually, or create a subroutine that contains the defer.


## Example
In the example below, the files opened in the loop are not closed until the end of the function:

{% sample src="DeferInLoop.go" %}
The corrected version puts the loop body into a function.

{% sample src="DeferInLoopGood.go" %}

## References
* [Defer statements](https://golang.org/ref/spec#Defer_statements).
{% cwe-references %}
