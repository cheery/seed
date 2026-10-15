# Experiment: review comments propose a concrete change

**Status: running** — modification committed, waiting for re-measurement.

## Change

Add to `method/review.md`: every review comment must propose a concrete
change, not only point at a problem.

Classified **large**: it adds a new rule (new information), not a
correction or rephrase of an existing one.

Purpose (from `ANSWERS.md`): cut the number of review rounds per change.

## Measurements

Source: `method/reviews.log`, the whole review history (R01–R20,
2026-07-02 … 2026-08-03).

 - **M1, mean rounds per review** — the target measure.
 - **M2, share of comments that propose a change** —
   `comments_proposing_a_change / comments`; checks that the rule is
   followed at all.  If M2 does not rise, a change in M1 is not due to
   the rule.
 - **M3, mean rounds split by new contributor** — new contributors take
   more rounds regardless, so M1 is compared within each group to keep a
   shift in the contributor mix from looking like an effect.

## Baseline (2026-10-15, R01–R20)

| measure                                   | value            |
|-------------------------------------------|------------------|
| M1 mean rounds, all reviews (n=20)        | 2.00             |
| M2 comments proposing a change            | 37 / 70 = 53 %   |
| M3 mean rounds, new contributor (n=9)     | 2.67             |
| M3 mean rounds, existing contributor (n=11) | 1.45           |

Observational support for the rule in the same data:

| reviews                         | new contributor   | existing contributor | all             |
|---------------------------------|-------------------|----------------------|-----------------|
| every comment proposes a change | 2.00 (n=3)        | 1.00 (n=3)           | 1.50 (n=6)      |
| some comment does not           | 3.00 (n=6)        | 1.63 (n=8)           | 2.21 (n=14)     |

The gap holds inside both groups.  Caveats: the samples are small, and
reviews where every comment proposes a change also tend to have few
comments, so this is a correlation, not proof — hence the experiment.

## Expectation

After the rule:

 - M2 rises from 53 % to at least 90 %.
 - M1 falls from 2.00 to 1.6 or below, and M3 falls in both groups
   (new contributor below 2.67, existing below 1.45).

Success: M2 ≥ 90 % and M1 ≤ 1.6 with both M3 groups lower than baseline.
If M2 rises but M1 does not fall, the rule is followed but does not
help: failed, revert.  If M2 does not rise, the rule is not taken up:
failed, revert (or rethink how it is stated).

## Modification

Commit: see `commit.txt`.

## Re-measure

At the next 20 reviews logged in `method/reviews.log` after the
modification commit (the log ran about 20 reviews a month), or on
**2026-11-15**, whichever comes first.  Compute M1–M3 over the reviews
requested after the commit only, and record the result and verdict here.
