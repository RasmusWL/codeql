Items can be removed from an array using the `splice` method, but when doing so, all subsequent items will be shifted to a lower index. If this is done while iterating over the array, the shifting may cause the loop to skip over the element immediately after the removed element.


## Recommendation
Determine what the loop is supposed to do:

* If the intention is to remove *every occurrence* of a certain value, decrement the loop counter after removing an element, to counterbalance the shift.
* If the loop is only intended to remove *a single value* from the array, consider adding a `break` after the `splice` call.
* If the loop is deliberately skipping over elements, consider moving the index increment into the body of the loop, so it is clear that the loop is not a trivial array iteration loop.

## Example
In this example, a function is intended to remove "`..`" parts from a path:

{% sample src="examples/LoopIterationSkippedDueToShifting.js" %}
However, whenever the input contain two "`..`" parts right after one another, only the first will be removed. For example, the string "`../../secret.txt`" will be mapped to "`../secret.txt`". After removing the element at index 0, the loop counter is incremented to 1, but the second "`..`" string has now been shifted down to index 0 and will therefore be skipped.

One way to avoid this is to decrement the loop counter after removing an element from the array:

{% sample src="examples/LoopIterationSkippedDueToShiftingGood.js" %}
Alternatively, use the `filter` method:

{% sample src="examples/LoopIterationSkippedDueToShiftingGoodFilter.js" %}

## References
* MDN: [Array.prototype.splice()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice).
* MDN: [Array.prototype.filter()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter).
{% cwe-references %}
