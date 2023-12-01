A class that overrides only one of `Equals(object)` and `GetHashCode()` is likely to violate the contract of the `GetHashCode()` method. The contract requires that `GetHashCode()` gives the same integer result for any two equal objects. Not enforcing this property may cause unexpected results when storing and retrieving objects of such a class in a hashing data structure.


## Recommendation
Provide an implementation of the missing method that is consistent with the present method.


## Example
In the following example, the class `Bad` overrides `Equals(object)` but not `GetHashCode()`.

{% sample src="InconsistentEqualsGetHashCodeBad.cs" %}
In the revised example, the class `Good` overrides both `Equals(object)` and `GetHashCode()`.

{% sample src="InconsistentEqualsGetHashCodeGood.cs" %}

## References
* MSDN: [Object.Equals Method (Object)](https://msdn.microsoft.com/en-us/library/bsc2ak47.aspx), [Object.GetHashCode Method](https://msdn.microsoft.com/en-us/library/system.object.gethashcode.aspx).
{% cwe-references %}
