It is dangerous to use the result of a virtual method call in pointer arithmetic without validation if external users can provide their own implementation of the virtual method. For example, if the analyzed project is distributed as a library or framework, then the end-user could provide a new implementation that returns any value.


## Recommendation
Always validate the result of virtual methods calls before performing pointer arithmetic to avoid reading or writing outside the bounds of an allocated buffer.


## Example
In this example, we write to a given element of an array, using an instance of the `PossiblyOverridableClass` to determine which element to write to.

In the first case, the `GetElementNumber` method is called, and the result is used in pointer arithmetic without any validation. If the user can define a subtype of `PossiblyOverridableClass`, they can create an implementation of `GetElementNumber` that returns an invalid element number. This would lead to a write occurring outside the bounds of the `charArray`.

In the second case, the result of `GetElementNumber` is stored, and confirmed to be within the bounds of the array. Note that it is not sufficient to check that it is smaller than the length. We must also ensure that it's greater than zero, to prevent writes to locations before the buffer as well as afterwards.

{% sample src="LocalUnvalidatedArithmetic.cs" %}

## References
* Microsoft: [Unsafe Code and Pointers](https://msdn.microsoft.com/en-us/library/t2yzs44b.aspx).
{% cwe-references %}
