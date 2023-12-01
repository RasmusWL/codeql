Defensive code can prevent unforeseen circumstances from causing fatal program behaviors. A common defensive code pattern is to guard against dereferencing the values `null` or `undefined`. However, if the situation that some defensive code guards against never can occur, then the defensive code serves no purpose and can safely be removed.


## Recommendation
Examine the surrounding code to determine if the defensive code is worth keeping despite providing no practical use. If it is no longer needed, remove it.


## Example
The following example shows a `cleanupLater` function that asynchronously will perform a cleanup task after some delay. When the cleanup task completes, the function invokes the provided callback parameter `cb`. To prevent a crash by invoking `cb` when it has the value `undefined`, defensive code guards the invocation by checking if `cb` is truthy.

{% sample src="examples/UnneededDefensiveProgramming1_bad.js" %}
However, the `cleanupLater` function is always invoked with a callback argument, so the defensive code condition always holds, and it is therefore not required. The function can therefore be simplified to:

{% sample src="examples/UnneededDefensiveProgramming1_good.js" %}
Guarding against the same situation multiple times is another example of defensive code that provides no practical use. The example below shows a function that assigns a value to a property of an object, where defensive code ensures that the assigned value is not `undefined` or `null`.

{% sample src="examples/UnneededDefensiveProgramming2_bad.js" %}
However, due to coercion rules, `v == undefined` holds for both the situation where `v` is`undefined` and the situation where `v` is`null`, so the `v == null` guard serves no purpose, and can be removed:

{% sample src="examples/UnneededDefensiveProgramming2_good.js" %}

## References
* Wikipedia: [Defensive programming](https://en.wikipedia.org/wiki/Defensive_programming).
{% cwe-references %}
