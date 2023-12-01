A parameter is never used.

{% render "UnusedVariableNaming.inc.qhelp.md" %}


## Recommendation
Delete the parameter from the relevant function or method. If that is not possible (due to overriding or similar) rename the parameter as described above.


## Example
In this example the parameter `filename` is ignored which is misleading.

{% sample src="UnusedParameter.py" %}
