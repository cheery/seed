modification: 02d530b9033014e00cd4ea919014241f06443af4
re-measure: once 20 reviews requested after 2026-10-15 are answered in method/reviews.log (at the baseline pace of ~20 per month, around 2026-11-15)
result: pending
# Review answered within 24 hours

Change: add to `method/review.md` the rule "a review is answered within
24 hours of being requested."

Intent (ANSWERS.md, T2): cut the wait from request to first answer.

## Measurement

Wait = `answered - requested` in hours, per review in
`method/reviews.log`.  Summary: the median wait, and how many reviews
were answered within 24 hours.

## Baseline (R01–R20, 2026-07-02 – 2026-08-03, rule absent)

| id  | reviewer | wait h |
|-----|----------|-------:|
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

n = 20, median 30 h, mean 31.8 h, answered within 24 h: 8 of 20.

## Expectation

With the rule in place, most reviews are answered within the day: the
median wait drops below 24 h and the count within 24 h rises well above
8 of 20.  The 70 h waits (weekend-length gaps) should mostly disappear.

## Caveat

The control is historical: the rule applies to every review, so there
is no concurrent arm without it.  A drift in team load or membership
between the two periods would confound the result.
decision: keep the rule if the median request-to-answer wait of the first 20 reviews requested after the rule lands is under 24 h (baseline 30 h); otherwise revert it
control: the same wait measured on the 20 reviews in method/reviews.log requested before the rule existed (R01–R20, median 30 h, 8 of 20 within 24 h)
n: 20
