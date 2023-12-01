A cast is unnecessary if the type of the operand is already the same as the type that is being cast to.


## Recommendation
Avoid including unnecessary casts.


## Example
In the following example, casting `i` to an `Integer` is not necessary. It is already an `Integer`.

{% sample src="UnnecessaryCast.java" %}
To fix the code, delete `(Integer)` on the right-hand side of the assignment on line 4.


## References
* Help - Eclipse Platform: [Java Compiler Errors/Warnings Preferences](https://help.eclipse.org/2020-12/advanced/content.jsp?topic=/org.eclipse.jdt.doc.user/reference/preferences/java/compiler/ref-preferences-errors-warnings.htm).
{% cwe-references %}
