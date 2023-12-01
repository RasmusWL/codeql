Most JavaScript objects inherit the properties of the built-in `Object.prototype` object. Prototype pollution is a type of vulnerability in which an attacker is able to modify `Object.prototype`. Since most objects inherit from the compromised `Object.prototype`, the attacker can use this to tamper with the application logic, and often escalate to remote code execution or cross-site scripting.

One way to cause prototype pollution is through use of an unsafe *merge* or *extend* function to recursively copy properties from one object to another, or through the use of a *deep assignment* function to assign to an unverified chain of property names. Such a function has the potential to modify any object reachable from the destination object, and the built-in `Object.prototype` is usually reachable through the special properties `__proto__` and `constructor.prototype`.


## Recommendation
The most effective place to guard against this is in the function that performs the recursive copy or deep assignment.

Only merge or assign a property recursively when it is an own property of the *destination* object. Alternatively, block the property names `__proto__` and `constructor` from being merged or assigned to.


## Example
This function recursively copies properties from `src` to `dst`:

{% sample src="examples/PrototypePollutingFunction.js" %}
However, if `src` is the object `{"__proto__": {"isAdmin": true}}`, it will inject the property `isAdmin: true` in `Object.prototype`.

The issue can be fixed by ensuring that only own properties of the destination object are merged recursively:

{% sample src="examples/PrototypePollutingFunction_fixed.js" %}
Alternatively, block the `__proto__` and `constructor` properties:

{% sample src="examples/PrototypePollutingFunction_fixed2.js" %}

## References
* Prototype pollution attacks: [lodash](https://hackerone.com/reports/380873), [jQuery](https://hackerone.com/reports/454365), [extend](https://hackerone.com/reports/381185), [just-extend](https://hackerone.com/reports/430291), [merge.recursive](https://hackerone.com/reports/381194).
{% cwe-references %}
