Classes that override `System.Object.Equals()` but not `System.Object.GetHashCode()` can yield unexpected results if instances of those classes are stored in a hashing data structure.


## Recommendation
Override the `GetHashCode` method such that for two instances a and b, where a.Equals(b) is true, a.GetHashCode() and b.GetHashCode() are equal. The C\# documentation states \[1\]:

> If two objects compare as equal, the GetHashCode method for each object must return the same value. However, if two objects do not compare as equal, the GetHashCode methods for the two objects do not have to return different values.


## Example
{% sample src="HashedButNoHash.cs" %}

## References
* MSDN, C\# Programmer's Reference, [Object.GetHashCode](http://msdn.microsoft.com/en-us/library/system.object.gethashcode.aspx)
{% cwe-references %}
