Unused or undefined React component state properties can cause errors or make code hard to read and understand. Any computation used to initialize an unused state property is wasted, which may lead to performance problems. Any access to an undefined component state property trivially evaluates to the value `undefined`, which may come as a surprise.


## Recommendation
Remove unused component state properties. Assign values to undefined component state properties.


## Example
In the code below, the React component `Clock` attempts to display the current time in the `render` method.

{% sample src="examples/UnusedOrUndefinedStateProperty.js" %}
But since there are no assignments to `this.state.date`, the `render` method will throw an exception when attempting to access the property `toLocaleString` of the value `undefined`. To avoid this exception, assign the `date` property before using it:

{% sample src="examples/UnusedOrUndefinedStateProperty_fixed.js" %}

## References
* React: [Component State](https://reactjs.org/docs/faq-state.html).
* React: [State and Lifecycle](https://reactjs.org/docs/state-and-lifecycle.html).
{% cwe-references %}
