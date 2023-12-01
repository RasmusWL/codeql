Debug code can create unintended entry points in a deployed Java EE web application therefore should never make into production. There is no reason to have a main method in a Java EE web application. Having a main method in the Java EE application increases the attack surface that an attacker can exploit to attack the application logic.


## Recommendation
Remove the main method from enterprise beans.


## Example
The following example shows two ways of implementing enterprise beans. In the 'BAD' case, a main method is implemented. In the 'GOOD' case, no main method is implemented.

{% sample src="EJBMain.java" %}

## References
* SonarSource: [Web applications should not have a "main" method](https://rules.sonarsource.com/java/tag/owasp/RSPEC-2653)
* Carnegie Mellon University: [ENV06-J. Production code must not contain debugging entry points](https://wiki.sei.cmu.edu/confluence/display/java/ENV06-J.+Production+code+must+not+contain+debugging+entry+points)
{% cwe-references %}
