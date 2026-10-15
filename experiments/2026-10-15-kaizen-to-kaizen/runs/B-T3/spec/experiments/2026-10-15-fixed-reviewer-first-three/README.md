# Fixed reviewer for a new contributor's first three changes

Change: add a section to `method/review.md` saying that a new contributor
is paired with one fixed reviewer for their first three changes.

Intent (ANSWERS.md, T3): cut the rounds a new contributor's changes take.

## Measurement

Mean review rounds per change, over each new contributor's first three
changes (`new_contributor = yes` in `method/reviews.log`).
`measure.sh [log] [since]` computes it. With `since`, it counts only
authors whose first change came after that date. (The session that set
this up could not run the script, so the baseline below was counted by
hand from the log.)

## Baseline (method/reviews.log, R01–R20, 2026-07-02 – 2026-08-03)

| id  | author | # | reviewer | rounds |
|-----|--------|---|----------|--------|
| R03 | kai    | 1 | eli      | 2 |
| R05 | mo     | 1 | bo       | 3 |
| R08 | mo     | 2 | dara     | 2 |
| R10 | mo     | 3 | aino     | 4 |
| R09 | lumi   | 1 | aino     | 2 |
| R11 | lumi   | 2 | aino     | 2 |
| R15 | lumi   | 3 | dara     | 3 |

n = 7, mean = 18/7 = **2.57 rounds**. For comparison, changes by
established contributors average 16/11 = 1.45 rounds.

No new contributor had a fixed reviewer. The closest case is lumi, whose
first two changes both went to aino (2, 2 rounds); the third went to dara
(3 rounds). That is suggestive but proves nothing.

## Expectation

With a fixed reviewer, the reviewer's expectations stay the same from one
change to the next, so the new contributor learns them once. Rounds
should fall towards the established level. Expected mean: about 2.0,
mostly because later changes need fewer rounds.

## Control and its weakness

The control is the baseline above: the same measurement, taken before
the rule existed. It is a historical control, not a concurrent one, so
drift (other rule changes, different people) is not isolated. Watch for
it: if the mean for established contributors moves well away from 1.45
over the same period, read the result with caution. A concurrent
control (alternating new contributors between arms) was considered.
It was rejected because the method document would then contradict
itself for half of the newcomers, and newcomers arrive at about three
a month.

## Modification

Commit: see `modification.txt`.

## Re-measure

When 7 changes from new contributors after the modification commit are
in the log (about 2–3 contributors; at the past rate, around
2026-12-15), run `measure.sh method/reviews.log "<commit date>"` and
apply `sheet.md`.
