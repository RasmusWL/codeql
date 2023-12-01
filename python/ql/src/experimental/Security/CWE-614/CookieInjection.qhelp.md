Constructing cookies from user input may allow an attacker to perform a Cookie Poisoning attack. It is possible, however, to perform other parameter-like attacks through cookie poisoning techniques, such as SQL Injection, Directory Traversal, or Stealth Commanding, etc. Additionally, cookie injection may relate to attempts to perform Access of Administrative Interface.


## Recommendation
Do not use raw user input to construct cookies.


## Example
This example shows two ways of adding a cookie to a Flask response. The first way uses `set_cookie`'s and the second sets a cookie's raw value through a header, both using user-supplied input.

{% sample src="CookieInjection.py" %}

## References
* Imperva: [Cookie injection](https://docs.imperva.com/bundle/on-premises-knowledgebase-reference-guide/page/cookie_injection.htm).
{% cwe-references %}
