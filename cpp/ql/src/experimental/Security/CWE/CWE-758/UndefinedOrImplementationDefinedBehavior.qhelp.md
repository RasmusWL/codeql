In some situations, the code constructs used may be executed in the wrong order in which the developer designed them. For example, if you call multiple functions as part of a single expression, and the functions have the ability to modify a shared resource, then the sequence in which the resource is changed can be unpredictable. These code snippets look suspicious and require the developer's attention.


## Recommendation
We recommend that you use more guaranteed, in terms of sequence of execution, coding techniques.


## Example
The following example demonstrates sections of code with insufficient execution sequence definition.

{% sample src="UndefinedOrImplementationDefinedBehavior.c" %}

## References
* CWE Common Weakness Enumeration: [ EXP10-C. Do not depend on the order of evaluation of subexpressions or the order in which side effects take place](https://wiki.sei.cmu.edu/confluence/display/c/EXP10-C.+Do+not+depend+on+the+order+of+evaluation+of+subexpressions+or+the+order+in+which+side+effects+take+place).
{% cwe-references %}
