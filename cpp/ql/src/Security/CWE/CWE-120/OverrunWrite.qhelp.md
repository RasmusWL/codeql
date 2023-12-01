The program performs a buffer copy or write operation with no upper limit on the size of the copy, and it appears that certain inputs will cause a buffer overflow to occur in this case. In addition to causing program instability, techniques exist which may allow an attacker to use this vulnerability to execute arbitrary code.

{% render "OverrunWriteRecommendation.inc.qhelp.md" %}


## Example
{% sample src="OverrunWrite.c" %}
In this example, the call to `sprintf` writes a message of 14 characters (including the terminating null) plus the length of the string conversion of \`userId\` into a buffer with space for just 18 characters. As such, if \`userId\` is greater or equal to \`10000\`, the last characters overflow the buffer resulting in undefined behavior.

To fix this issue these changes should be made:

* Control the size of the buffer by declaring it with a compile time constant.
* Preferably, replace the call to `sprintf` with `snprintf`, using the defined constant size of the buffer or \`sizeof(buffer)\` as maximum length to write. This will prevent the buffer overflow.
* Optionally, if \`userId\` is expected to be less than \`10000\`, then return or throw an error if \`userId\` is out of bounds.
* Otherwise, consider increasing the buffer size to at least 25 characters, so that the message is displayed correctly regardless of the value of \`userId\`.
{% render "OverrunWriteReferences.inc.qhelp.md" %}

