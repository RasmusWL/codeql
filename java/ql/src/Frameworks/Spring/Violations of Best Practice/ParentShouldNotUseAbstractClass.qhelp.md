A non-abstract Spring bean that is a parent of other beans must not specify an abstract class. Doing so causes an error during bean instantiation.


## Recommendation
Make sure that a non-abstract bean does not specify an abstract class, by doing one of the following:

* Specify that the bean is also abstract by adding `abstract="true"` to the bean specification.
* If possible, update the class that is specified by the bean so that it is not abstract.
You can also make the XML parent bean definition abstract and remove any references from it to any class (in which case it becomes a pure bean template). Note that, like an abstract class, an abstract bean cannot be used on its own and only provides property and constructor definitions to its children.


## Example
In the following example, the bean `wrongConnectionPool` is using an abstract class, `ConnectionPool`, which causes an error. Instead, the bean should be declared `abstract`, as shown in the definition of `connectionPool`.

{% sample src="ParentShouldNotUseAbstractClass.xml" %}

## References
* Spring Framework Reference Documentation 3.0: [3.7 Bean definition inheritance](http://static.springsource.org/spring/docs/3.0.x/spring-framework-reference/html/beans.html#beans-child-bean-definitions).
{% cwe-references %}
