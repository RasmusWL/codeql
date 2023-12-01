The intent of defining an `Equals(object)` method on a class is generally to ensure that instances of that class are compared using it, both in client code and in library code. The standard `Equals(object)` method has an `object` parameter, so `Equals(T)` methods where `T` is not `object`, will often not be used in favor of `Equals(object)`.


## Recommendation
Define an `Equals(object)` method that returns false if the object parameter is not of the type containing the method.


## Example
In this example, the `Equals` method only takes an instance of `Bad` as a parameter.

{% sample src="IncorrectEqualsSignatureBad.cs" %}
In the revised example, `Equals(object)` is overridden and defined in terms of the `Equals(Good)` method.

{% sample src="IncorrectEqualsSignatureGood.cs" %}

## References
* MSDN: [Object.Equals Method (Object)](https://msdn.microsoft.com/en-us/library/bsc2ak47.aspx).
{% cwe-references %}
