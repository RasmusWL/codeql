import lib.RecordedCalls

from RelevantRecordedCall rc, Call call, Function callee
where
  rc.getACall() = call and
  callee = rc.getAPythonCallee() and
  not pointsToResolved(rc, call, callee, _)
select call, "-->", callee
