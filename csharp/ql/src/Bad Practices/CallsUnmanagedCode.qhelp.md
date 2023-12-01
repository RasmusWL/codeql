Microsoft defines two broad categories for source code. Managed code compiles into bytecode and is then executed by a virtual machine. Unmanaged code is compiled directly into machine code. All C\# code is managed but it is possible to call external unmanaged code. This rule finds calls to `extern` methods that are implemented by unmanaged code. Managed code has many advantages over unmanaged code such as built in memory management performed by the virtual machine and the ability to run compiled programs on a wider variety of architectures.


## Recommendation
Consider whether the calls could be replaced by calls to managed code instead.


## Example
This example shows a function that displays a message box when clicked. It is implemented with unmanaged code from the User32.dll library.

{% sample src="CallsUnmanagedCode.cs" %}

## Fixing by Using Managed Code
This code example does the exact same thing except it uses managed code to do so.

{% sample src="CallsUnmanagedCodeFix.cs" %}

## References
* MSDN, C\# Reference [extern](http://msdn.microsoft.com/en-us/library/e59b22c5(v=vs.80).aspx).
* Wikipedia, [Managed code](http://en.wikipedia.org/wiki/Managed_code).
{% cwe-references %}
