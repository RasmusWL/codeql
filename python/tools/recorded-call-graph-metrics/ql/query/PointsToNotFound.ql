import lib.RecordedCalls

from RelevantRecordedCall rc
where not pointsToResolved(rc, _, _, _)
select rc, rc.getACall()
