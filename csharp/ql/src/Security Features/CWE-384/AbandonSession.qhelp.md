Reusing a session could allow an attacker to gain unauthorized access to another account. Always ensure that, when a user logs in or out, the current session is abandoned so that a new session may be started.


## Recommendation
Always call `HttpSessionState.Abandon()` to ensure that the previous session is not used by the new user.


## Example
The following example shows the previous session being used after authentication. This would allow a previous user to use the new user's account.

{% sample src="AbandonSession.cs" %}
This code example solves the problem by not reusing the session, and instead calling `Abandon()` to ensure that the session is not reused.

{% sample src="AbandonSessionFix.cs" %}

## References
* MSDN: [ASP.NET Session State Overview](https://msdn.microsoft.com/en-us/library/ms178581.aspx), [HttpSessionState.Abandon Method ()](https://msdn.microsoft.com/en-us/library/system.web.sessionstate.httpsessionstate.abandon(v=vs.110).aspx).
{% cwe-references %}
