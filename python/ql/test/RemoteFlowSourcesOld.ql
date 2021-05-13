import python
import semmle.python.web.Http
import semmle.python.web.HttpRequest

HttpRequestTaintSource projectSource() { exists(result.getLocation().getFile().getRelativePath()) }

select projectSource()
