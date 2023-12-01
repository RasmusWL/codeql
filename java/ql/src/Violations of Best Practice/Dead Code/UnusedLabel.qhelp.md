Loop and `switch` statements can be labeled. These labels can serve as targets for `break` or `continue` statements, to specify which loop or `switch` statement they refer to.

Apart from serving as such jump targets, the labels have no effect on program behavior, which means that having an unused label is suspicious.


## Recommendation
If the label is used to document the intended behavior of a loop or `switch` statement, remove it. It is better to use comments for this purpose. However, an unused label may indicate that something is wrong: that some of the nested `break` or `continue` statements should be using the label. In this case, the current control flow is probably wrong, and you should adjust some jumps to use the label after checking the desired behavior.


## Example
The following example uses a loop and a nested loop to check whether any of the currently active shopping carts contains a particular item. On line 4, the `carts:` label is unused. Inspecting the code, we can see that the `break` statement on line 10 is inefficient because it only breaks out of the nested loop. It could in fact break out of the outer loop, which should improve performance in common cases. By changing the statement on line 10 to read `break carts;`, the label is no longer unused and we improve the code.

{% sample src="UnusedLabel.java" %}

## References
* Help - Eclipse Platform: [Java Compiler Errors/Warnings Preferences](https://help.eclipse.org/2020-12/advanced/content.jsp?topic=/org.eclipse.jdt.doc.user/reference/preferences/java/compiler/ref-preferences-errors-warnings.htm).
{% cwe-references %}
