Classes (especially complex ones) that are nested multiple levels deep can be difficult to understand because they have access to variables from all of the classes that enclose them. Such classes can also be difficult to unit test. Specific exceptions are made for:

* Anonymous classes - these are generally used as a substitute for closures.
* Enumerations, and simple classes that contain no methods - these are unlikely to hinder readability.

## Recommendation
The solution is to move one or more of the nested classes into a higher scope, less deeply-nested (see example below). When you move a nested class, you must:

* Ensure that the class can still access the required variables from its previously enclosing scopes.
* Consider the dependencies, particularly when you move a non-static nested class out of the containing class. Generally, a non-static class should be refactored to depend only on the contents of the classes that previously enclosed it. This avoids introducing a dependency cycle where the non-static class depends on the previously-enclosing classes themselves.

## Example
In the following example `Z1` is difficult to read because it is deeply nested.

{% sample src="DeeplyNestedClass.java" %}
In this example, there are no nested classes and you can clearly see which variables affect which class.

{% sample src="DeeplyNestedClassFix.java" %}

## References
* The Java Tutorials: [Nested Classes](https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html).
{% cwe-references %}
