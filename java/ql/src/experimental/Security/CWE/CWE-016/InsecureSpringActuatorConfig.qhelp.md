Spring Boot is a popular framework that facilitates the development of stand-alone applications and micro services. Spring Boot Actuator helps to expose production-ready support features against Spring Boot applications.

Endpoints of Spring Boot Actuator allow to monitor and interact with a Spring Boot application. Exposing unprotected actuator endpoints through configuration files can lead to information disclosure or even remote code execution vulnerability.

Rather than programmatically permitting endpoint requests or enforcing access control, frequently developers simply leave management endpoints publicly accessible in the application configuration file `application.properties` without enforcing access control through Spring Security.


## Recommendation
Declare the Spring Boot Starter Security module in XML configuration or programmatically enforce security checks on management endpoints using Spring Security. Otherwise accessing management endpoints on a different HTTP port other than the port that the web application is listening on also helps to improve the security.


## Example
The following examples show both 'BAD' and 'GOOD' configurations. In the 'BAD' configuration, no security module is declared and sensitive management endpoints are exposed. In the 'GOOD' configuration, security is enforced and only endpoints requiring exposure are exposed.

{% sample src="pom_good.xml" %}
{% sample src="pom_bad.xml" %}
{% sample src="application.properties" %}

## References
* Spring Boot documentation: [Spring Boot Actuator: Production-ready Features](https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-features.html)
* VERACODE Blog: [Exploiting Spring Boot Actuators](https://www.veracode.com/blog/research/exploiting-spring-boot-actuators)
* HackerOne Report: [Spring Actuator endpoints publicly available, leading to account takeover](https://hackerone.com/reports/862589)
{% cwe-references %}
