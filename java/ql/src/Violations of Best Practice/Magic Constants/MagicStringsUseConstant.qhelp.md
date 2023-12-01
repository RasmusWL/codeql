A *magic string* is a string literal (for example, `"SELECT"`, `"127.0.0.1"`) that is used in the middle of a block of code without explanation. It is considered bad practice to use magic strings because:

* A string in isolation can be difficult for other programmers to understand.
* It can be difficult to update the code if the requirements change. For example, if the magic string represents a protocol, changing the protocol means that you must change every occurrence of the protocol.

## Recommendation
Replace the magic string with the existing named constant. This overcomes the two problems with magic strings:

* A named constant (such as `SMTP_HELO`) is more easily understood by other programmers.
* Using the same named constant in many places makes the code much easier to update if the requirements change, because you have to update the string in only one place.

## Example
The following example shows a magic string `internalIp`. This should be replaced by the existing named constant, as shown in the fixed version.

{% sample src="MagicStringsUseConstant.java" %}

## References
* R. C. Martin, *Clean Code: A Handbook of Agile Software Craftsmanship*, &sect;17.G25. Prentice Hall, 2008.
{% cwe-references %}
