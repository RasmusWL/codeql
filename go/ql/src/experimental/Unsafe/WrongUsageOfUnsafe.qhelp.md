The package \`unsafe\` provides operations that step outside the type safety guarantees normally provided inside Go programs. This leaves room for errors in the usage of the \`unsafe\` package that are not caught by the compiler.

One possible error is type casting between types of different sizes, that can result in reads to memory locations that are outside the bounds of the original target buffer, and also unexpected values.


## Recommendation
The basic recommendation is to avoid usage of the package \`unsafe\`. If that is not an option, you should always check the size of types you cast your data to/from to make sure they won't result in reading outside of the intended bounds.


## Example
The first example explores a few scenarios of read out of bounds because of an erroneous type casting done with `unsafe.Pointer`.

{% sample src="UnsafeUsageBad.go" %}
The second example show an example of correct type casting done with `unsafe.Pointer`.

{% sample src="UnsafeUsageOK.go" %}

## References
* [Go: What is the Unsafe Package?](https://medium.com/a-journey-with-go/go-what-is-the-unsafe-package-d2443da36350).
* [Go: Cast vs Conversion by Example](https://medium.com/a-journey-with-go/go-cast-vs-conversion-by-example-26e0ef3003f0).
* [Exploitation Exercise with unsafe.Pointer in Go: Information Leak (Part 1)](https://dev.to/jlauinger/exploitation-exercise-with-unsafe-pointer-in-go-information-leak-part-1-1kga).
{% cwe-references %}
