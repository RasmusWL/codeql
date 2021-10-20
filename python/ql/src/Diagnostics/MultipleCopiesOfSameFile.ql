/**
 * @name Multiple copies of the same file extracted
 * @description using `pip install .` with pip 1.23 or newer means we end up extracting
 *              the same file twice
 * @kind problem
 * @problem.severity error
 * @precision high
 * @id py/pip-1-23-build-copy
 */

import python

pragma[noinline]
predicate possiblyCopiedToBuild(File repoFile, File buildCopy) {
  // `modulePath` is the path that (we hope) will be used to import this module,
  // so for example `foo/bar.py` for the module `foo.bar`.
  exists(Folder build | build.getRelativePath() = "build") and
  exists(string modulePath |
    (
      modulePath = repoFile.getRelativePath()
      or
      // deal with `src/` prefix
      repoFile.getRelativePath().matches("src/%") and
      modulePath = repoFile.getRelativePath().suffix("src/".length())
    ) and
    buildCopy.getRelativePath() = "build/lib/" + modulePath
  )
}

from File repoFile, File buildCopy
where
  possiblyCopiedToBuild(repoFile, buildCopy) and
  // The following is an approximation of that the two files are identical if all
  // locations in one file are present in the other file, it's probable that they are
  // the same file.
  forall(Location loc1 | loc1.getFile() = repoFile |
    exists(Location loc2 |
      loc2.hasLocationInfo(buildCopy.getAbsolutePath(), loc1.getStartLine(), loc1.getStartColumn(),
        loc1.getEndLine(), loc1.getEndColumn())
    )
  ) and
  forall(Location loc1 | loc1.getFile() = buildCopy |
    exists(Location loc2 |
      loc2.hasLocationInfo(repoFile.getAbsolutePath(), loc1.getStartLine(), loc1.getStartColumn(),
        loc1.getEndLine(), loc1.getEndColumn())
    )
  )
select repoFile,
  "$@ has been extracted twice (also as $@), due to usage of `pip install .` please use `pip install -e .` instead.",
  repoFile, repoFile.getRelativePath(), buildCopy, buildCopy.getRelativePath()
