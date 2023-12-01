A comment that includes the words `TODO`, `FIXME` or similar words often indicates code that is incomplete or broken, or highlights ambiguities in the software's specification.


## Recommendation
Address the problem indicated by the comment.


## Example
In the following example, the programmer has not yet implemented the correct behavior for the case where parameter `a` is zero: the function will return `Infinity` or `NaN` (depending on the values of `b` and `c`) in this case.

{% sample src="examples/TodoComments.js" %}
As a first step to fixing this problem, a check could be introduced that compares `a` to zero and throws an exception if this is the case. A better solution would be to use a different formula that does not rely on `a` being non-zero. Regardless of the solution adopted, the `TODO` comment should then be removed.


## References
* Approxion: [TODO or not TODO](http://www.approxion.com/?p=39).
* Wikipedia: [Comment tags](http://en.wikipedia.org/wiki/Comment_%28computer_programming%29#Tags).
{% cwe-references %}
