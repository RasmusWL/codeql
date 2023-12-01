Catching `Throwable` or `Exception` is dangerous because these can include an `Error` such as `OutOfMemoryError` or a `RuntimeException` such as `ArrayIndexOutOfBoundsException`. These should normally be propagated to the outermost level because they generally indicate a program state from which normal operation cannot be recovered.


## Recommendation
It is usually best to ensure that exceptions that are caught in a `catch` clause are as specific as possible to avoid inadvertently suppressing more serious problems.


## Example
In the following example, the `catch` clause in the first `try` block catches `Throwable`. However, when performing read operations on a `FileInputStream` within a `try` block, the corresponding `catch` clause should normally catch `IOException` instead. This is shown in the second, modified `try` block.

{% sample src="ExceptionCatch.java" %}

## References
* J. Bloch and N. Gafter, *Java Puzzlers: Traps, Pitfalls, and Corner Cases*, Puzzle 44. Addison-Wesley, 2005.
* Java API Specification: [Throwable](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Throwable.html), [Error](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Error.html), [Exception](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Exception.html), [RuntimeException](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/RuntimeException.html).
{% cwe-references %}
