Double-checked locking requires that the underlying field is `volatile`, otherwise the program can behave incorrectly when running in multiple threads, for example by computing the field twice.


## Recommendation
There are several ways to make the code thread-safe:

1. Avoid double-checked locking, and simply perform everything within the lock statement.
1. Make the field volatile using the `volatile` keyword.
1. Use the `System.Lazy` class, which is guaranteed to be thread-safe. This can often lead to more elegant code.
1. Use `System.Threading.LazyInitializer`.

## Example
The following code defines a property called `Name`, which calls the method `LoadNameFromDatabase` the first time that the property is read, and then caches the result. This code is efficient but will not work properly if the property is accessed from multiple threads, because `LoadNameFromDatabase` could be called several times.

{% sample src="UnsafeLazyInitialization1.cs" %}
A common solution to this is *double-checked locking*, which checks whether the stored value is `null` before locking the mutex. This is efficient because it avoids a potentially expensive lock operation if a value has already been assigned to `name`.

{% sample src="UnsafeLazyInitialization2.cs" %}
However this code is incorrect because the field `name` isn't volatile, which could result in `name` being computed twice on some systems.

The first solution is to simply avoid double-checked locking (Recommendation 1):

{% sample src="UnsafeLazyInitializationFix1.cs" %}
Another fix would be to make the field volatile (Recommendation 2):

{% sample src="UnsafeLazyInitializationFix2.cs" %}
It may often be more elegant to use the class `System.Lazy`, which is automatically thread-safe (Recommendation 3):

{% sample src="UnsafeLazyInitializationFix3.cs" %}

## References
* MSDN: [Lazy&lt;T&gt; Class](https://docs.microsoft.com/en-us/dotnet/api/system.lazy-1).
* MSDN: [LazyInitializer.EnsureInitialized Method](https://docs.microsoft.com/en-us/dotnet/api/system.threading.lazyinitializer.ensureinitialized).
* MSDN: [Implementing Singleton in C\#](https://msdn.microsoft.com/en-us/library/ff650316.aspx).
* MSDN Magazine: [The C\# Memory Model in Theory and Practice](https://msdn.microsoft.com/magazine/jj863136).
* MSDN, C\# Reference: [volatile](https://msdn.microsoft.com/en-us/library/x13ttww7.aspx).
* Wikipedia: [Double-checked locking](https://en.wikipedia.org/wiki/Double-checked_locking).
{% cwe-references %}
