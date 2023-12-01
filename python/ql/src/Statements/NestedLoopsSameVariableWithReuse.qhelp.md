In Python variables have function-wide scope which means that if two variables have the same name in the same scope, they are in fact one variable. Consequently, nested loops in which the target variables have the same name in fact share a single variable. Such loops are difficult to understand as the inner loop will modify the target variable of the outer loop. This may lead to unexpected behavior if the loop variable is used after the inner loop has terminated.


## Recommendation
Rename the inner loop variable.


## Example
This example shows a function that processes a sequence of lists of numbers. It prints out the largest element from each of the lists. In the first version, the variable `x` gets overwritten by the inner loop, resulting in the wrong output. In the second function, the error has been fixed by renaming the inner loop variable to stop it overwriting the outer loop variable.

{% sample src="NestedLoopsSameVariableWithReuse.py" %}

## References
* Python Language Reference: [The for statement](http://docs.python.org/2/reference/compound_stmts.html#the-for-statement).
* Python Tutorial: [for statements](http://docs.python.org/2/tutorial/controlflow.html#for-statements).
{% cwe-references %}
