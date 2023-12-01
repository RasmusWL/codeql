Resources like comments or user profiles can be accessed and modified through an action method. To target a certain resource, the action method accepts an ID parameter pointing to that specific resource. If the methods do not check that the current user is authorized to access the specified resource, an attacker can access a resource by guessing or otherwise determining the linked ID parameter.


## Recommendation
Ensure that the current user is authorized to access the resource of the provided ID.


## Example
In the following example, in the "BAD" case, there is no authorization check, so any user can edit any comment for which they guess or determine the ID parameter. The "GOOD" case includes a check that the current user matches the author of the comment, preventing unauthorized access.

{% sample src="WebFormsExample.cs" %}
The following example shows a similar scenario for the ASP.NET Core framework. As above, the "BAD" case provides an example with no authorization check, and the first "GOOD" case provides an example with a check that the current user authored the specified comment. Additionally, in the second "GOOD" case, the \`Authorize\` attribute is used to restrict the method to administrators, who are expected to be able to access arbitrary resources.

{% sample src="MVCExample.cs" %}

## References
* OWASP: [Insecure Direct Object Refrences](https://wiki.owasp.org/index.php/Top_10_2013-A4-Insecure_Direct_Object_References).
* OWASP: [Testing for Insecure Direct Object References](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/04-Testing_for_Insecure_Direct_Object_References).
* Microsoft Learn: [Resource-based authorization in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/security/authorization/resourcebased?view=aspnetcore-7.0).
{% cwe-references %}
