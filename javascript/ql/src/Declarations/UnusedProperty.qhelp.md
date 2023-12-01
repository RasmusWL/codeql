Unused object properties make code harder to maintain and use. Clients that are unaware that a property is unused may perform nontrivial computations to compute a value that is ultimately unused.


## Recommendation
Remove the unused property.


## Example
In this code, the function `f` initializes a property `prop_a` with a call to the function `expensiveComputation`, but later on this property is never read. Removing `prop` would improve code quality and performance.

{% sample src="examples/UnusedProperty.js" %}

## References
* Coding Horror: [Code Smells](http://blog.codinghorror.com/code-smells/).
{% cwe-references %}
