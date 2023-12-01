A subclass of `Reader` or `InputStream` that is opened for reading but not closed may cause a resource leak.


## Recommendation
Ensure that the resource is always closed to avoid a resource leak. Note that, because of exceptions, it is safest to close a resource in a `finally` block. (However, this is unnecessary for subclasses of `CharArrayReader`, `StringReader` and `ByteArrayInputStream`.)

For Java 7 or later, the recommended way to close resources that implement `java.lang.AutoCloseable` is to declare them within a `try-with-resources` statement, so that they are closed implicitly.


## Example
In the following example, the resource `br` is opened but not closed.

{% sample src="CloseReader.java" %}
In the following example, the resource `br` is opened in a `try` block and later closed in a `finally` block.

{% sample src="CloseReaderGood.java" %}
Note that nested class instance creation expressions of `Reader`s or `InputStream`s are not safe to use if the constructor of the outer expression may throw an exception. In the following example, the `InputStreamReader` may throw an exception, in which case the inner `FileInputStream` is not closed.

{% sample src="CloseReaderNested.java" %}
In this case, the inner expression needs to be assigned to a local variable and closed separately, as shown below.

{% sample src="CloseReaderNestedGood.java" %}

## References
* IBM developerWorks: [Java theory and practice: Good housekeeping practices](https://web.archive.org/web/20201109041839/http://www.ibm.com/developerworks/java/library/j-jtp03216/index.html).
* The Java Tutorials: [The try-with-resources Statement](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html).
{% cwe-references %}
