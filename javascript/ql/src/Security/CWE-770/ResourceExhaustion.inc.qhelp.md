Applications are constrained by how many resources they can make use of. Failing to respect these constraints may cause the application to be unresponsive or crash. It is therefore problematic if attackers can control the sizes or lifetimes of allocated objects.


## Recommendation
Ensure that attackers can not control object sizes and their lifetimes. If object sizes and lifetimes must be controlled by external parties, ensure you restrict the object sizes and lifetimes so that they are within acceptable ranges.


## Example
The following example allocates a buffer with a user-controlled size.

{% sample src="examples/ResourceExhaustion_buffer.js" %}
This is problematic since an attacker can choose a size that makes the application run out of memory. Even worse, in older versions of Node.js, this could leak confidential memory. To prevent such attacks, limit the buffer size:

{% sample src="examples/ResourceExhaustion_buffer_fixed.js" %}

## Example
As another example, consider an application that allocates an array with a user-controlled size, and then fills it with values:

{% sample src="examples/ResourceExhaustion_array.js" %}
The allocation of the array itself is not problematic since arrays are allocated sparsely, but the subsequent filling of the array will take a long time, causing the application to be unresponsive, or even run out of memory. Again, a limit on the size will prevent the attack:

{% sample src="examples/ResourceExhaustion_array_fixed.js" %}

## Example
Finally, the following example lets a user choose a delay after which a function is executed:

{% sample src="examples/ResourceExhaustion_timeout.js" %}
This is problematic because a large delay essentially makes the application wait indefinitely before executing the function. Repeated registrations of such delays will therefore use up all of the memory in the application. A limit on the delay will prevent the attack:

{% sample src="examples/ResourceExhaustion_timeout_fixed.js" %}

## References
* Wikipedia: [Denial-of-service attack](https://en.wikipedia.org/wiki/Denial-of-service_attack).
{% cwe-references %}
