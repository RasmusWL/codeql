Flask and Django require a Securely signed key for singing the session cookies. most of the time developers rely on load hardcoded secret keys from a config file or python code. this proves that the way of hardcoded secret can make problems when you forgot to change the constant secret keys.


## Recommendation
In Flask Consider using a secure random generator with [Python standard secrets library](https://docs.python.org/3/library/secrets.html#secrets.token_hex)

In Django Consider using a secure random generator with "get_random_secret_key()"" method from "django.core.management.utils".


## Example
Safe Django SECRET_KEY

{% sample src="examples/example_Django_safe.py" %}
Unsafe Django SECRET_KEY Example:

{% sample src="examples/example_Django_unsafe.py" %}
Safe Flask SECRET_KEY Example:

{% sample src="examples/example_Flask_safe.py" %}
{% sample src="examples/example_Flask_unsafe.py" %}
Unsafe Flask SECRET_KEY Example:

{% sample src="examples/example_Flask_unsafe2.py" %}
config1.py

{% sample src="examples/config1.py" %}
config2.py

{% sample src="examples/config2.py" %}
config3.py

{% sample src="examples/config3.py" %}
__init__.py

{% sample src="examples/settings/__init__.py" %}

## References
* [Flask Documentation](https://flask.palletsprojects.com/en/2.3.x/config/#SECRET_KEY)
* [Django Documentation](https://docs.djangoproject.com/en/4.2/ref/settings/#secret-key)
* [Flask-JWT-Extended Documentation](https://flask-jwt-extended.readthedocs.io/en/stable/basic_usage.html#basic-usage)
* [CVE-2023-27524 - Apache Superset had multiple CVEs related to this kind of Vulnerability](https://www.horizon3.ai/cve-2023-27524-insecure-default-configuration-in-apache-superset-leads-to-remote-code-execution/)
* [CVE-2020-17526 - Apache Airflow had multiple CVEs related to this kind of Vulnerability](https://nvd.nist.gov/vuln/detail/CVE-2020-17526)
* [CVE-2021-41192 - Redash was assigning a environment variable with a default value which it was assigning the default secrect if the environment variable does not exists](https://nvd.nist.gov/vuln/detail/CVE-2021-41192)
{% cwe-references %}
