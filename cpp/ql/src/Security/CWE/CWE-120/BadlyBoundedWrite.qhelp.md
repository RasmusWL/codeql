The program performs a buffer copy or write operation with an incorrect upper limit on the size of the copy. A sufficiently long input will overflow the target buffer. In addition to causing program instability, techniques exist which may allow an attacker to use this vulnerability to execute arbitrary code.


## Recommendation
Use preprocessor defines to specify the size of buffers, and use the same defines as arguments to `strncpy`, `snprintf` etc. This technique will ensure that buffer sizes are always specified correctly so that no overflow occurs.


## Example
{% sample src="BadlyBoundedWrite.c" %}
In this example, the developer has used `snprintf` to control the maximum number of characters that can be written to `buffer`. Unfortunately, perhaps due to modifications since the code was first written, a limited buffer overrun can still occur because the size argument to `snprintf` is larger than the actual size of the buffer.

To fix the problem, either the second argument to `snprintf` should be changed to 80, or the buffer extended to 256 characters. A further improvement is to use a preprocessor define so that the size is only specified in one place, potentially preventing future recurrence of this issue.

{% render "OverrunWriteReferences.inc.qhelp.md" %}

