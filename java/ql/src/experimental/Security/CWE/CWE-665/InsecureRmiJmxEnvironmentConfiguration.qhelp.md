For special use cases some applications may implement a custom service which handles JMX-RMI connections.

When creating such a custom service, a developer should pass a certain environment configuration to the JMX-RMI server initialization, as otherwise the JMX-RMI service is susceptible to an unsafe deserialization vulnerability.

This is because the JMX-RMI service allows attackers to supply arbitrary objects to the service authentication method, resulting in the attempted deserialization of an attacker-controlled object. In the worst case scenario this could allow an attacker to achieve remote code execution within the context of the application server.

By setting the appropriate environment, the deserialization can be controlled via a deserialization filter.


## Recommendation
During the creation of a custom JMX-RMI service an environment should be supplied that sets a deserialization filter. Ideally this filter should be as restrictive as possible, for example to only allow the deserialization of `java.lang.String`.

The filter can be configured by setting the key `jmx.remote.rmi.server.credentials.filter.pattern` (given by the constant `RMIConnectorServer.CREDENTIALS_FILTER_PATTERN`). The filter should (ideally) only allow java.lang.String and disallow all other classes for deserialization: (`"java.lang.String;!*"`).

The key-value pair can be set as following:

{% sample src="example_filter_java_10.java" %}
For applications using Java 6u113 to 9:

{% sample src="example_filter_java_9.java" %}
Please note that the JMX-RMI service is vulnerable in the default configuration. For this reason an initialization with a `null` environment is also vulnerable.


## Example
The following examples show how an JMX-RMI service can be initialized securely.

The first example shows how an JMX server is initialized securely with the `JMXConnectorServerFactory.newJMXConnectorServer()` call.

{% sample src="CorrectJMXConnectorServerFactoryEnvironmentInitialization.java" %}
The second example shows how a JMX Server is initialized securely if the `RMIConnectorServer` class is used.

{% sample src="CorrectRMIConnectorServerEnvironmentInitialization.java" %}

## References
* Deserialization of arbitrary objects could lead to remote code execution as described following: [OWASP Deserialization of untrusted data](https://owasp.org/www-community/vulnerabilities/Deserialization_of_untrusted_data).
* Issue discovered in Tomcat (CVE-2016-8735): [OWASP ESAPI](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-8735).
* [Oracle release notes](https://www.oracle.com/java/technologies/javase/8u91-relnotes.html#bugfixes-8u91): New attribute for JMX RMI JRMP servers.
* Java 10 API specification for [RMIConnectorServer.CREDENTIALS_FILTER_PATTERN](https://docs.oracle.com/javase/10/docs/api/javax/management/remote/rmi/RMIConnectorServer.html#CREDENTIALS_FILTER_PATTERN)
* The Java API specification for [RMIConnectorServer.CREDENTIAL_TYPES](https://docs.oracle.com/javase/10/docs/api/javax/management/remote/rmi/RMIConnectorServer.html#CREDENTIAL_TYPES). Please note that this field is deprecated since Java 10.
{% cwe-references %}
