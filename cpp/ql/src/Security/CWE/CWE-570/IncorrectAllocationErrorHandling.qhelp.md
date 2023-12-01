Different overloads of the `new` operator handle allocation failures in different ways. If `new T` fails for some type `T`, it throws a `std::bad_alloc` exception, but `new(std::nothrow) T` returns a null pointer. If the programmer does not use the corresponding method of error handling, allocation failure may go unhandled and could cause the program to behave in unexpected ways.


## Recommendation
Make sure that exceptions are handled appropriately if `new T` is used. On the other hand, make sure to handle the possibility of null pointers if `new(std::nothrow) T` is used.


## Example
{% sample src="IncorrectAllocationErrorHandling.cpp" %}

## References
* CERT C++ Coding Standard: [MEM52-CPP. Detect and handle memory allocation errors](https://wiki.sei.cmu.edu/confluence/display/cplusplus/MEM52-CPP.+Detect+and+handle+memory+allocation+errors).
{% cwe-references %}
