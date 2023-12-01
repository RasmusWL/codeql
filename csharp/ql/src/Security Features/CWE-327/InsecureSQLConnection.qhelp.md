SQL Server connections where the client is not enforcing the encryption in transit are susceptible to multiple attacks, including a man-in-the-middle, that would potentially compromise the user credentials and/or the TDS session.


## Recommendation
Ensure that the client code enforces the `Encrypt` option by setting it to `true` in the connection string.


## Example
The following example shows a SQL connection string that is not explicitly enabling the `Encrypt` setting to force encryption.

{% sample src="InsecureSQLConnectionBad.cs" %}
The following example shows a SQL connection string that is explicitly enabling the `Encrypt` setting to force encryption in transit.

{% sample src="InsecureSQLConnectionGood.cs" %}

## References
* Microsoft, SQL Protocols blog: [Selectively using secure connection to SQL Server](https://blogs.msdn.microsoft.com/sql_protocols/2009/10/19/selectively-using-secure-connection-to-sql-server/).
* Microsoft: [SqlConnection.ConnectionString Property](https://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlconnection.connectionstring(v=vs.110).aspx).
* Microsoft: [Using Connection String Keywords with SQL Server Native Client](https://msdn.microsoft.com/en-us/library/ms130822.aspx).
* Microsoft: [Setting the connection properties](https://msdn.microsoft.com/en-us/library/ms378988(v=sql.110).aspx).
{% cwe-references %}
