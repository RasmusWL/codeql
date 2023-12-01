Since JavaScript programs are not statically type checked, it is acceptable for a function to return values of different types under different circumstances. In particular, a function can sometimes return the special value `undefined`, while at other times it returns, say, a number. If this is the desired behavior, it should be documented by explicitly returning `undefined` or an expression that evaluates to `undefined` (such as `void 0`) rather than using a return statement without an explicit return value.


## Recommendation
Replace implicit return statements with return statements explicitly returning `undefined` or `void 0` or a similar expression.


## Example
In the following example, the function `solve_quad` computes one of the roots of a quadratic equation given by the coefficients `a`, `b` and `c`. In cases where there are no roots, it returns `undefined` by means of the implicit return statement on line 3.

{% sample src="examples/InconsistentReturn.js" %}
It would be clearer to make this exceptional return value explicit as follows:

{% sample src="examples/InconsistentReturnGood.js" %}

## References
* Mozilla Developer Network: [Return](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/return).
{% cwe-references %}
