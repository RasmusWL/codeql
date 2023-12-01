Using the `.length` property of an untrusted object as a loop bound may cause indefinite looping since a malicious attacker can set the `.length` property to a very large number. For example, when a program that expects an array is passed a JSON object such as `{length: 1e100}`, the loop will be run for 10<sup>100</sup> iterations. This may cause the program to hang or run out of memory, which can be used to mount a denial-of-service (DoS) attack.


## Recommendation
Either check that the object is indeed an array or limit the size of the `.length` property.


## Example
In the example below, an HTTP request handler iterates over a user-controlled object `obj` using the `obj.length` property in order to copy the elements from `obj` to an array.

{% sample src="examples/LoopBoundInjection.js" %}
This is not secure since an attacker can control the value of `obj.length`, and thereby cause the loop to iterate indefinitely. Here the potential DoS is fixed by enforcing that the user-controlled object is an array.

{% sample src="examples/LoopBoundInjection_fixed.js" %}

## References
{% cwe-references %}
