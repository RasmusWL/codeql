The `Object.ReferenceEquals(...)` method is used to determine if two objects are the same instance. Since the method takes two objects as parameters, value types will automatically be boxed in different objects when calling the method. Hence, the method `ReferenceEquals(..) ` will always return `false` when comparing value type expressions, including struct values. As such, this kind of check is at best useless and at worst erroneous.


## Recommendation
Consider whether the equality test is needed. If it is not then remove it, otherwise replace it with a more appropriate equality check such as `==`.


## Example
In this example, the programmer is attempting to compare two `int`s but since they are value types the `ReferenceEquals` method will always return false. They should really be compared using `i == j`.

{% sample src="ReferenceEqualsOnValueTypes.cs" %}

## References
* MSDN: [Object.ReferenceEquals Method](http://msdn.microsoft.com/en-us/library/system.object.referenceequals.aspx).
* The Way I See It: [Object.ReferenceEquals(ValueVar, ValueVar) will always return false.](https://docs.microsoft.com/en-us/archive/blogs/vijaysk/object-referenceequalsvaluevar-valuevar-will-always-return-false)
{% cwe-references %}
