Casting an expression to the type that it already has serves no purpose and clutters the code. It indicates confusion about the type of the expression, or that the code has been partially refactored.

This query applies to both the `()` operator and the `as` operator.


## Recommendation
In all cases, the redundant cast should simply be removed.


## Example
The following example shows a getter where the return value is explicitly cast to an `int`. However this is unnecessary because the type of the expression `properties["Size"]` is already `int`.

{% sample src="UselessCastToSelf.cs" %}
The problem is resolved by deleting the useless `(int)`.

{% sample src="UselessCastToSelfFix.cs" %}

## References
* MSDN, C\# Programming Guide: [Casting and Type Conversions](https://msdn.microsoft.com/en-us/library/ms173105.aspx).
{% cwe-references %}
