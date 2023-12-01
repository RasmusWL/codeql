OAuth 2.0 clients must implement CSRF protection for the redirection URI, which is typically accomplished by including a "state" value that binds the request to the user's authenticated state. The Go OAuth 2.0 library allows you to specify a "state" value which is then included in the auth code URL. That state is then provided back by the remote authentication server in the redirect callback, from where it must be validated. Failure to do so makes the client susceptible to an CSRF attack.


## Recommendation
Always include a unique, non-guessable `state` value (provided to the call to `AuthCodeURL` function) that is also bound to the user's authenticated state with each authentication request, and then validated in the redirect callback.


## Example
The first example shows you the use of a constant state (bad).

{% sample src="ConstantOauth2StateBad.go" %}
The second example shows a better implementation idea.

{% sample src="ConstantOauth2StateBetter.go" %}

## References
* IETF: [The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749#section-10.12)
* IETF: [OAuth 2.0 Security Best Current Practice](https://tools.ietf.org/html/draft-ietf-oauth-security-topics-15#section-2.1)
{% cwe-references %}
