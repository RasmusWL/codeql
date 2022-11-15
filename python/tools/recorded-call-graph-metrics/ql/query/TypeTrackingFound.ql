import python
import lib.RecordedCalls
private import semmle.python.dataflow.new.internal.DataFlowDispatch

from RelevantRecordedCall rc, Call call, DataFlowCallable dfCallable
where typeTrackingResolved(rc, call, _, dfCallable)
select call, "-->", dfCallable
