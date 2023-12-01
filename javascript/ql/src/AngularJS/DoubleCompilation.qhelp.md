The AngularJS compiler processes (parts of) the DOM, determining which directives match which DOM elements, and then applies the directives to the elements. Each DOM element should only be compiled once, otherwise unexpected behavior may result.


## Recommendation
Only compile new DOM elements.


## Example
The following example (adapted from the AngularJS developer guide) shows a directive that adds a tooltip to a DOM element, and then compiles the entire element to apply nested directives.

{% sample src="examples/DoubleCompilation.js" %}
This is problematic, since it will recompile all of `element`, including parts that have already been compiled.

Instead, only the new element should be compiled:

{% sample src="examples/DoubleCompilationGood.js" %}

## References
* AngularJS Developer Guide: [Double Compilation, and how to avoid it](https://docs.angularjs.org/guide/compiler#double-compilation-and-how-to-avoid-it).
{% cwe-references %}
