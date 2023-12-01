Various networking and Remote Method Invocation (RMI) methods may use `SocketFactories` to specify the kind of connections to use. Using the default factory or a non-SSL factory leads to vulnerable connections.


## Recommendation
Use SSL factories instead of the default factories. SSL factories can be found in `javax.net.ssl` or `java.rmi.ssl`. If you want to define your own custom factories, consider inheriting from one of the SSL factories.


## Example
The following example shows two ways of using RMI to export an object. The first use of `exportObject` uses the default socket factories. The second use of `exportObject` uses explicit SSL factories, which are preferable.

{% sample src="UseSSLSocketFactories.java" %}

## References
* SEI CERT Oracle Coding Standard for Java: [SER03-J. Do not serialize unencrypted, sensitive data](https://wiki.sei.cmu.edu/confluence/display/java/SER03-J.+Do+not+serialize+unencrypted+sensitive+data).
* Java API Specification: [ Class SSLSocketFactory](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/javax/net/ssl/SSLSocketFactory.html).
* OWASP: [Transport Layer Protection Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Transport_Layer_Protection_Cheat_Sheet.html).
{% cwe-references %}
