This rule finds If-statements where the "then" branch is empty and there is no "else" branch. These statements are usually unimplemented skeleton code that should be implemented, or real unused code that should be removed.


## Recommendation
There might be missing statements in the then-branch or the If-statement might be able to be removed completely.


## Example
{% sample src="FutileConditional.cs" %}

## References
* MSDN, C\# Reference, [if-else](http://msdn.microsoft.com/en-us/library/5011f09h(v=vs.110).aspx)
{% cwe-references %}
