import lib.RecordedCalls

// column i is just used for sorting
from string text, int number, float ratio, int i
where
  exists(int all_rcs | all_rcs = count(XmlRecordedCall rc) and ratio = number.(float) / all_rcs |
    text = "XMLRecordedCall" and number = all_rcs and i = 0
    or
    text = "not IgnoredRecordedCall" and number = all_rcs - count(IgnoredRecordedCall rc) and i = 2
  )
  or
  text = "----------" and
  number = 0 and
  ratio = 0 and
  i = 10
  or
  exists(int all_not_ignored_rcs |
    all_not_ignored_rcs = count(XmlRecordedCall rc | not rc instanceof IgnoredRecordedCall) and
    ratio = number.(float) / all_not_ignored_rcs
  |
    text = "IdentifiedRecordedCall" and
    number = count(IdentifiedRecordedCall rc | not rc instanceof IgnoredRecordedCall) and
    i = 11
    or
    text = "RelevantRecordedCall" and
    number = count(RelevantRecordedCall rc) and
    i = 12
  )
  or
  // points-to
  text = "----------" and
  number = 0 and
  ratio = 0 and
  i = 20
  or
  exists(int all_identified_rcs |
    all_identified_rcs = count(RelevantRecordedCall rc) and
    ratio = number.(float) / all_identified_rcs
  |
    text = "points-to resolved" and
    number = count(RelevantRecordedCall rc | pointsToResolved(rc, _, _, _)) and
    i = 21
    or
    text = "points-to not resolved" and
    number = count(RelevantRecordedCall rc | not pointsToResolved(rc, _, _, _)) and
    i = 22
  )
select i, text, number, ratio * 100 + "%" as percent order by i
