# Experiment: review comments propose a concrete change

**Change.** Add to `method/review.md`: every review comment must propose
a concrete change, not only point at a problem.

**Classified large:** it adds a new rule, i.e. new information.

**Aim** (ANSWERS.md, T1): cut the number of review rounds per change.

## Measurements

From `method/reviews.log` (the whole review history):

 - **Rounds per review**, the target measurement.  Reported raw and
   *mix-adjusted*: new-contributor and established means, weighted
   9:11 as in the baseline, because new contributors' changes take
   more rounds and their share varies from batch to batch.
 - **Compliance**: comments proposing a change / all comments.  If the
   rule isn't followed, rounds tell us nothing about the rule.

`measure.py reviews.log [first_id [last_id]]` computes both.  It was
not run in the session that wrote it (no script execution was
permitted), so the baseline below was counted by hand, twice.  The
re-measurement should run the script on R01–R20 first and check it
matches.

## Baseline, R01–R20 (before the change)

| | reviews | mean rounds |
|---|---|---|
| all | 20 | 2.00 |
| new contributor | 9 | 2.67 |
| established | 11 | 1.45 |
| **mix-adjusted** | | **2.00** |

Compliance: 37/70 comments = 53%.

Split by whether every comment in the review proposed a change:

| | all propose | not all propose |
|---|---|---|
| new contributor | 2.00 (n=3: R08 R11 R14) | 3.00 (n=6) |
| established | 1.00 (n=3: R12 R13 R18) | 1.62 (n=8) |

## Expectation

The split points the same way in both groups: reviews where every
comment proposed a change took about one round fewer for new
contributors and 0.6 fewer for established ones.  If the rule is
followed fully, the mix-adjusted mean should fall from 2.00 to about
(9·2.00 + 11·1.00)/20 = **1.45**.

This is observational, n=3 per cell, and probably confounded (reviews
where it's easy to propose a fix may simply be easier changes), so
expect less than that.  The keep threshold is set at 1.70, about
halfway.  With rounds' spread around 1, the standard error over 20
reviews is about 0.2, so a drop of 0.3 is only borderline detectable;
the sheet accepts that risk rather than waiting for 40 reviews.

## Control

Before/after: the 20 reviews before the change (R01–R20) against the 20
reviews after it.  Nothing else in `method/review.md` changes during the
experiment.  A randomized control (the rule for alternate reviews) would
isolate better but would make the method document itself conditional;
not chosen.

## Re-measure

When R40 is in the log; at the baseline rate (20 reviews in a month),
around **2026-11-15**.  Run `measure.py method/reviews.log R21 R40` and
apply `sheet.md` as written.  Record the result in `result.md`.
