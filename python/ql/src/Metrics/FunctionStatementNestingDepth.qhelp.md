A method that contains a high level of nesting can be very difficult to understand. As noted in \[McConnell\], the human brain cannot easily handle more than three levels of nested `if` statements.


## Recommendation
Extract the control flow into a separate generator and use that to control iteration.

Use early exits to move nested statements out of conditions. For example: ` def func(x): if x: long_complex_block() ` can be replaced by ` def func(x): if x: return long_complex_block() `

Extract nested statements into new functions, for example by using the 'Extract Method' refactoring from \[Fowler\].

For more ways to reduce the level of nesting in a method, see \[McConnell\].

Furthermore, a method that has a high level of nesting often indicates that its design can be improved in other ways, as well as dealing with the nesting problem itself.


## Example
In the following example, the code has four levels of nesting and is unnecessarily difficult to read.

{% sample src="FunctionStatementNestingDepth.py" %}
In the following modified example, three different approaches to reducing the nesting depth are shown. The first, `print_character_codes_early_exit`, uses early exits, either `return` or `continue`. The second, `print_character_codes_use_gen`, extracts the control flow into a generator. The third, `print_character_codes_extracted`, uses a separate function for the inner loop.

{% sample src="FunctionStatementNestingDepthGood.py" %}

## References
* M. Fowler, *Refactoring*, pp. 89-95. Addison-Wesley, 1999.
* S. McConnell, *Code Complete*, 2nd Edition, &sect;19.4. Microsoft Press, 2004.
{% cwe-references %}
