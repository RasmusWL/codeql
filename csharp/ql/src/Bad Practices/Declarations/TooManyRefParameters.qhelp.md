Whilst passing method arguments using `ref` is occasionally a sensible thing to do (the canonical example is when writing a 'swap' method), overusing reference parameters can make methods needlessly difficult to understand and call.

Methods end up relying on their parameters being correctly initialized elsewhere and can have problems such as aliasing (when two parameters refer to the same object). They can be difficult to call because the references must refer to l-values (rather than temporary objects), so additional objects must be created to hold the results of the call. Their results can also be difficult to forward to other methods.


## Recommendation
Whilst it is not applicable in every situation, and some judgment must be applied, a common solution is to create a new class that wraps the values you are trying to set in the method and then modify the method to return a new instance of it.


## Example
In this example, populating the `name`, `address` and `tel` fields is done via a method that takes `ref` parameters. This is not very good practice and makes the method confusing.

{% sample src="TooManyRefParametersBad.cs" %}
It is better to wrap the values in their own `Details` class and then return a new instance of `Details`. It is easier to pass to other functions correctly and is easier to understand.

{% sample src="TooManyRefParametersGood.cs" %}
