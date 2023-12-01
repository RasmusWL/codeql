When an ordering is introduced on instances of a class by making the class implement the ` IComparable` interface, it is sensible to ensure that for all instances `c1` and `c2`, `c1.CompareTo(c2) == 0` &hArr; `c1.Equals(c2)`. Classes that implement `IComparable.CompareTo` but inherit `Equals`, rather than overriding it to match the `CompareTo` implementation, generally violate this assumption, which can lead to confusion when the class is used.

> If the type implements IComparable, it should override Equals.

*- Microsoft: [Guidelines for Overloading Equals() and Operator ==](http://msdn.microsoft.com/en-us/library/ms173147(v=vs.80).aspx)*


## Recommendation
A class that implements `CompareTo` should generally also override `Equals` in order to provide a consistent implementation.


## Example
The following example outputs:

```
Comparing a1 with a2: 0
a1 equals a2: False
```
This is obviously not desirable as shows an inconsistency between the behavior of `CompareTo` and the behavior of `Equals`.

{% sample src="InconsistentCompareTo.cs" %}

## References
* MSDN: [IComparable.CompareTo Method](http://msdn.microsoft.com/en-us/library/system.icomparable.compareto.aspx).
{% cwe-references %}
