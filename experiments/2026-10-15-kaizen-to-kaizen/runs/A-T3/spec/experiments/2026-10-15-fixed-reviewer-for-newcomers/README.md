# Experiment: a fixed reviewer for a new contributor's first three changes

Date: 2026-10-15.  Change to `method/review.md`.  Classified **large** under
the kaizen skill: it adds a new rule, not a rewording.

## Aim

Cut the number of review rounds a new contributor's changes take
(ANSWERS.md, T3).

## Measurement

Mean `rounds` per review in `method/reviews.log`, over reviews whose author
has `new_contributor = yes` and that are among that author's first three
changes.  The other reviews are reported alongside as a comparison group.
`measure.sh` computes both; the optional second argument restricts the count
to reviews requested on or after a date, for the re-measurement.

## Baseline (reviews.log R01–R20, 2026-07-02 … 2026-08-03)

Counted by hand (running `measure.sh` was not approved in this session; it
implements the same count and should give the same numbers).

| author | first three changes (reviewer) → rounds |
|--------|------------------------------------------|
| kai    | R03 (eli) → 2 — only one change so far |
| mo     | R05 (bo) → 3, R08 (dara) → 2, R10 (aino) → 4 |
| lumi   | R09 (aino) → 2, R11 (aino) → 2, R15 (dara) → 3 |

- New contributor, first three changes: n = 7, mean **2.57** rounds.
- All other reviews: n = 13, mean 1.69 rounds.

No new contributor so far had one reviewer for all their first three
changes.  The nearest case is lumi, whose first two went to aino (2, 2
rounds) before a different reviewer took 3.  One case is not evidence.

## Expectation

Over new contributors who start after the change, mean rounds for their
first three changes drops below the 2.57 baseline, toward the ~1.7 of
everyone else.  Success: mean ≤ 2.2 over at least 6 such reviews (at least
two contributors).  The experiment fails, and the change is reverted, if
the mean stays at or above 2.57 after that many reviews.

The sample is small and the noise large (rounds range 1–4 here), so this
can only detect a big effect.

## Modification

Commit: see `commit.txt`.

## Re-measure

Re-measure on **2026-12-15**, or sooner once six reviews from new
contributors who started after 2026-10-15 are in the log:

    sh spec/experiments/2026-10-15-fixed-reviewer-for-newcomers/measure.sh method/reviews.log 2026-10-15

At the same time, check the `reviewer` column that the rule was actually
followed; reviews where it was not tell us nothing about the rule.

Status: **running**.
