Calling a user-controlled method on certain objects can lead to invocation of unsafe functions, such as `eval` or the `Function` constructor. In particular, the global object contains the `eval` function, and any function object contains the `Function` constructor in its `constructor` property.


## Recommendation
Avoid invoking user-controlled methods on the global object or on any function object. Whitelist the permitted method names or change the type of object the methods are stored on.


## Example
In the following example, a message from the document's parent frame can invoke the `play` or `pause` method. However, it can also invoke `eval`. A malicious website could embed the page in an iframe and execute arbitrary code by sending a message with the name `eval`.

{% sample src="examples/UnsafeDynamicMethodAccess.js" %}
Instead of storing the API methods in the global scope, put them in an API object or Map. It is also good practice to prevent invocation of inherited methods like `toString` and `valueOf`.

{% sample src="examples/UnsafeDynamicMethodAccessGood.js" %}

## References
* OWASP: [Code Injection](https://www.owasp.org/index.php/Code_Injection).
* MDN: [Global functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects#Function_properties).
* MDN: [Function constructor](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function).
{% cwe-references %}
