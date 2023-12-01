Constant values are typically represented by public, static, final fields. When defining several related constants, it is sometimes tempting to define a public, static, final field with an array type, and initialize it with a list of all the different constant values.

However, the `final` keyword applies only to the field itself (that is, the array reference), and not to the contents of the array. This means that the field always refers to the same array instance, but each element of the array may be modified freely. This possibly invalidates important assumptions of client code.


## Recommendation
Where possible, avoid declaring array constants. If there are only a few constant values, consider using a named constant for each one, or defining them in an `enum` type.

If you genuinely need to refer to a long list of constants with the same name and an index, consider replacing the array constant with a constant of type `List` to which you assign an unmodifiable collection. See the example for ways of achieving this.


## Example
In the following example, `public static final` applies only to `RGB` itself, not the constants that it contains.

{% sample src="StaticArray.java" %}
The following example shows examples of ways to declare constants that avoid this problem.

{% sample src="StaticArrayGood.java" %}

## References
* J. Bloch, *Effective Java (second edition)*, p. 70. Addison-Wesley, 2008.
* Java Language Specification: [4.12.4 final Variables](https://docs.oracle.com/javase/specs/jls/se11/html/jls-4.html#jls-4.12.4).
{% cwe-references %}
