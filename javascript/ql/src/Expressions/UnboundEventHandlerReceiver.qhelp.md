Event handler callbacks are usually invoked as functions, not as methods. This means that the `this` expressions of such callbacks evaluate to `undefined` or the global object. Using an ES6 class method as a callback therefore means that the `this` expressions of the method do not refer to the class instance.


## Recommendation
Ensure that the receiver object of event handler methods that use `this` expressions is not `undefined`. For instance, you can use `bind` or explicitly invoke the method as a method call.


## Example
The following example, for the React framework, registers the `handleClick` method as an event handler for the `click` event:

{% sample src="examples/UnboundEventHandlerReceiver.js" %}
This is problematic since this invokes `handleClick` as a function call instead of a method call, meaning that `this` is `undefined` inside `handleClick`.

Instead, bind the receiver of `handleClick` in the constructor:

{% sample src="examples/UnboundEventHandlerReceiver_fixed.js" %}

## References
* React Quick Start: [Handling Events](https://reactjs.org/docs/handling-events.html).
{% cwe-references %}
