/**
 * Provides database quality statistics that are reported by java/telemetry/extractor-information
 * and perhaps warned about by java/diagnostics/database-quality.
 */

import java
import codeql.util.ReportStats

module CallTargetStats implements StatsSig {
  int getNumberOfOk() { result = count(Call c | exists(c.getCallee())) }

  int getNumberOfNotOk() { result = count(Call c | not exists(c.getCallee())) }

  string getOkText() { result = "calls with call target" }

  string getNotOkText() { result = "calls with missing call target" }
}

private class SourceExpr extends Expr {
  SourceExpr() { this.getFile().isSourceFile() }
}

private predicate hasGoodType(Expr e) {
  exists(e.getType()) and not e.getType() instanceof ErrorType
}

module ExprTypeStats implements StatsSig {
  int getNumberOfOk() { result = count(SourceExpr e | hasGoodType(e)) }

  int getNumberOfNotOk() { result = count(SourceExpr e | not hasGoodType(e)) }

  string getOkText() { result = "expressions with known type" }

  string getNotOkText() { result = "expressions with unknown type" }
}

module CallTargetStatsReport = ReportStats<CallTargetStats>;

module ExprTypeStatsReport = ReportStats<ExprTypeStats>;
