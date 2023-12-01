The return value of a call to `snprintf` is the number of characters that *would have* been written to the buffer assuming there was sufficient space. In the event that the operation reaches the end of the buffer and more than one character is discarded, the return value will be greater than the buffer size. This can cause incorrect behavior, for example:


## Example
{% sample src="SnprintfOverflowBad.cpp" %}

## Recommendation
The return value of `snprintf` should always be checked if it is used, and values larger than the buffer size should be accounted for.


## Example
{% sample src="SnprintfOverflowGood.cpp" %}

## References
* cplusplus.com: [snprintf](http://www.cplusplus.com/reference/cstdio/snprintf/).
* Red Hat Customer Portal: [The trouble with snprintf](https://access.redhat.com/blogs/766093/posts/1976193).
{% cwe-references %}
