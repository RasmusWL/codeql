When a function is dependency-injected in AngularJS, the dependencies can be accessed through the function's parameters. Unused dependencies are confusing, and they potentially bloat the application footprint.


## Recommendation
Do not include dependencies that are not used by a dependency-injected function.


## Example
The following example shows an AngularJS controller with more dependencies than parameters.

{% sample src="examples/UnusedAngularDependency.js" %}
This is problematic, since the `depB` dependency is unused.


## References
* AngularJS Developer Guide: [Dependency Injection](https://docs.angularjs.org/guide/di).
{% cwe-references %}
