Assigning a variable to itself does not have any effect. Therefore, such an assignment is either completely unnecessary, or it indicates a typo or a similar mistake.


## Recommendation
If the assignment is unnecessary, remove it. If the assignment indicates a typo or a similar mistake, correct the mistake.


## Example
The following example shows part of a method that is intended to make a copy of an existing `MotionEvent` without preserving its history. On line 8, `o.mFlags` is assigned to itself. Given that the statement is surrounded by statements that transfer information from the fields of `o` to the fields of the new event, `ev`, the statement is clearly a mistake. To correct this, the `mFlags` value should be assigned to `ev.mFlags` instead, as shown in the corrected method.

{% sample src="SelfAssignment.java" %}

## References
* Help - Eclipse Platform: [Java Compiler Errors/Warnings Preferences](https://help.eclipse.org/2020-12/advanced/content.jsp?topic=/org.eclipse.jdt.doc.user/reference/preferences/java/compiler/ref-preferences-errors-warnings.htm).
{% cwe-references %}
