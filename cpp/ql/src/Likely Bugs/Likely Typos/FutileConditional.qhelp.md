This rule finds If-statements with an empty then-branch and no else-branch. These statements are usually unimplemented skeleton code that should be implemented, or real unused code that should be removed to avoid confusion and misuse.


## Recommendation
There might be missing statements in the then-branch or the expression in the condition can be rewritten without using an If-statement.


## Example
{% sample src="FutileConditional.cpp" %}
