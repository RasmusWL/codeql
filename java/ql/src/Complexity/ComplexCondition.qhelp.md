In general, very complex conditions are difficult to write and read, and increase the chance of defects.


## Recommendation
Firstly, a condition can often be simplified by changing other parts of the code to initialize variables more consistently. For example, is there a semantic difference between `id` being `null` and having zero-length? If not, choosing one sentinel value and using it consistently simplifies most uses of that variable.

Secondly, extracting part of a condition into a Boolean-valued method can simplify the condition and also allow code reuse, with all its benefits.

Thirdly, assigning each subcondition of the condition to a local variable, and then using the variables in the condition instead can simplify the condition.


## Example
The following example shows a complex condition found in a real program used by millions of people. The condition is so confusing that even the programmer who wrote it is not sure if he got it right (see the `TODO` comment).

{% sample src="ComplexCondition.java" %}
The condition can be simplified by extracting parts of the condition into Boolean-valued methods. These methods are then used in the condition.

{% sample src="ComplexConditionGood.java" %}

## References
* R. C. Martin, *Clean Code: A Handbook of Agile Software Craftsmanship*, &sect;17.G28. Prentice Hall, 2008.
* S. McConnell, *Code Complete: A Practical Handbook of Software Construction*. Microsoft Press, 2004.
{% cwe-references %}
