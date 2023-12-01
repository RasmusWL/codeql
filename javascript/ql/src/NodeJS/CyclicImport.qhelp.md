Module imports in node.js can be cyclic, that is, a module can (directly or indirectly) import itself. In order to prevent an infinite loop, such cyclic imports return incomplete copies of the loaded module, which do not yet have all exported members available. Such incomplete modules are difficult to work with, and cyclic dependencies in general make the code hard to maintain and understand. Consequently, cyclic imports should be avoided.


## Recommendation
Refactor the involved modules to break the dependency cycle.


## Example
In the following example, module `a.js` depends on module `b.js`, which in turn depends on module `a.js`, so they each import the other module, leading to an import cycle.

{% sample src="examples/CyclicImport.js" %}
The cyclic dependency can be fixed by moving `firstName` into module `b.js`, so that it no longer depends on `a.js`:

{% sample src="examples/CyclicImportGood.js" %}

## References
* Brad Harris: [node.js and circular dependencies](https://web.archive.org/web/20200203213815/http://selfcontained.us/2012/05/08/node-js-circular-dependencies/).
* Node.js Manual: [Modules](http://nodejs.org/api/modules.html#modules_cycles).
{% cwe-references %}
