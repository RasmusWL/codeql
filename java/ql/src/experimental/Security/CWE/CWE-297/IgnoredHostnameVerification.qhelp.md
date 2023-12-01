The method `HostnameVerifier.verify()` checks that the hostname from the server's certificate matches the server hostname after an HTTPS connection is established. The method returns `true` if the hostname is acceptable and `false` otherwise. The contract of the method does not require it to throw an exception if the verification failed. Therefore, a caller has to check the result and drop the connection if the hostname verification failed. Otherwise, an attacker may be able to implement a man-in-the-middle attack and impersonate the server.


## Recommendation
Always check the result of `HostnameVerifier.verify()` and drop the connection if the method returns false.


## Example
In the following example, the method `HostnameVerifier.verify()` is called but its result is ignored. As a result, no hostname verification actually happens.

{% sample src="IgnoredHostnameVerification.java" %}
In the next example, the result of the `HostnameVerifier.verify()` method is checked and an exception is thrown if the verification failed.

{% sample src="CheckedHostnameVerification.java" %}

## References
* Java API Specification: [HostnameVerifier.verify() method](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/javax/net/ssl/HostnameVerifier.html#verify(java.lang.String,javax.net.ssl.SSLSession)).
{% cwe-references %}
