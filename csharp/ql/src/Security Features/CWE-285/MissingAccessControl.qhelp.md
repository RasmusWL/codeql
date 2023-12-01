Sensitive actions, such as editing or deleting content, or accessing admin pages, should have authorization checks to ensure that they cannot be used by malicious actors.


## Recommendation
Ensure that proper authorization checks are made for sensitive actions. For WebForms applications, the `authorization` tag in `Web.config` XML files can be used to implement access control. The `System.Web.UI.Page.User` property can also be used to verify a user's role. For MVC applications, the `Authorize` attribute can be used to require authorization on specific action methods.


## Example
In the following WebForms example, the case marked BAD has no authorization checks whereas the case marked GOOD uses `User.IsInRole` to check for the user's role.

{% sample src="WebForms.cs" %}
The following `Web.config` file uses the `authorization` tag to deny access to anonymous users, in a `location` tag to have that configuration apply to a specific path.

{% sample src="Web.config" %}
In the following MVC example, the case marked BAD has no authorization checks whereas the case marked GOOD uses the `Authorize` attribute.

{% sample src="MVC.cs" %}

## References
* `Page.User` Property - [Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/api/system.web.ui.page.user?view=netframework-4.8.1#system-web-ui-page-user).
* Control authorization permissions in an ASP.NET application - [Microsoft Learn](https://learn.microsoft.com/en-us/troubleshoot/developer/webapps/aspnet/www-authentication-authorization/authorization-permissions).
* Simple authorization in ASP.NET Core - [Microsoft Learn](https://learn.microsoft.com/en-us/aspnet/core/security/authorization/simple?view=aspnetcore-7.0).
{% cwe-references %}
