Using an object after its lifetime has ended results in undefined behavior. When an object's lifetime has ended it relinquishes ownership of its resources and the memory it occupied may be reused for other purposes. If the object is accessed after its lifetime has ended, the program may crash or behave in unexpected ways.


## Recommendation
Ensure that no object is accessed after its lifetime has ended. Use RAII ("Resource Acquisition Is Initialization") to manage the lifetime of objects, and avoid manual memory management, if possible.


## Example
The following two examples demonstrate common lifetime violations when working with the C++ standard library.

The `bad_call_c_api` function contains a use of an expired lifetime. First, a temporary object of type `std::string` is constructed, and a pointer to its internal buffer is stored in a local variable. Once the `c_str()` call returns, the temporary object is destroyed, and the memory pointed to by `p` is freed. Thus, any attempt to dereference `p` inside `c_api` will result in a use-after-free vulnerability. The `good_call_c_api` function contains a fixed version of the first example. The variable `hello` is declared as a local variable, and the pointer to its internal buffer is stored in `p`. The lifetime of hello outlives the call to `c_api`, so the pointer stored in `p` remains valid throughout the call to `c_api`.

{% sample src="UseAfterExpiredLifetime_c_api_call.cpp" %}
The `bad_remove_even_numbers` function demonstrates a potential issue with iterator invalidation. Each C++ standard library container comes with a specification of which operations invalidates iterators pointing into the container. For example, calling `erase` on an object of type `std::vector<T>` invalidates all its iterators, and thus any attempt to dereference the iterator can result in a use-after-free vulnerability. The `good_remove_even_numbers` function contains a fixd version of the third example. The `erase` function returns an iterator to the element following the last element removed, and this return value is used to ensure that `it` remains valid after the call to `erase`.

{% sample src="UseAfterExpiredLifetime_iterator_invalidation.cpp" %}

## References
* CERT C Coding Standard: [MEM30-C. Do not access freed memory](https://wiki.sei.cmu.edu/confluence/display/c/MEM30-C.+Do+not+access+freed+memory).
* OWASP: [Using freed memory](https://owasp.org/www-community/vulnerabilities/Using_freed_memory).
* [Lifetime safety: Preventing common dangling](https://github.com/isocpp/CppCoreGuidelines/blob/master/docs/Lifetime.pdf)
* [Containers library](https://en.cppreference.com/w/cpp/container)
* [RAII](https://en.cppreference.com/w/cpp/language/raii)
{% cwe-references %}
