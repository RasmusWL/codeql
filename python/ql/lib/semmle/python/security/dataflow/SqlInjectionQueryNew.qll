private import codeql.queries.SharedSqlInjectionQuery
private import semmle.python.dataflow.new.internal.DataFlowImplSpecific::PythonDataFlow as PythonDataFlow
private import semmle.python.dataflow.new.internal.TaintTrackingImplSpecific::PythonTaintTracking as PythonTaintTracking
private import semmle.python.Concepts::PythonLangSig as PythonLangSigg

module Input implements InputSig<PythonDataFlow> {
  import semmle.python.Concepts
  import semmle.python.dataflow.new.RemoteFlowSources
  import semmle.python.dataflow.new.BarrierGuards
}

module Config =
  SqlInjectionQuery<PythonLangSigg, PythonDataFlow, PythonTaintTracking, Input>::SqlInjectionConfig;

module Flow =
  SqlInjectionQuery<PythonLangSigg, PythonDataFlow, PythonTaintTracking, Input>::SqlInjectionFlow;

module Query = SqlInjectionQuery<PythonLangSigg, PythonDataFlow, PythonTaintTracking, Input>;
