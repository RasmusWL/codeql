This query finds pointer dereferences that do not first check the pointer for nullness, even though the same pointer is checked for nullness in other parts of the code. It is likely that the nullness check was accidentally omitted, and that a null pointer dereference can occur. Dereferencing a null pointer and attempting to modify its contents can lead to anything from a segmentation fault to corrupting important system data (including the interrupt table in some architectures).

{% render "pointsToWarning.inc.qhelp.md" %}


## Recommendation
Use a nullness check consistently in all cases where a pointer is dereferenced.


## Example
This code shows two examples where a pointer is dereferenced. The first example checks that the pointer is not null before dereferencing it. The second example fails to perform a nullness check, leading to a potential vulnerability in the code.

{% sample src="InconsistentNullnessTesting.cpp" %}

## References
* SEI CERT C++ Coding Standard: [MEM10-C. Define and use a pointer validation function](https://wiki.sei.cmu.edu/confluence/display/c/MEM10-C.+Define+and+use+a+pointer+validation+function).
{% cwe-references %}
