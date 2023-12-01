A subclass of `Writer` or `OutputStream` that is opened for writing but not properly closed later may cause a resource leak.


## Recommendation
Ensure that the resource is always closed to avoid a resource leak. Note that, because of exceptions, it is safest to close a resource properly in a `finally` block. (However, this is unnecessary for subclasses of `CharArrayWriter`, `StringWriter` and `ByteArrayOutputStream`.)

For Java 7 or later, the recommended way to close resources that implement `java.lang.AutoCloseable` is to declare them within a `try-with-resources` statement, so that they are closed implicitly.


## Example
In the following example, the resource `bw` is opened but not closed.

{% sample src="CloseWriter.java" %}
In the following example, the resource `bw` is opened in a `try` block and later closed in a `finally` block.

{% sample src="CloseWriterGood.java" %}
Note that nested class instance creation expressions of `Writer`s or `OutputStream`s are not safe to use if the constructor of the outer expression may throw an exception. In the following example, the `OutputStreamWriter` may throw an exception, in which case the inner `FileOutputStream` is not closed.

{% sample src="CloseWriterNested.java" %}
In this case, the inner expression needs to be assigned to a local variable and closed separately, as shown below.

{% sample src="CloseWriterNestedGood.java" %}

## References
* IBM developerWorks: [Java theory and practice: Good housekeeping practices](https://web.archive.org/web/20201109041839/http://www.ibm.com/developerworks/java/library/j-jtp03216/index.html).
* The Java Tutorials: [The try-with-resources Statement](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html).
{% cwe-references %}
