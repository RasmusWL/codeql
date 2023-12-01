The function `next()` will raise a `StopIteration` exception if the underlying iterator is exhausted. Normally this is fine, but in a generator may cause problems. Since the `StopIteration` is an exception it will be propagated out of the generator causing termination of the generator. This is unlikely to be the expected behavior and may mask errors.

This problem is considered sufficiently serious that [PEP 479](https://www.python.org/dev/peps/pep-0479) has been accepted to modify the handling of `StopIteration` in generators. Consequently, code that does not handle `StopIteration` properly is likely to fail in future versions of Python.


## Recommendation
Each call to `next()` should be wrapped in a `try-except` to explicitly handle `StopIteration` exceptions.


## Example
In the following example, an empty file part way through iteration will silently truncate the output as the `StopIteration` exception propagates to the top level.

{% sample src="UnguardedNextInGeneratorBad.py" %}
In the following example `StopIteration` exception is explicitly handled, allowing all the files to be processed.

{% sample src="UnguardedNextInGeneratorGood.py" %}

## References
* Python PEP index: [PEP 479](https://www.python.org/dev/peps/pep-0479).
{% cwe-references %}
