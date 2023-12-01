Java enables you to annotate methods that are intended to override a method in a superclass. Compilers are required to generate an error if such an annotated method does not override a method in a superclass, which provides increased protection from potential defects. An annotated method also improves code readability.


## Recommendation
Add an `@Override` annotation to a method that is intended to override a method in a superclass.


## Example
In the following example, `Triangle.getArea` overrides `Rectangle.getArea`, so it is annotated with `@Override`.

{% sample src="MissingOverrideAnnotation.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, Item 36. Addison-Wesley, 2008.
* Help - Eclipse Platform: [Java Compiler Errors/Warnings Preferences](https://help.eclipse.org/2020-12/advanced/content.jsp?topic=/org.eclipse.jdt.doc.user/reference/preferences/java/compiler/ref-preferences-errors-warnings.htm).
* Java API Specification: [Annotation Type Override](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Override.html).
* The Java Tutorials: [Predefined Annotation Types](https://docs.oracle.com/javase/tutorial/java/annotations/predefined.html).
{% cwe-references %}
