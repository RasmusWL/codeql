Beans that share a considerable number of similar properties exhibit unnecessary repetition in the bean definitions and make the system's architecture more difficult to see.


## Recommendation
Try to move the properties that the bean definitions share to a common parent bean. This reduces repetition in the bean definitions and gives a clearer picture of the system's architecture.


## Example
The following example shows a configuration file that contains two beans that share several properties with the same values.

{% sample src="MissingParentBean.xml" %}
The following example shows how the shared properties have been moved into a parent bean, `baseService`.

{% sample src="MissingParentBeanGood.xml" %}

## References
* Spring Framework Reference Documentation 3.0: [3.4.2.2 References to other beans (collaborators)](http://static.springsource.org/spring/docs/3.0.x/spring-framework-reference/html/beans.html#beans-ref-element).
{% cwe-references %}
