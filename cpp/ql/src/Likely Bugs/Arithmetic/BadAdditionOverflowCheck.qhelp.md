Checking for overflow of integer addition needs to be done with care, because automatic type promotion can prevent the check from working as intended, with the same value (`true` or `false`) always being returned.


## Recommendation
Use an explicit cast to make sure that the result of the addition is not implicitly converted to a larger type.


## Example
{% sample src="BadAdditionOverflowCheckExample1.cpp" %}
On a typical architecture where `short` is 16 bits and `int` is 32 bits, the operands of the addition are automatically promoted to `int`, so it cannot overflow and the result of the comparison is always false.

The code below implements the check correctly, by using an explicit cast to make sure that the result of the addition is `unsigned short` (which may overflow, in which case the comparison would evaluate to `true`).

{% sample src="BadAdditionOverflowCheckExample2.cpp" %}

## References
* [Preserving Rules](http://c-faq.com/expr/preservingrules.html)
* [Understand integer conversion rules](https://www.securecoding.cert.org/confluence/plugins/servlet/mobile#content/view/20086942)
{% cwe-references %}
