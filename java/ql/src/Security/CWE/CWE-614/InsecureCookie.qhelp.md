Failing to set the 'secure' flag on a cookie can cause it to be sent in cleartext. This makes it easier for an attacker to intercept.


## Recommendation
Always use `setSecure` to set the 'secure' flag on a cookie before adding it to an `HttpServletResponse`.


## Example
This example shows two ways of adding a cookie to an `HttpServletResponse`. The first way leaves out the setting of the 'secure' flag; the second way includes the setting of the flag.

{% sample src="InsecureCookie.java" %}

## References
* SEI CERT Oracle Coding Standard for Java: [SER03-J. Do not serialize unencrypted, sensitive data](https://wiki.sei.cmu.edu/confluence/display/java/SER03-J.+Do+not+serialize+unencrypted+sensitive+data).
* Java Platform, Enterprise Edition (Java EE) 7, API Specification: [Class Cookie](https://docs.oracle.com/javaee/7/api/javax/servlet/http/Cookie.html).
{% cwe-references %}
