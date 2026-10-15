#!/bin/bash
# blind.sh — copy each run's experiment sheet(s) into blind/<letter>.md in shuffled
# order, the key into blind.key.  Henri reads blind/ only, marks each "can decide:
# yes|no" in blind/verdicts.txt, and the key is opened after.
set -eu
here=$(cd "$(dirname "$0")" && pwd); mkdir -p "$here/blind"
i=0; for r in $(ls "$here/runs" | shuf); do
  l=$(printf "\\$(printf %o $((97+i)))"); i=$((i+1))
  find "$here/runs/$r/spec/experiments" -type f -name '*.md' -exec cat {} + > "$here/blind/$l.md" 2>/dev/null || echo "(no sheet)" > "$here/blind/$l.md"
  echo "$l $r" >> "$here/blind.key"
done
