from flask import Flask, request
app = Flask(__name__)


@app.route("/format-string-injection")
def format_string_injection():
    user_input = request.args.get("user-input")

    user_input.format(1) # NOT OK
    format(1, user_input) # NOT OK
