
## Recommendation
Restrict user inputs in the URL of an outgoing request, in particular:

* Avoid user input in the hostname of the URL. Pick the hostname from an allow-list instead of constructing it directly from user input.
* Take care when user input is part of the pathname of the URL. Restrict the input so that path traversal ("`../`") cannot be used to redirect the request to an unintended endpoint.
