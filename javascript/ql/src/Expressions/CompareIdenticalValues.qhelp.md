Comparing two identical expressions typically indicates a mistake such as a missing `this` qualifier or a misspelled variable name. The only case where such a comparison makes semantic sense is when determining whether a value is `NaN`, since `NaN` does not compare as equal to itself. But even in this case clearer alternatives are available.


## Recommendation
Carefully inspect the comparison to determine whether it is a symptom of a bug. If the comparison is used to check for `NaN`, consider using the `isNaN` function from the standard library instead.


## Example
In the example below, the method `Rectangle.prototype.contains` is intended to check whether a point `(x, y)` lies inside a rectangle given by its origin `(this.x, this.y)`, its width `this.width`, and its height `this.height`.

{% sample src="examples/CompareIdenticalValues.js" %}
Note, however, that on line 11 the programmer forgot to qualify `this.y`, thus ending up comparing the argument `y` against itself. The comparison should be fixed accordingly:

{% sample src="examples/CompareIdenticalValuesGood.js" %}
A common use of self-comparison is to detect `NaN` values, which are the only kind of values that are not considered equal to themselves:

```javascript

function eq(x, y) {
  // check if x is NaN
  if (x !== x) {
    // consider NaN to be equal to itself
    return y !== y;
  }
  return x === y;
}

```
In cases like this one, it is clearer to use the `isNaN` function from the standard library:

```javascript

function eq(x, y) {
  // check if x is NaN
  if (isNaN(x)) {
    // consider NaN to be equal to itself
    return isNaN(y);
  }
  return x === y;
}

```
If you do not want to rely on `isNaN` being defined, you can provide your own implementation: self-comparisons in functions named `isNaN` (regardless of capitalization) are treated specially and will not be flagged.


## References
* Mozilla Developer Network: [NaN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN).
{% cwe-references %}
