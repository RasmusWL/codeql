This rule finds `delete` expressions whose argument is a pointer that points to memory allocated using the `malloc` function, and calls to `free` whose argument is a pointer that points to memory allocated using the `new` operator. Behavior in such cases is undefined and should be avoided.


## Recommendation
Use the `delete` operator when freeing memory allocated with `new`, and the `free` function when freeing memory allocated with `malloc`.


## Example
{% sample src="NewFreeMismatch.cpp" %}

## References
* isocpp.org 'Standard C++', "[Can I free() pointers allocated with new? Can I delete pointers allocated with malloc()?](https://isocpp.org/wiki/faq/freestore-mgmt#mixing-malloc-and-delete)"
* Wikipedia, "[Relation to malloc and free](https://en.wikipedia.org/wiki/New_and_delete_(C%2B%2B)#Relation_to_malloc_and_free)" in *new and delete (C++)*.
{% cwe-references %}
