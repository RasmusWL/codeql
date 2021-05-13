/**
 * @name External Entity Expansion (XXE)
 * @kind problem
 */

import python
private import semmle.python.ApiGraphs
private import semmle.python.dataflow.new.DataFlow
private import semmle.python.filters.Tests
private import semmle.python.frameworks.Django
private import semmle.python.ApiGraphs

/** Gets a reference to the `True` literal. */
private DataFlow::LocalSourceNode trueLit(DataFlow::TypeTracker t, DataFlow::Node origin) {
  t.start() and
  result.asExpr().(BooleanLiteral).booleanValue() = true and
  origin = result
  or
  exists(DataFlow::TypeTracker t2 |
    result = trueLit(t2, origin).track(t2, t)
  )
}

/** Gets a reference to the `True` literal. */
DataFlow::Node trueLit(DataFlow::Node origin) {
  trueLit(DataFlow::TypeTracker::end(), origin).flowsTo(result)
}


/**
 * A creation of a `lxml.etree.XMLParser`, that can be used to specify options for
 * XML parsing, when used with the `lxml.etree.parse` function.
 */
class XmlParserCreation extends DataFlow::CallCfgNode {
  XmlParserCreation() {
    this = API::moduleImport("lxml").getMember("etree").getMember("XMLParser").getACall()
  }

  DataFlow::Node getResolveEntitiesArg() { result = this.getArgByName("resolve_entities") }
}

/** A creation of a `lxml.etree.XMLParser` that is unsafe because of `reason`. */
predicate unsafeXmlParserCreation(XmlParserCreation call, string reason, Location loc, string elem) {
  not exists(call.getResolveEntitiesArg()) and
  reason = "does not have resolve_entities specified, which is True by default." and
  loc = call.getLocation() and
  elem = "dummy"
  or
  exists(DataFlow::Node origin |
    call.getResolveEntitiesArg() = trueLit(origin) and
    reason = "has resolve_entities specified to a $@." and
    elem = "value that could be True" and
    loc = origin.getLocation()
  )
}


class ParseCall extends DataFlow::CallCfgNode {
  ParseCall() { this = API::moduleImport("lxml").getMember("etree").getMember("parse").getACall() }

  DataFlow::Node getParserArg() { result in [this.getArg(1), this.getArgByName("parser")] }
}

class LxmlParserConfig extends DataFlow::Configuration {
  LxmlParserConfig() { this = "LxmlParserConfig" }

  override predicate isSource(DataFlow::Node source) {
    source instanceof XmlParserCreation and
    unsafeXmlParserCreation(source, _, _, _)
  }

  override predicate isSink(DataFlow::Node sink) {
    sink = any(ParseCall pc).getParserArg()
  }
}

from ParseCall parseCall, string reason, Location elem1Loc, string elem1Text, Location elem2Loc, string elem2Text
where
  not exists(parseCall.getParserArg()) and
  reason = "the parser argument not specified. This will use a default XMLParser, which has resolve_entities=True." and
  elem1Loc = parseCall.getLocation() and
  elem1Text = "dummy" and
  elem2Loc = parseCall.getLocation() and
  elem2Text = "dummy"
  or
  exists(LxmlParserConfig config, XmlParserCreation source, string parserProblem |
    unsafeXmlParserCreation(source, parserProblem, elem2Loc, elem2Text) and
    config.hasFlow(source, parseCall.getParserArg()) and
    reason = "the $@ " + parserProblem and
    elem1Loc = source.getLocation() and
    elem1Text = "parser specified"
  )
select
  parseCall, "This call allows XXE, since " + reason, elem1Loc, elem1Text, elem2Loc, elem2Text

// TODO: This query does not handle a safe parser set with `set_default_parser`
// as described in https://lxml.de/apidoc/lxml.etree.html#lxml.etree.XMLParser
// and https://lxml.de/apidoc/lxml.etree.html#lxml.etree.set_default_parser






// -------------------------------------------
// TODO: Make issue about the limited capability of back-trackers
DataFlow::Node foo (){
  result = any(XmlParserCreation c).getResolveEntitiesArg()
}

/** Gets a reference to a thing. */
private DataFlow::LocalSourceNode backTrackResolveEntitiesArg(DataFlow::TypeBackTracker t) {
  t.start() and
  result = any(XmlParserCreation c).getResolveEntitiesArg()
  or
  exists(DataFlow::TypeBackTracker t2 |
    result = backTrackResolveEntitiesArg(t2).backtrack(t2, t)
  )
}

/** Gets a reference to a thing. */
DataFlow::LocalSourceNode backTrackResolveEntitiesArg() {
  result = backTrackResolveEntitiesArg(DataFlow::TypeBackTracker::end())
}
// -------------------------------------------
