In this example, we have a server that shows private information for a user, based on the request parameter `userId`. For privacy reasons, users may only view their own private information, so the server checks that the request parameter `userId` matches a cookie value for the user who is logged in.

{% sample src="examples/bypass.js" %}
This security check is, however, insufficient since an attacker can craft their cookie values to match those of any user. To prevent this, the server can cryptographically sign the security critical cookie values:

{% sample src="examples/bypass_fixed.js" %}
