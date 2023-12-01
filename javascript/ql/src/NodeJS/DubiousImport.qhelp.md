Since JavaScript is a dynamically typed language, module imports in node.js are not statically checked for correctness: calls to `require` simply return an object containing all the exports of the imported module, and accessing a member that was not, in fact, exported, yields `undefined`. This is most likely unintentional and usually indicates a bug.


## Recommendation
Examine the import in question and determine the correct name of the symbol to import.


## Example
In the following example, module `point.js` exports the function `Point` by assigning it to `module.exports`. The client module `client.js` tries to import it by reading from the `Point` property, but since this property does not exist the result will be `undefined`, and the `new` invocation will fail.

{% sample src="examples/DubiousImport.js" %}
Instead of reading the `Point` property, `client.js` should directly use the result of the `require` call:

{% sample src="examples/DubiousImportGood.js" %}

## References
* Node.js Manual: [Modules](http://nodejs.org/api/modules.html).
{% cwe-references %}
