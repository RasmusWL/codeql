This rule indicates a potentially incorrect cast from an byte string (`char *`) to a wide-character string (`wchar_t *`).

This cast might yield strings that are not correctly terminated; including potential buffer overruns when using such strings with some dangerous APIs.


## Recommendation
Do not explicitly cast byte strings to wide-character strings.

For string literals, prepend the literal string with the letter "L" to indicate that the string is a wide-character string (`wchar_t *`).

For converting a byte literal to a wide-character string literal, you would need to use the appropriate conversion function for the platform you are using. Please see the references section for options according to your platform.


## Example
In the following example, an byte string literal (`"a"`) is cast to a wide-character string.

{% sample src="WcharCharConversion.cpp" %}
To fix this issue, prepend the literal with the letter "L" (`L"a"`) to define it as a wide-character string.


## References
* General resources: [std::mbstowcs](https://en.cppreference.com/w/cpp/string/multibyte/mbstowcs)
* Microsoft specific resources: [Security Considerations: International Features](https://docs.microsoft.com/en-us/windows/desktop/Intl/security-considerations--international-features)
{% cwe-references %}
