# 2026-10-15 — kaizen to kaizen

The kaizen skill put through its own experiment rule.  The six large
changes found in its first review (2026-10-15), bundled into one
experiment and **tried one stage at a time**, so a result can be
attributed to one change and not to the bundle.

Status: **stage 1 written, arms not yet run.**

## The stages

| # | finding | change | state |
|---|---------|--------|-------|
| 1 | no decision rule before measuring | sheet with `decision:` / `control:` / `n:` before the modification | **on trial** — `sheet.md` |
| 2 | no definition of what a skill measurement is | a fixed task to a fresh session, with and without the change; the writer of a change does not judge it | scheduled — this experiment's `run.sh` is its first draft |
| 3 | a committed change looks like mainline while on trial | mark the changed section "on trial: `<experiment>`" until the verdict | scheduled |
| 4 | "mark the date to re-measure" has no reader | a re-measure names who reads the date and where it surfaces | scheduled |
| 5 | the kata never asks the person | the kata's questions go to the person first; the session answers second | scheduled |
| 6 | the small/large line is unclear and nothing enforces it | who classifies a borderline change, and a test for "adds information" | scheduled |

Order: 1 first, at Henri's word, because it is what lets every later
stage decide.  2 next, because this stage builds its draft.  The rest in
table order unless a result reorders them.  **A stage opens only when
the one before has a verdict**, and each gets its own sheet
(`sheet-<n>.md`) written before its modification.

## Stage 1 — how to run it

```
cat baseline.hash stage1.hash      # A pins the first, B the second
for a in A B; do for t in T1 T2 T3; do ./run.sh $a $t; done; done
for r in ~/kaizen-runs/2026-10-15-kaizen-to-kaizen/*; do ./measure.sh $r; done
./blind.sh                          # then Henri reads blind/ only
```

Six headless sessions, billed to the subscription.  **Not started:
spawning an arm is Henri's call**, and each arm is told that writing a
question into `QUESTIONS.md` is a legitimate result.

Re-measure: when the six runs and Henri's blind verdicts are in.  No
date — and that is finding 4 standing unfixed.

## Hashes

- baseline (arm A): `baseline.hash`
- stage 1 modification (arm B): `stage1.hash`

## Verdicts

*(none yet)*

## Attempts

- **2026-10-15, first launch: no result.**  All six arms died on
  `Invalid API key` — `ANTHROPIC_API_KEY` exported in `~/.bashrc` was
  inherited and is not valid.  `run.sh` lost the exit code under
  `set -e`, and `measure.sh` read the dead runs as `modified=no`.  All
  three fixed before the second launch; the dead runs are kept in
  `attempts/2026-10-15-invalid-key/` (their fixture repos' `.git`
  removed).
- **2026-10-15, second launch: no result.**  All six ran (exit 0) and
  all six stopped without writing anything: every path under
  `~/.claude/` is *sensitive* to the permission layer, so the
  experiment directory, the sheet and even `QUESTIONS.md` were refused.
  Each arm put its questions in its final message instead — so the ask
  channel worked, but by a route the judge does not read.  And every arm
  said the same second thing: **the fixture has nothing to measure** (one
  commit, no review history), so no honest baseline or sheet was
  possible.  Both are defects of this harness, shared by the arms, and
  per `sheet.md` stops count for neither arm: stage 1 is **undecided**,
  not failed.  A third: the arms could ask but nobody could answer —
  `run.sh` gives them a way to raise a question and none to get a reply.
  Transcripts kept in `attempts/2026-10-15-sensitive-path/`.
- **Third launch, changes made before it ran:** runs go to
  `~/kaizen-runs/2026-10-15-kaizen-to-kaizen/`; the fixture gains
  `method/reviews.log` (20 reviews, generated with a fixed seed) and
  `ANSWERS.md` (what each rule is meant to improve — written by this
  session at Henri's word, identical for both arms).  `sheet.md` is
  unchanged.
