Most JavaScript objects inherit the properties of the built-in `Object.prototype` object. Prototype pollution is a type of vulnerability in which an attacker is able to modify `Object.prototype`. Since most objects inherit from the compromised `Object.prototype` object, the attacker can use this to tamper with the application logic, and often escalate to remote code execution or cross-site scripting.

One way to cause prototype pollution is by modifying an object obtained via a user-controlled property name. Most objects have a special `__proto__` property that refers to `Object.prototype`. An attacker can abuse this special property to trick the application into performing unintended modifications of `Object.prototype`.


## Recommendation
Use an associative data structure that is resilient to untrusted key values, such as a [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map). In some cases, a prototype-less object created with [Object.create(null)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create) may be preferable.

Alternatively, restrict the computed property name so it can't clash with a built-in property, either by prefixing it with a constant string, or by rejecting inputs that don't conform to the expected format.


## Example
In the example below, the untrusted value `req.params.id` is used as the property name `req.session.todos[id]`. If a malicious user passes in the ID value `__proto__`, the variable `items` will then refer to `Object.prototype`. Finally, the modification of `items` then allows the attacker to inject arbitrary properties onto `Object.prototype`.

{% sample src="examples/PrototypePollutingAssignment.js" %}
One way to fix this is to use [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) objects to associate key/value pairs instead of regular objects, as shown below:

{% sample src="examples/PrototypePollutingAssignmentFixed.js" %}
Another way to fix it is to prevent the `__proto__` property from being used as a key, as shown below:

{% sample src="examples/PrototypePollutingAssignmentFixed2.js" %}

## References
* MDN: [Object.prototype.__proto__](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto)
* MDN: [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map)
{% cwe-references %}
