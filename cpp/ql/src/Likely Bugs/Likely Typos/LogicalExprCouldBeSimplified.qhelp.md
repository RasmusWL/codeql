This rule finds uses of the short-circuit operators `&&` and `||` where at least one of their operands is a compile-time constant. Such expressions may be confusing for readers and can always be simplified to a constant value, or to the non-constant operand. The rule also finds comparisons on constant values (like `1 > 0`), which can be evaluated ahead of time.


## Recommendation
Simplify the flagged expressions by using the following equivalences (where `c` stands for a non-zero constant, and `x` can be an arbitrary expression):

```cpp

  0 && x == 0    0 || x == x
  x && 0 == 0    x || 0 == x
  c && x == x    c || x == 1
  x && c == x    x || c == 1

```

## Example
{% sample src="LogicalExprCouldBeSimplified.cpp" %}
