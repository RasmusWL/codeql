{% render "FormatStringsOverview.inc.qhelp.md" %}


## Recommendation
Supply the correct number of arguments to the format method, or change the format string to use the correct arguments.


## Example
The following example supplies only one argument to be formatted, but the format string refers to two arguments, so this will throw an `IllegalFormatException`.

{% sample src="MissingFormatArgBad.java" %}
{% render "FormatStringsRefs.inc.qhelp.md" %}

