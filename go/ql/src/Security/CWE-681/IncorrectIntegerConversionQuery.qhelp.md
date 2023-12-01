If a string is parsed into an int using `strconv.Atoi`, and subsequently that int is converted into another integer type of a smaller size, the result can produce unexpected values.

This also applies to the results of `strconv.ParseInt` and `strconv.ParseUint` when the specified size is larger than the size of the type that number is converted to.


## Recommendation
If you need to parse integer values with specific bit sizes, avoid `strconv.Atoi`, and instead use `strconv.ParseInt` or `strconv.ParseUint`, which also allow specifying the bit size.

When using those functions, be careful to not convert the result to another type with a smaller bit size than the bit size you specified when parsing the number.

If this is not possible, then add upper (and lower) bound checks specific to each type and bit size (you can find the minimum and maximum value for each type in the `math` package).


## Example
In the first example, assume that an input string is passed to `parseAllocateBad1` function, parsed by `strconv.Atoi`, and then converted into an `int32` type:

{% sample src="IncorrectIntegerConversion.go" %}
The bounds are not checked, so this means that if the provided number is greater than the maximum value of type `int32`, the resulting value from the conversion will be different from the actual provided value.

To avoid unexpected values, you should either use the other functions provided by the `strconv` package to parse the specific types and bit sizes as shown in the `parseAllocateGood2` function; or check bounds as in the `parseAllocateGood1` function.

{% sample src="IncorrectIntegerConversionGood.go" %}

## Example
In the second example, assume that an input string is passed to `parseAllocateBad2` function, parsed by `strconv.ParseInt` with a bit size set to 64, and then converted into an `int32` type:

{% sample src="IncorrectIntegerConversion.go" %}
If the provided number is greater than the maximum value of type `int32`, the resulting value from the conversion will be different from the actual provided value.

To avoid unexpected values, you should specify the correct bit size as in `parseAllocateGood3`; or check bounds before making the conversion as in `parseAllocateGood4`.

{% sample src="IncorrectIntegerConversionGood.go" %}

## References
* Wikipedia [Integer overflow](https://en.wikipedia.org/wiki/Integer_overflow).
* Go language specification [Integer overflow](https://golang.org/ref/spec#Integer_overflow).
* Documentation for [strconv.Atoi](https://golang.org/pkg/strconv/#Atoi).
* Documentation for [strconv.ParseInt](https://golang.org/pkg/strconv/#ParseInt).
* Documentation for [strconv.ParseUint](https://golang.org/pkg/strconv/#ParseUint).
{% cwe-references %}
