private import codeql.swift.generated.expr.ObjCSelectorExpr

module Impl {
  class ObjCSelectorExpr extends Generated::ObjCSelectorExpr {
    override string toStringImpl() { result = "#selector(...)" }
  }
}
