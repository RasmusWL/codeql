If a class contains two distinct methods of the same name such that:

1. One method is only ever called from the other method.
1. The calling method calls only the other method and nothing else.
Then the first method is no more than a forwarding method for the second and the two methods can probably be merged.

There are several advantages to doing this:

* It reduces the cognitive overhead involved in keeping track of the various different overloaded forms of a method.
* If both methods are public, it simplifies the API of their containing class, making it more discoverable to other programmers.
* It makes it clearer to other programmers that certain methods are called and other methods are not.

## Example
In this example, the two `print` methods in `Bad` can be merged, as one is simply a forwarder for the other. The two classes `Better1` and `Better2` show two alternative ways of merging the methods.

{% sample src="PointlessForwardingMethod.java" %}
