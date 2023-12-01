The use of generics in Java improves compile-time type safety and code readability. Users of a class or interface that has been designed using generic types should therefore make use of parameterized instances in variable declarations, method return types, and constructor calls.


## Recommendation
Provide type parameters to generic classes and interfaces where possible.

Note that converting legacy code to use generics may have to be done carefully in order to preserve the existing functionality of an API; for detailed guidance, see the references.


## Example
The following example is poorly written because it uses raw types. This makes it more error prone because the compiler is less able to perform type checks.

{% sample src="Generics_Common.java" %}
A parameterized version can be easily made and is much safer.

{% sample src="Generics_CommonGood.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, Item 23. Addison-Wesley, 2008.
* Help - Eclipse Platform: [Java Compiler Errors/Warnings Preferences](https://help.eclipse.org/2020-12/advanced/content.jsp?topic=/org.eclipse.jdt.doc.user/reference/preferences/java/compiler/ref-preferences-errors-warnings.htm).
* The Java Tutorials: [Generics](https://docs.oracle.com/javase/tutorial/java/generics/), [Converting Legacy Code to Use Generics](https://docs.oracle.com/javase/tutorial/extra/generics/convert.html).
{% cwe-references %}
