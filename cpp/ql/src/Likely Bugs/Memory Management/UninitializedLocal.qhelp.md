A local non-static variable of a non-class type has an undefined value before it is initialized. For example, it is incorrect to rely on an uninitialized integer to have the value `0`.


## Recommendation
Review the code and consider whether the variable should have an initializer or whether some path through the program lacks an assignment to the variable.


## Example
The function `absWrong` does not initialize the variable `j` in the case where `i = 0`. Functions `absCorrect1` and `absCorrect2` remedy this deficiency by adding an initializer and adding an assignment to one of the paths through the program, respectively.

{% sample src="UninitializedLocal.cpp" %}

## References
* ISO/IEC 9899:2011: [Programming languages - C (Section 6.3.2.1)](https://www.iso.org/standard/57853.html).
{% cwe-references %}
