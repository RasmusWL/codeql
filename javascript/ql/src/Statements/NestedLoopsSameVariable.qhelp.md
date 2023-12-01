Nested 'for' loops with the same iteration variable are hard to understand, since the inner loop affects the iteration variable of the outer loop. Sometimes this behavior is unintended and indicates a bug.


## Recommendation
Use different iteration variables in both loops.


## Example
In this example, the outer loop iterates `i` from 0 to 10. The inner loop initializes `j` to the value of `i`, and then iterates it down to 5. Hence, the outer loop will never terminate since the inner loop prevents its iteration variable from reaching 10.

{% sample src="examples/NestedLoopsSameVariable.js" %}
Most likely, the loop condition `i>5` of the inner loop is a typo for `j>5`, and similarly the update expression `--i` should be `--j`:

{% sample src="examples/NestedLoopsSameVariableGood.js" %}

## References
* Ecma International, *ECMAScript Language Definition*, 5.1 Edition, Section 12.6.3. ECMA, 2011.
{% cwe-references %}
