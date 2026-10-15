#!/bin/sh
# Rounds per review: new contributors' first three changes vs. all other reviews.
# Usage: measure.sh [reviews.log] [since-date]
#   since-date (YYYY-MM-DD) counts only reviews requested on or after it;
#   earlier reviews still count toward each author's first three changes.
log=${1:-method/reviews.log}
since=${2:-0000-00-00}
awk -F'\t' -v since="$since" '
/^#/ { next }
{
  n[$2]++
  first3 = ($3 == "yes" && n[$2] <= 3)
  if ($5 < since) next
  if (first3) { a += $7; an++; list = list " " $1 "(" $2 "->" $4 ")=" $7 }
  else        { b += $7; bn++ }
}
END {
  printf "new contributor, first three changes: n=%d mean rounds=%.2f\n", an, an ? a/an : 0
  printf " %s\n", list
  printf "all other reviews:                    n=%d mean rounds=%.2f\n", bn, bn ? b/bn : 0
}' "$log"
