The software uses external input to dynamically construct an XQuery expression which is then used to retrieve data from an XML database. However, the input is not neutralized, or is incorrectly neutralized, which allows an attacker to control the structure of the query.


## Recommendation
Use parameterized queries. This will help ensure the program retains control of the query structure.


## Example
The following example compares building a query by string concatenation (bad) vs. using `bindString` to parameterize the query (good).

{% sample src="XQueryInjection.java" %}

## References
* Balisage: [XQuery Injection](https://www.balisage.net/Proceedings/vol7/html/Vlist02/BalisageVol7-Vlist02.html).
{% cwe-references %}
