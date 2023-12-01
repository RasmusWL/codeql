If two functions with the same name are declared in the same scope, one of the declarations overrides the other without warning. This makes the code hard to read and maintain. In some cases, which declaration overrides which may be platform dependent.


## Recommendation
If the two declarations are duplicates, remove one of them. Otherwise, rename one of them to distinguish the two functions, or turn the function declarations into assignments of function expressions to the same local variable.


## Example
In the following example, function `converter` is defined differently in the two branches of the `if` statement. However, the function definition appearing later in the program text will override the one appearing earlier, independent of the flow of execution through the `if` statement, so in this case it is always the second function that is returned. (Note that this may not be true on older browsers.)

{% sample src="examples/ConflictingFunctions.js" %}
To address this problem, introduce a local variable `converter` and convert the function declarations into assignments of function expressions to this variable:

{% sample src="examples/ConflictingFunctionsGood.js" %}

## References
* Ecma International, *ECMAScript Language Definition*, 5.1 Edition, Section 10.5. ECMA, 2011.
{% cwe-references %}
