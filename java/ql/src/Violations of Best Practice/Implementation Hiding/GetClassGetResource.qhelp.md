Using the `Class.getResource` method is a common way of including some non-code resources with an application.

There are problems when this is called using `x.getClass().getResource()`, for some variable `x`. This is not a safe way to retrieve a resource. The method `getClass` returns the *run-time* class of `x` (that is, its actual, "most derived" class, rather than its declared type), which causes two potential problems:

* If the run-time type of the receiving object is a subclass of the declared type and is in a different package, the resource path may be interpreted differently. According to its contract, `Class.getResource` qualifies non-absolute paths with the current package name, thus potentially returning a different resource or failing to find the requested resource.
* `Class.getResource` delegates finding the resource to the class loader that loaded the class. At run time, there is no guarantee that all subclasses of a particular type are loaded by the same class loader, resulting in resource lookup failures that are difficult to diagnose.

## Recommendation
Rather than using the `getClass` method, which relies on dynamic dispatch and run-time types, use `class` literals instead. For example, instead of calling `getClass().getResource()` on an object of type `Foo`, call `Foo.class.getResource()`. Class literals always refer to the declared type they are used on, removing the dependency on run-time types.


## Example
In the following example, the calls to `getPostalCodes` return different results, depending on which class the call is made on: the class `Address` is in the package `framework` and the class `UKAddress` is in the package `client`.

{% sample src="GetClassGetResource.java" %}
In the following corrected example, the implementation of `getPostalCodes` is changed so that it always calls `getResource` on the same class.

{% sample src="GetClassGetResourceGood.java" %}

## References
* Java API Specification: [Class.getResource()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Class.html#getResource(java.lang.String)).
{% cwe-references %}
