You should not drop an exception, because it indicates that an unusual program state has been reached. This usually requires corrective actions to be performed to recover from the exceptional state and try to resume normal program operation.


## Recommendation
You should do one of the following:

* Catch and handle the exception.
* Throw the exception to the outermost level of nesting.
Note that usually you should catch and handle a checked exception, but you can throw an unchecked exception to the outermost level.

There is occasionally a valid reason for ignoring an exception. In such cases, you should document the reason to improve the readability of the code. Alternatively, you can implement a static method with an empty body to handle these exceptions. Instead of dropping the exception altogether, you can then pass it to the static method with a string explaining the reason for ignoring it.


## Examples
The following example shows a dropped exception.

{% sample src="DroppedExceptions.java" %}
The following example adds a comment to document why the exception may be ignored.

{% sample src="DroppedExceptions-comment.java" %}
The following example shows how you can improve code readability by defining a new utility method.

{% sample src="DroppedExceptions-ignore.java" %}
The following example shows the exception being passed to `ignore` with a comment.

{% sample src="DroppedExceptions-good.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, Item 65. Addison-Wesley, 2008.
* The Java Tutorials: [Unchecked Exceptions - The Controversy](https://docs.oracle.com/javase/tutorial/essential/exceptions/runtime.html).
{% cwe-references %}
