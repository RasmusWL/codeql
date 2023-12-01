A for-in loop whose iteration variable is a property, a global variable, a local variable from a surrounding scope, or a local variable that is captured in a closure may prevent optimization of the function it appears in, which could make the program run slower. The same applies to for-of loops.

In particular, the V8 engine (which is used by the Google Chrome browser and the Node.js platform) does not currently optimize functions containing such loops.


## Recommendation
Turn the iteration variable into a local variable if possible.


## Example
In the following example, function `extend` copies all properties of its argument `src` into object `dest` using a for-in loop. Note, however, that the loop variable `p` is not declared in `extend`, and thus is interpreted as a global variable.

{% sample src="examples/NonLocalForIn.js" %}
However, this is clearly just a typo, and the `p` should be declared as a local variable instead:

{% sample src="examples/NonLocalForInGood.js" %}
As another example, consider the following generalization of `extend` that accepts zero or more `src` objects:

{% sample src="examples/NonLocalForIn2.js" %}
Note that `p` is now a local variable, but it is declared in the outer function `combine`, not in the inner function `extend` where it is actually used. The declaration should be moved into `extend` as follows:

{% sample src="examples/NonLocalForIn2Good.js" %}
In those (rare) cases where the iteration variable really has to be a global variable or a property, you can introduce a new, local iteration variable and copy its value into the desired global variable or property inside the loop.


## References
* Petka Antonov: [Optimization killers](https://github.com/petkaantonov/bluebird/wiki/Optimization-killers#5-for-in).
{% cwe-references %}
