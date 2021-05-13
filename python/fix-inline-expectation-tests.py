#!/usr/bin/env python3

import sys
from pathlib import Path
from dataclasses import MISSING, dataclass
from collections import defaultdict
from enum import Enum
from typing import List
import re

EXPECTATION_RE = r"#\s*\$.*$"

@dataclass
class FileSpec:
    filename: str
    start_line: int
    start_column: int
    end_line: int
    end_colum: int

    def __init__(self, filename, start_line, start_column, end_line, end_colum):
        self.filename = filename.strip()
        self.start_line = int(start_line)
        self.start_column = int(start_column)
        self.end_line = int(end_line)
        self.end_colum = int(end_colum)

class ProblemType(Enum):
    FIXED_MISSING = "Fixed missing result:"
    UNEXPECTED_RESULT = "Unexpected result: "
    MISSING_RESULT = "Missing result:"

class HandleMissing(Enum):
    REMOVE = "remove"
    ADD_TO_MISSING = "add"

@dataclass
class Problem:
    problem: ProblemType
    tag: str
    value: str

    def format_expectation(self) -> str:
        if self.value == "":
            return self.tag
        else:
            return f"{self.tag}={self.value}"

    @classmethod
    def from_input(cls, raw: str):
        raw = raw.strip()
        for pt in ProblemType:
            if raw.startswith(pt.value):
                break
        else:
            raise ValueError("Not a known problem type", raw)

        tag, value = raw[len(pt.value):].split("=")

        return cls(pt, tag, value)


def fix_concept_tests(ct_expected_path: Path, handle_missing: HandleMissing = HandleMissing.REMOVE):

    problems_in_file = defaultdict(lambda: defaultdict(list))

    lines = ct_expected_path.read_text().splitlines()

    if lines[0].startswith("|"):
        inline_expectation_lines = lines
    else:
        # there are multiple query predicates
        start = None
        end = None

        for i, line in enumerate(lines):
            if start is None:
                if line == "failures":
                    start = i + 1
            else:
                if not line.startswith("|"):
                    end = i
                    break

        assert start is not None
        inline_expectation_lines = lines[start:end]

    for line in inline_expectation_lines:
        _, file_spec_raw, _, problem_raw, _ = line.split("|")

        spec = FileSpec(*file_spec_raw.split(":"))

        if spec.start_line != spec.end_line:
            print(f"skipping line {spec.start_line}-{spec.end_line} of {spec.filename} since this script doesn't have multiline support: {line}", file=sys.stderr)
            continue

        problem = Problem.from_input(problem_raw)

        problems_in_file[spec.filename][spec.start_line].append(problem)

    for filename, problems_on_line in problems_in_file.items():
        with ct_expected_path.with_name(filename).open('r+') as f:
            lines = f.readlines()

            for line_num, problems in problems_on_line.items():
                line_index = line_num-1
                problems: List[Problem]
                stuff_we_can_handle = [ProblemType.UNEXPECTED_RESULT]
                if not all(p.problem in stuff_we_can_handle for p in problems):
                    print(f"Skipping line {line_num} of {filename} since not all problems are {stuff_we_can_handle}", file=sys.stderr)
                    continue

                line = lines[line_index]
                if (match := re.search(EXPECTATION_RE, line)):
                    new_expectations = [match.group(0)]
                    line = line[:match.start()]
                else:
                    new_expectations = [" # $"]
                    line = line.rstrip()

                for problem in problems:
                    if problem.problem == ProblemType.UNEXPECTED_RESULT:
                        to_add = problem.format_expectation()
                        if to_add not in new_expectations:
                            new_expectations.append(to_add)
                    else:
                        raise Exception("problem type not handled", problem)

                new_expecatations_formatted = " ".join(new_expectations)
                lines[line_index] = line + new_expecatations_formatted

            f.truncate()
            f.seek(0)
            for line in lines:
                f.write(line.rstrip("\n"))
                f.write("\n")


if __name__ == "__main__":
    ct_in = Path(sys.argv[1])
    fix_concept_tests(ct_in)
