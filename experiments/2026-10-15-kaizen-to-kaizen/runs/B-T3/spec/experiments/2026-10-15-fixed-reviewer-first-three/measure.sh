#!/bin/sh
# Rounds per change over new contributors' first three changes.
# usage: measure.sh [reviews.log] ["YYYY-MM-DD HH:MM"]
# With a date, only authors whose first change was requested at or after
# it are counted.
LOG=${1:-method/reviews.log}
SINCE=${2:-0000-00-00 00:00}
awk -F'\t' -v since="$SINCE" '
  /^#/ { next }
  $3 == "yes" && !($2 in first) { first[$2] = $5 }
  $3 == "yes" && first[$2] >= since && ++k[$2] <= 3 {
    n++; sum += $7
    printf "%s\t%s\t#%d\treviewer=%s\trounds=%s\n", $1, $2, k[$2], $4, $7
  }
  END { printf "n=%d  mean_rounds=%.2f\n", n, (n ? sum / n : 0) }
' "$LOG"
