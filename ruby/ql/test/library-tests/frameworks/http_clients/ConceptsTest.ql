import ruby
import codeql.ruby.Concepts
import codeql.ruby.DataFlow
import TestUtilities.InlineExpectationsTest

// adopted from Python version in
// https://github.com/github/codeql/blob/ee45e799481356e0a59164f42ac8e4558aa09e61/python/ql/test/experimental/meta/ConceptsTest.qll#L515-L540

class HttpClientRequestTest extends InlineExpectationsTest {
  HttpClientRequestTest() { this = "HttpClientRequestTest" }

  override string getARelevantTag() {
    result in ["clientRequestUrlPart", "clientRequestCertValidationDisabled"]
  }

  override predicate hasActualResult(Location location, string element, string tag, string value) {
    exists(location.getFile().getRelativePath()) and
    exists(HTTP::Client::Request req, DataFlow::Node url |
      url = req.getAUrlPart() and
      location = url.getLocation() and
      element = url.toString() and
      value = url.toString() and
      tag = "clientRequestUrlPart"
    )
    or
    exists(location.getFile().getRelativePath()) and
    exists(HTTP::Client::Request req |
      req.disablesCertificateValidation(_) and
      location = req.getLocation() and
      element = req.toString() and
      value = "" and
      tag = "clientRequestCertValidationDisabled"
    )
  }
}
