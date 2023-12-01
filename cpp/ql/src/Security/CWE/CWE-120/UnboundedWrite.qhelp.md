The program performs a buffer copy or write operation with no upper limit on the size of the copy. An unexpectedly long input that reaches this code will cause the buffer to overflow. In addition to causing program instability, techniques exist which may allow an attacker to use this vulnerability to execute arbitrary code.

{% render "OverrunWriteRecommendation.inc.qhelp.md" %}


## Example
{% sample src="UnboundedWrite.c" %}
In this example, the call to `sprintf` may overflow `buffer`. This occurs if the argument `userName` is very long, such that the resulting string is more than the 80 characters allowed.

To fix the problem the call to `sprintf` should be replaced with `snprintf`, specifying a maximum length of 80 characters.

{% render "OverrunWriteReferences.inc.qhelp.md" %}

