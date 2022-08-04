import python

abstract class SpecialInt extends IntegerLiteral {
  abstract string why();
}

int special_int_with_why() {
  exists(SpecialInt si |
    exists(si.why()) and
    result = si.getValue()
  )
}

abstract class SmallInt extends SpecialInt {
  SmallInt() {
    this.getValue() = [0..10]
  }

  override string why() { result = "small" }
}

class One extends SmallInt {
  One() {
    this.getValue() = special_int_with_why() and
    this.getValue() = 1
  }

  override string why() { none() }
}

// Non-monotonic recursion:
// characteristic predicate of NonMonoWat::One
// --> NonMonoWat::small_ints
// -!->(via dispatch of NonMonoWat::SpecialInt::why) NonMonoWat::One
// --> characteristic predicate of NonMonoWat::One
//
// In human words:

// Whether a value is part of `class One` depends on the dispatch of the
// member-predicate `why`. Since One overrides `why`, we need to know whether the value
// is part of One to correctly determine its value for `why`. In conclusion, whether a
// value is part of One depends on whether a value is part of One, which is not ok.
//
// I think the point is that it _could_ be the case that `why` had no result for One,
// and then a value would be flipping between being part of One or not.
//  - If it wasn't part of One, it would use the definition of why from SmallInt,
//    meaning it would be included in special_int_with_why meaning it could be part of
//    One -- contradiction!
//  - If it was part of One, it would use the definition of why from One, meaning it
//    could not have been part of special_int_with_why, meaning it could not have been
//    part of One -- contradiction.


from SpecialInt si
select si, si.getValue(), si.why()
