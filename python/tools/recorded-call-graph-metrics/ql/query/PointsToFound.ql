import python
import lib.RecordedCalls

from RelevantRecordedCall rc, Call call, Value calleeValue
where pointsToResolved(rc, call, _, calleeValue)
select call, "-->", calleeValue
