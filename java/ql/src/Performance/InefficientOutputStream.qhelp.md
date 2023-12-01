The classes `java.io.OutputStream` and `java.io.FilterOutputStream` only require subclasses to implement the method `write(byte b)`. Typically, uses of `OutputStream`s will not write single bytes, but an array via the `write(byte[] b, int off, int len)` method. The default implementation of this method, which you are not required to override, calls `write(byte b)` for each byte in the array. If this method involves I/O, such as accessing the network or disk, this is likely to incur significant overhead.


## Recommendation
Always provide an implementation of the `write(byte[] b, int off, int len)` method.


## Example
The following example shows a subclass of `OutputStream` that simply wraps a `DigestOutputStream` to confirm that the data it writes to a file has the expected MD5 hash. Without an implementation of `write(byte[] b, int off, int len)` this will be very slow, because it makes a call to `DigestOutputStream.write(byte b)` and `FileOutputStream.write(byte b)` for each byte written.

{% sample src="InefficientOutputStreamBad.java" %}
The example can be updated to use a more efficient method. In this case, calls to `write(byte[] b, int off, int len)` are simply forwarded to `DigestOutputStream.write(byte[] b, int off, int len)`.

{% sample src="InefficientOutputStreamGood.java" %}

## References
* Java API Specification: [OutputStream.write(byte\[\] b, int off, int len)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/io/OutputStream.html#write(byte[],int,int)), [FilterOutputStream.write(byte\[\] b, int off, int len)](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/io/FilterOutputStream.html#write(byte[],int,int)).
{% cwe-references %}
