When an Android component expects a result from an Activity, `startActivityForResult` can be used. The started Activity can then use `setResult` to return the appropriate data to the calling component.

If an Activity obtains the incoming, user-provided Intent and directly returns it via `setResult` without any checks, the application may be unintentionally giving arbitrary access to its content providers, even if they are not exported, as long as they are configured with the attribute `android:grantUriPermissions="true"`. This happens because the attacker adds the appropriate URI permission flags to the provided Intent, which take effect once the Intent is reflected back.


## Recommendation
Avoid returning user-provided or untrusted Intents via `setResult`. Use a new Intent instead.

If it is required to use the received Intent, make sure that it does not contain URI permission flags, either by checking them with `Intent.getFlags` or removing them with `Intent.removeFlags`.


## Example
The following sample contains three examples. In the first example, a user-provided Intent is obtained and directly returned back with `setResult`, which is dangerous. In the second example, a new Intent is created to safely return the desired data. The third example shows how the obtained Intent can be sanitized by removing dangerous flags before using it to return data to the calling component.

{% sample src="IntentUriPermissionManipulation.java" %}

## References
* Google Help: [Remediation for Intent Redirection Vulnerability](https://support.google.com/faqs/answer/9267555?hl=en).
{% cwe-references %}
