Token validation checks ensure that while validating tokens, all aspects are analyzed and verified. Turning off validation can lead to security holes by allowing untrusted tokens to make it through validation.


## Recommendation
Set `Microsoft.IdentityModel.Tokens.TokenValidationParameters` properties `RequireExpirationTime`, `ValidateAudience`, `ValidateIssuer`, or `ValidateLifetime` to `true`. Or, remove the assignment to `false` because the default value is `true`.


## Example
This example disabled the validation.

{% sample src="security-validation-disabled-bad.cs" %}
To fix it, do not disable the validations or use the default value.

{% sample src="security-validation-disabled-good.cs" %}

## References
* [azure-activedirectory-identitymodel-extensions-for-dotnet ValidatingTokens wiki](https://aka.ms/wilson/tokenvalidation)
{% cwe-references %}
