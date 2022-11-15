import lib.RecordedCalls

from RelevantRecordedCall rc
where not typeTrackingResolved(rc, _, _, _)
select rc, rc.getACall(), rc.getAPythonCallee()
