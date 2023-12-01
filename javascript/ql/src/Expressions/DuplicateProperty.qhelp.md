In ECMAScript 2015 and above, as well as ECMAScript 5 non-strict mode, an object literal may define the same property multiple times, with later definitions overwriting earlier ones. If all definitions assign the same value to the property, this will not to lead to problems at runtime, but it makes the code harder to read and maintain.


## Recommendation
Eliminate the spurious redefinition.


## Example
In the following example, the object literal passed to method `css` has two definitions of property `backgroundColor`, both setting it to value `"orange"`.

{% sample src="examples/DuplicateProperty.js" %}
The second definition is spurious and should be removed:

{% sample src="examples/DuplicatePropertyGood.js" %}

## References
* Ecma International, *ECMAScript Language Definition*, 5.1 Edition, Annex C. ECMA, 2011.
* Ecma International, *ECMAScript Language Definition*, 6th Edition, Annex E. ECMA, 2015.
{% cwe-references %}
