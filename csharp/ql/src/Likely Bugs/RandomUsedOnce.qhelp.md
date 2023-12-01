A program that uses `System.Random` to generate a sequence of pseudo-random numbers *should not* create a new instance of `Random` every time a new pseudo-random number is required (for example, `new Random().Next()`).

According to MSDN:

> The default seed value is derived from the system clock and has finite resolution. As a result, different `Random` objects that are created in close succession by a call to the default constructor will have identical default seed values and, therefore, will produce identical sets of random numbers.

The sequence of pseudo-random numbers returned by these calls depends only on the value of the seed. If you construct a new `Random` object each time a pseudo-random number is needed, this does not generate a good distribution of pseudo-random numbers, even though the parameterless `Random()` constructor tries to initialize itself with a unique seed.


## Recommendation
Create a `Random` object once and use the same instance when generating sequences of pseudo-random numbers (by calling `Next`, `NextBytes` or `NextDouble`).


## Example
In the first example, the same number is actually output ten times, because the random number generator is initialized with the same time value.

{% sample src="RandomUsedOnce.cs" %}
This is fixed by using a single `Random` instance to guarantee a good distribution.

{% sample src="RandomUsedOnceFix.cs" %}

## References
* MSDN: [Random Constructor](http://msdn.microsoft.com/en-us/library/h343ddh9.aspx).
{% cwe-references %}
