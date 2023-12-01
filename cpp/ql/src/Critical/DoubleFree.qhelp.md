Deallocating memory more than once can lead to a double-free vulnerability. This can be exploited to corrupt the allocator's internal data structures, which can lead to denial-of-service attacks by crashing the program, or security vulnerabilities, by allowing an attacker to overwrite arbitrary memory locations.


## Recommendation
Ensure that all execution paths deallocate the allocated memory at most once. If possible, reassign the pointer to a null value after deallocating it. This will prevent double-free vulnerabilities since most deallocation functions will perform a null-pointer check before attempting to deallocate the memory.


## Example
{% sample src="DoubleFree.cpp" %}

## References
* OWASP: [Doubly freeing memory](https://owasp.org/www-community/vulnerabilities/Doubly_freeing_memory).
{% cwe-references %}
