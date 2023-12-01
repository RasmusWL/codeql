The program performs a buffer copy or write operation with no upper limit on the size of the copy. By analyzing the bounds of the expressions involved, it appears that certain inputs will cause a buffer overflow to occur in this case. In addition to causing program instability, techniques exist which may allow an attacker to use this vulnerability to execute arbitrary code.

{% render "OverrunWriteRecommendation.inc.qhelp.md" %}


## Example
{% sample src="VeryLikelyOverrunWrite.c" %}
In this example, the call to `sprintf` writes a message of 14 characters (including the terminating null) plus the length of the string conversion of \`userId\` into a buffer with space for just 17 characters. While \`userId\` is checked to occupy no more than 4 characters when converted, there is no space in the buffer for the terminating null character if \`userId &gt;= 1000\`. In this case, the null character overflows the buffer resulting in undefined behavior.

To fix this issue these changes should be made:

* Control the size of the buffer by declaring it with a compile time constant.
* Preferably, replace the call to `sprintf` with `snprintf`, using the defined constant size of the buffer or \`sizeof(buffer)\` as maximum length to write. This will prevent the buffer overflow.
* Increasing the buffer size to account for the full range of \`userId\` and the terminating null character.
{% render "OverrunWriteReferences.inc.qhelp.md" %}

