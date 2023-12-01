An expression that has no effects (such as changing variable values or producing output) and occurs in a context where its value is ignored possibly indicates missing code or a latent bug.


## Recommendation
Carefully inspect the expression to ensure it is not a symptom of a bug.


## Example
The following example shows a named type `Timestamp` that is an alias for `int`, representing time stamps expressed as the number of seconds elapsed since some epoch. The `addDays` method returns a time stamp that is a given number of days after another time stamp, without modifying that time stamp.

However, when `addDays` is used in function `test`, its result is discarded, perhaps because the programmer mistakenly assumed that `addDays` updates the time stamp in place.

{% sample src="ExprHasNoEffect.go" %}
Instead, the result of `addDays` should be assigned back into `t`:

{% sample src="ExprHasNoEffectGood.go" %}
