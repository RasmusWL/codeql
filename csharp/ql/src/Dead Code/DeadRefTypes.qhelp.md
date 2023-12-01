This rule detects classes that are not public and not used. These classes are redundant as they cannot be accessed from outside the project.


## Recommendation
These classes should either be used where appropriate or removed.


## Example
In this example the "Person" class is private so it can only be used in the class it is nested in but it is never used.

{% sample src="DeadRefTypes.cs" %}

## References
* MSDN, Code Analysis for Managed Code, [CA1812: Avoid uninstantiated internal classes](http://msdn.microsoft.com/en-us/library/ms182265.aspx).
{% cwe-references %}
