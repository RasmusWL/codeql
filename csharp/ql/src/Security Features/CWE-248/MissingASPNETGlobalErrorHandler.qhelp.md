`Web.config` files that set the `customErrors` mode to `Off` and do not provide an `Application_Error` method in the `global.asax.cs` file rely on the default error pages, which leak information such as stack traces.


## Recommendation
Set the `customErrors` to `On` to prevent the default error page from being displayed, or to `RemoteOnly` to only show the default error page when the application is accessed locally. Alternatively, provide an implementation of the `Application_Error` method in the `global.asax.cs` page.


## Example
The following example shows a `Web.config` file in which the custom errors mode has been set to `Off`.

{% sample src="BadWeb.config" %}
This can be fixed either by specifying a different mode, such as `On`, in the `Web.config` file:

{% sample src="GoodWeb.config" %}
or by defining an `Application_Error` method in the `global.asax.cs` file:

{% sample src="global.asax.cs" %}

## References
{% cwe-references %}
