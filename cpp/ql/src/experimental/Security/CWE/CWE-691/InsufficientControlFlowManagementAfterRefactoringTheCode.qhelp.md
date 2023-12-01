In some situations, after code refactoring, parts of the old constructs may remain. They are correctly accepted by the compiler, but can critically affect program execution. For example, if you switch from \`do {...} while ();\` to \`while () {...}\` forgetting to remove the old construct completely, you get \`while(){...}while();\` which may be vulnerable. These code snippets look suspicious and require the developer's attention.


## Recommendation
We recommend that you use more explicit code transformations.


## Example
The following example demonstrates the erroneous and corrected sections of the code.

{% sample src="InsufficientControlFlowManagementAfterRefactoringTheCode.c" %}

## References
* CWE Common Weakness Enumeration: [ CWE-691: Insufficient Control Flow Management](https://cwe.mitre.org/data/definitions/691.html).
{% cwe-references %}
