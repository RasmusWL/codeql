A constant-time algorithm should be used for checking the value of sensitive headers. In other words, the comparison time should not depend on the content of the input. Otherwise timing information could be used to infer the header's expected, secret value.


## Recommendation
Use `MessageDigest.isEqual()` method to check the value of headers. If this method is used, then the calculation time depends only on the length of input byte arrays, and does not depend on the contents of the arrays.


## Example
The following example uses `String.equals()` method for validating a csrf token. This method implements a non-constant-time algorithm. The example also demonstrates validation using a safe constant-time algorithm.

{% sample src="TimingAttackAgainstHeader.java" %}
