Running a Flask application with debug mode enabled may allow an attacker to gain access through the Werkzeug debugger.


## Recommendation
Ensure that Flask applications that are run in a production environment have debugging disabled.


## Example
Running the following code starts a Flask webserver that has debugging enabled. By visiting `/crash`, it is possible to gain access to the debugger, and run arbitrary code through the interactive debugger.

{% sample src="FlaskDebug.py" %}

## References
* Flask Quickstart Documentation: [Debug Mode](http://flask.pocoo.org/docs/1.0/quickstart/#debug-mode).
* Werkzeug Documentation: [Debugging Applications](http://werkzeug.pocoo.org/docs/0.14/debug/).
{% cwe-references %}
