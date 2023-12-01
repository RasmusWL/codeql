AngularJS components can have a `$inject` property that specifies the dependencies to inject. You can assign this property multiple times, but doing so is confusing since later assignments overwrite earlier ones, and only the dependencies specified in the last assignment are actually injected.


## Recommendation
Only specify dependencies once for each component.


## Example
The following example shows an AngularJS controller that has its dependencies specified twice.

{% sample src="examples/RepeatedInjection.js" %}
This is problematic, since the second specification always overrides the first one.

Instead, the dependencies should only be specified once:

{% sample src="examples/RepeatedInjection-fixed.js" %}

## References
* AngularJS Developer Guide: [Dependency Injection](https://docs.angularjs.org/guide/di).
{% cwe-references %}
