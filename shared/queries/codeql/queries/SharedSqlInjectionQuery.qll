private import codeql.dataflow.DataFlow as DF
private import codeql.dataflow.TaintTracking as TT

signature module LangSig {
  class Base {
    string toString();
  }
}

module SharedSqlExecution<LangSig L, DF::InputSig DataFlowLang> {
  final class FinalBase = L::Base;

  /** Extend this class with library modeling */
  abstract class Range extends FinalBase {
    abstract DataFlowLang::Node getSql();
  }

  /** Use this class in queries */
  final class Concept = Range;
}

module SharedSqlConstruction<LangSig L, DF::InputSig DataFlowLang> {
  final class FinalBase = L::Base;

  /** Extend this class with library modeling */
  abstract class Range extends FinalBase {
    abstract DataFlowLang::Node getSql();
  }

  /** Use this class in queries */
  final class Concept = Range;
}

signature module InputSig<DF::InputSig DataFlowLang> {
  class RemoteFlowSource extends DataFlowLang::Node;

  class StandardSanitizers extends DataFlowLang::Node;

  default predicate isExtraSource(DataFlowLang::Node source) { none() }

  default predicate isExtraSink(DataFlowLang::Node source) { none() }

  default predicate isExtraSanitizer(DataFlowLang::Node source) { none() }
}

module SqlInjectionQuery<
  LangSig L, DF::InputSig DataFlowLang, TT::InputSig<DataFlowLang> TaintTrackingLang,
  InputSig<DataFlowLang> Input>
{
  /**
   * A taint-tracking configuration for detecting "SQL injection" vulnerabilities.
   */
  module SqlInjectionConfig implements DF::Configs<DataFlowLang>::ConfigSig {
    predicate isSource(DataFlowLang::Node source) {
      source instanceof Input::RemoteFlowSource
      or
      Input::isExtraSource(source)
    }

    predicate isSink(DataFlowLang::Node sink) {
      any(SharedSqlExecution<L, DataFlowLang>::Concept e).getSql() = sink
      or
      any(SharedSqlConstruction<L, DataFlowLang>::Concept e).getSql() = sink
      or
      Input::isExtraSink(sink)
    }

    predicate isBarrier(DataFlowLang::Node node) {
      node instanceof Input::StandardSanitizers
      or
      Input::isExtraSanitizer(node)
    }
  }

  private module TaintTracking = TT::TaintFlowMake<DataFlowLang, TaintTrackingLang>;

  /** Global taint-tracking for detecting "SQL injection" vulnerabilities. */
  module SqlInjectionFlow = TaintTracking::Global<SqlInjectionConfig>;

  import SqlInjectionFlow::PathGraph

  query predicate problems(
    SqlInjectionFlow::PathNode alertLocation, SqlInjectionFlow::PathNode source,
    SqlInjectionFlow::PathNode sink, string message, SqlInjectionFlow::PathNode source2,
    string sourceMessage
  ) {
    message = "This SQL query depends on a $@." and
    SqlInjectionFlow::flowPath(source, sink) and
    alertLocation = sink and
    source2 = source and
    sourceMessage = "user-provided value"
  }
}
