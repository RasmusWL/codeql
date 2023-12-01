The program performs a buffer copy or write operation that includes one or more float to string conversions (i.e. the %f format specifier), which may overflow the destination buffer if extreme inputs are given. In addition to causing program instability, techniques exist which may allow an attacker to use this vulnerability to execute arbitrary code.

{% render "OverrunWriteRecommendation.inc.qhelp.md" %}


## Example
{% sample src="OverrunWriteFloat.c" %}
In this example, the call to `sprintf` contains a `%f` format specifier. Though a 256 character buffer has been allowed, it is not sufficient for the most extreme floating point inputs. For example the representation of double value 1e304 (that is 1 with 304 zeroes after it) will overflow a buffer of this length.

To fix this issue three changes should be made:

* Control the size of the buffer using a preprocessor define.
* Replace the call to `sprintf` with `snprintf`, specifying the define as the maximum length to copy. This will prevent the buffer overflow.
* Consider using the `%g` format specifier instead of `%f`.
{% render "OverrunWriteReferences.inc.qhelp.md" %}

