A *magic number* is a numeric literal (for example, `8080`, `2048`) that is used in the middle of a block of code without explanation. It is considered bad practice to use magic numbers because:

* A number in isolation can be difficult for other programmers to understand.
* It can be difficult to update the code if the requirements change. For example, if the magic number represents the number of guests allowed, adding one more guest means that you must change every occurrence of the magic number.

## Recommendation
Assign the magic number to a new named constant, and use this instead. This overcomes the two problems with magic numbers:

* A named constant (such as `MAX_GUESTS`) is more easily understood by other programmers.
* Using the same named constant in many places makes the code much easier to update if the requirements change, because you have to update the number in only one place.

## Example
The following example shows a magic number `timeout`. This should be replaced by a new named constant, as shown in the fixed version.

{% sample src="MagicConstantsNumbers.java" %}

## References
* R. C. Martin, *Clean Code: A Handbook of Agile Software Craftsmanship*, &sect;17.G25. Prentice Hall, 2008.
{% cwe-references %}
