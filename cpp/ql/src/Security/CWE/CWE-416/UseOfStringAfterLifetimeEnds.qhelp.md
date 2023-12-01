Calling `c_str` on a `std::string` object returns a pointer to the underlying character array. When the `std::string` object is destroyed, the pointer returned by `c_str` is no longer valid. If the pointer is used after the `std::string` object is destroyed, then the behavior is undefined.


## Recommendation
Ensure that the pointer returned by `c_str` does not outlive the underlying `std::string` object.


## Example
The following example concatenates two `std::string` objects, and then converts the resulting string to a C string using `c_str` so that it can be passed to the `work` function. However, the underlying `std::string` object that represents the concatenated string is destroyed as soon as the call to `c_str` returns. This means that `work` is given a pointer to invalid memory.

{% sample src="UseOfStringAfterLifetimeEndsBad.cpp" %}
The following example fixes the above code by ensuring that the pointer returned by the call to `c_str` does not outlive the underlying `std::string` objects. This ensures that the pointer passed to `work` points to valid memory.

{% sample src="UseOfStringAfterLifetimeEndsGood.cpp" %}

## References
* [MEM50-CPP. Do not access freed memory](https://wiki.sei.cmu.edu/confluence/display/cplusplus/MEM50-CPP.+Do+not+access+freed+memory).
{% cwe-references %}
