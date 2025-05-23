import go
import semmle.go.security.RequestForgery
import utils.test.InlineExpectationsTest

module FasthttpTest implements TestSig {
  string getARelevantTag() { result = "SsrfSink" }

  predicate hasActualResult(Location location, string element, string tag, string value) {
    exists(RequestForgery::Sink ssrfSink |
      ssrfSink.getLocation() = location and
      element = ssrfSink.toString() and
      value = ssrfSink.toString() and
      tag = "SsrfSink"
    )
  }
}

import MakeTest<FasthttpTest>
