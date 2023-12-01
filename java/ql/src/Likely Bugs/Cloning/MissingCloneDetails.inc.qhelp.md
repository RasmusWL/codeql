The Java API Specification states that, for an object `x`, the general intent of the `clone` method is for it to satisfy the following three properties:

* `x.clone() != x` (the cloned object is a different object instance)
* `x.clone().getClass() == x.getClass()` (the cloned object is the same type as the source object)
* `x.clone().equals(x)` (the cloned object has the same 'contents' as the source object)
For the cloned object to be of the same type as the source object, non-final classes must call `super.clone` and that call must eventually reach `Object.clone`, which creates an instance of the right type. If it were to create a new object using a constructor, a subclass that does not implement the `clone` method returns an object of the wrong type. In addition, all of the class's supertypes that also override `clone` must call `super.clone`. Otherwise, it never reaches `Object.clone` and creates an object of the incorrect type.

However, as `Object.clone` only does a shallow copy of the fields of an object, any `Cloneable` objects that have a "deep structure" (for example, objects that use an array or `Collection`) must take the clone that results from the call to `super.clone` and assign explicitly created copies of the structure to the clone's fields. This means that the cloned instance does not share its internal state with the source object. If it *did* share its internal state, any changes made in the cloned object would also affect the internal state of the source object, probably causing unintended behavior.

One added complication is that `clone` cannot modify values in final fields, which would be already set by the call to `super.clone`. Some fields must be made non-final to correctly implement the `clone` method.

