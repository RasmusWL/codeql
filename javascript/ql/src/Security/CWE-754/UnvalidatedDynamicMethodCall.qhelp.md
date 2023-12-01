JavaScript makes it easy to look up object properties dynamically at runtime. In particular, methods can be looked up by name and then called. However, if the method name is user-controlled, an attacker could choose a name that makes the application invoke an unexpected method, which may cause a runtime exception. If this exception is not handled, it could be used to mount a denial-of-service attack.

For example, there might not be a method of the given name, or the result of the lookup might not be a function. In either case the method call will throw a `TypeError` at runtime.

Another, more subtle example is where the result of the lookup is a standard library method from `Object.prototype`, which most objects have on their prototype chain. Examples of such methods include `valueOf`, `hasOwnProperty` and `__defineSetter__`. If the method call passes the wrong number or kind of arguments to these methods, they will throw an exception.


## Recommendation
It is best to avoid dynamic method lookup involving user-controlled names altogether, for instance by using a `Map` instead of a plain object.

If the dynamic method lookup cannot be avoided, consider whitelisting permitted method names. At the very least, check that the method is an own property and not inherited from the prototype object. If the object on which the method is looked up contains properties that are not methods, you should additionally check that the result of the lookup is a function. Even if the object only contains methods, it is still a good idea to perform this check in case other properties are added to the object later on.


## Example
In the following example, an HTTP request parameter `action` property is used to dynamically look up a function in the `actions` map, which is then invoked with the `payload` parameter as its argument.

{% sample src="examples/UnvalidatedDynamicMethodCall.js" %}
The intention is to allow clients to invoke the `play` or `pause` method, but there is no check that `action` is actually the name of a method stored in `actions`. If, for example, `action` is `rewind`, `action` will be `undefined` and the call will result in a runtime error.

The easiest way to prevent this is to turn `actions` into a `Map` and using `Map.prototype.has` to check whether the method name is valid before looking it up.

{% sample src="examples/UnvalidatedDynamicMethodCallGood.js" %}
If `actions` cannot be turned into a `Map`, a `hasOwnProperty` check should be added to validate the method name:

{% sample src="examples/UnvalidatedDynamicMethodCallGood2.js" %}

## References
* OWASP: [Denial of Service](https://www.owasp.org/index.php/Denial_of_Service).
* MDN: [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map).
* MDN: [Object.prototype](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/prototype).
{% cwe-references %}
