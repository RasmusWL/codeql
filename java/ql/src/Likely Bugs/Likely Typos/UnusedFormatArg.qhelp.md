{% render "FormatStringsOverview.inc.qhelp.md" %}


## Recommendation
Change the format string to use all the arguments, or remove the unnecessary arguments.


## Example
The following example supplies three arguments to be formatted, but the format string only refers to two arguments, so this will silently ignore the third argument.

{% sample src="UnusedFormatArgBad.java" %}
{% render "FormatStringsRefs.inc.qhelp.md" %}

