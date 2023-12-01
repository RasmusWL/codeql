Node.js modules that only export a single value commonly do so by assigning it directly to the `module.exports` property. A common mistake is to assign it to the `exports` variable instead, but this simply overwrites the value of `exports` without affecting the value of `module.exports`, and does not lead to anything being exported.


## Recommendation
Rewrite the assignment to assign to `module.exports` instead.


## Example
In the following example, module `point.js` attempts to export the function `Point` by assigning it to `exports`. As explained above, this does not work as expected: after the assignment, the `exports` *variable* will contain a reference to `Point`, but the `module.exports` *property* still contains a reference to an empty object. Consequently, the client code in `client.js` will fail, since it attempts to call an object as a constructor.

{% sample src="examples/InvalidExport.js" %}
Instead of assigning to `exports`, `point.js` should assign to `module.exports`:

{% sample src="examples/InvalidExportGood.js" %}

## References
* Node.js Manual: [exports alias](http://nodejs.org/api/modules.html#modules_exports_alias).
{% cwe-references %}
