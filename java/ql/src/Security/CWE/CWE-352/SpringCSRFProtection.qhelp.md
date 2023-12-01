When you set up a web server to receive a request from a client without any mechanism for verifying that it was intentionally sent, then it is vulnerable to attack. An attacker can trick a client into making an unintended request to the web server that will be treated as an authentic request. This can be done via a URL, image load, XMLHttpRequest, etc. and can result in exposure of data or unintended code execution.


## Recommendation
When you use Spring, Cross-Site Request Forgery (CSRF) protection is enabled by default. Spring's recommendation is to use CSRF protection for any request that could be processed by a browser client by normal users.


## Example
The following example shows the Spring Java configuration with CSRF protection disabled. This type of configuration should only be used if you are creating a service that is used only by non-browser clients.

{% sample src="SpringCSRFProtection.java" %}

## References
* OWASP: [Cross-Site Request Forgery (CSRF)](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)).
* Spring Security Reference: [ Cross Site Request Forgery (CSRF) for Servlet Environments ](https://docs.spring.io/spring-security/site/docs/current/reference/html5/#servlet-csrf).
{% cwe-references %}
