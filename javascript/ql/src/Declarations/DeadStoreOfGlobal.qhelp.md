If a global variable is only ever assigned to but its value is never read, this could indicate dead code, a typo or a logic error.


## Recommendation
Ensure that the name of the variable has not been misspelled. If the assignment refers to an externally defined global variable (such as property of the `window` object), you can provide an externs file or a JSLint-style `/*global ...*/` directive to inform the analysis about this variable.


## Example
The following example shows a function for counting the number of leaves in a binary tree. For an inner node, the function first recursively counts the number of leaves in the left and right subtrees, stores them in variables, and then returns their sum. The name of the variable holding the number of leaves in the right subtree has been misspelled: it is spelled `rigtLeaves` instead of `rightLeaves`.

Since undeclared variables in JavaScript are assumed to be global by default, this assignment stores the number of leaves in the right subtree in a global variable `rigtLeaves`, so the algorithm will not work as expected.

{% sample src="examples/DeadStoreOfGlobal.js" %}
To fix this, correct the name of the local variable:

{% sample src="examples/DeadStoreOfGlobalGood.js" %}

## References
* D. Crockford, *JavaScript: The Good Parts*, Appendix A. O'Reilly, 2008.
* Google Closure Tools: [Declaring externs](https://developers.google.com/closure/compiler/docs/api-tutorial3?csw=1#externs).
* JSLint: [Global Variables](http://www.jslint.com/help.html#global).
{% cwe-references %}
