A property in a child bean that overrides a property with the same name in its parent and has the same contents is useless. This is because the bean inherits the property from its parent anyway.


## Recommendation
If possible, remove the property in the child bean.


## Example
In the following example, `registry` is defined in both the parent bean and the child bean. It should be removed from the child bean.

{% sample src="UselessPropertyOverride.xml" %}

## References
* Spring Framework Reference Documentation 3.0: [3.7 Bean definition inheritance](http://static.springsource.org/spring/docs/3.0.x/spring-framework-reference/html/beans.html#beans-child-bean-definitions).
{% cwe-references %}
