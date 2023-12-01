A database resource in the `java.sql` package that is opened but not closed may cause a resource leak and ultimately resource exhaustion.


## Recommendation
Ensure that the resource is always closed to avoid a resource leak. Note that, because of exceptions, it is safest to close a resource in a `finally` block.

For Java 7 or later, the recommended way to close resources that implement `java.lang.AutoCloseable` is to declare them within a `try-with-resources` statement, so that they are closed implicitly.


## Example
In the following example, the resources `stmt` and `rs` are opened but not closed.

{% sample src="CloseSql.java" %}
In the following example, the resources `stmt` and `rs` are declared within a `try-with-resources` block and are thus closed implicitly.

{% sample src="CloseSqlGood.java" %}
Note that the `Connection` that is passed into the method is a long-lived object that was created elsewhere and therefore need not be closed locally. It should instead be closed by the code that created it or by a server shutdown procedure, as appropriate.


## References
* IBM developerWorks: [Java theory and practice: Good housekeeping practices](https://web.archive.org/web/20201109041839/http://www.ibm.com/developerworks/java/library/j-jtp03216/index.html).
* The Java Tutorials: [The try-with-resources Statement](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html).
{% cwe-references %}
