Very complex conditions are hard to understand and therefore are a source of a lot of defects.


## Recommendation
Complex expressions can often be made easier to read by separating them into different variables or even giving some parts of the condition their own boolean valued method. Using separate methods both reduces code reuse and simplifies the expression.


## Example
This example demonstrates some possible conditions and whether or not they are acceptable. As you can see, the length of the condition is not the only thing that contributes to its complexity.

{% sample src="ComplexCondition.cs" %}

## References
* Robert C. Martin - *Clean Code: A Handbook of Agile Software Craftsmanship*, &sect;17.G28
* Steve McConnell - *Code Complete: A Practical Handbook of Software Construction*
{% cwe-references %}
