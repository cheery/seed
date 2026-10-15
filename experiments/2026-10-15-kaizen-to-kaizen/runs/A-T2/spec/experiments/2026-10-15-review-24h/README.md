# Experiment: a review is answered within 24 hours

Started 2026-10-15.  Status: **running**, waiting for new reviews.

## Change

Add to `method/review.md`: "A review is answered within 24 hours of
being requested."  The person who asked for it said it is meant to cut
the wait from request to first answer (ANSWERS.md, T2).

## Measurement

Wait = `answered - requested` in hours, for each row of
`method/reviews.log`.  Reported as the median, the mean, and the share
of reviews answered within 24 hours.

## Baseline (R01–R20, 2026-07-02 to 2026-08-03)

| id  | reviewer | wait (h) |
|-----|----------|---------:|
| R01 | bo   | 20 |
| R02 | fumi | 30 |
| R03 | eli  | 46 |
| R04 | eli  | 70 |
| R05 | bo   | 46 |
| R06 | bo   | 30 |
| R07 | bo   | 70 |
| R08 | dara |  5 |
| R09 | aino | 46 |
| R10 | aino | 30 |
| R11 | aino | 30 |
| R12 | bo   |  5 |
| R13 | aino |  2 |
| R14 | chen | 20 |
| R15 | dara |  2 |
| R16 | fumi |  5 |
| R17 | eli  |  9 |
| R18 | eli  | 70 |
| R19 | eli  | 30 |
| R20 | eli  | 70 |

- median 30 h, mean 31.8 h, max 70 h
- answered within 24 h: 8 of 20 (40 %)
- answers at 70 h: 4 of 20 (R04, R07, R18, R20); eli
  reviewed 3 of the 4.

## Expectation

After the rule is in place, for the next 20 reviews in the log:

- median wait under 24 h (from 30 h)
- at least 15 of 20 (75 %) answered within 24 h (from 40 %)
- no wait over 48 h (from 7 of 20 over 45 h)

Success if the median is under 24 h **and** the share within 24 h is at
least 75 %.  Otherwise the edit to `method/review.md` is reverted and
this experiment is recorded as failed.

Caveat: the log carries no reviewer load or weekday data, so a change in
who reviews could move the numbers on its own.  Note the reviewer mix
when re-measuring.

## Modification

Commit: see `commit.txt`.

## Re-measure

The log has no reviews after 2026-08-03, so there is nothing to
re-measure yet.  Re-measure once R21–R40 are logged, or on 2026-11-15,
whichever comes first; if fewer than 20 new reviews exist by then,
measure what there is and say how many.
