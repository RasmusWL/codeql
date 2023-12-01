A local variable that is not accessed or initialized is typically a sign of incomplete or pending code changes.


## Recommendation
If an unused variable is no longer needed following refactoring, you should just remove it. If there are incomplete or pending code changes, finish making the changes, and then remove the variable if it is no longer needed.

{% render "../../DeadCode/DeadCodeReferences.inc.qhelp.md" %}

