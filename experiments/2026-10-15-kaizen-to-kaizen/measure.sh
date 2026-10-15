#!/bin/bash
# measure.sh RUN_DIR — the mechanical judge.  Prints one line:
#   <run>  modified=yes|no  sheet_before=yes|no  asked=yes|no
# sheet_before: some file under spec/experiments/, in the commit *before* the first
# commit that changes method/, carries decision:, control: and n: — none blank, n a number.
set -u
r=$1; cd "$r" || exit 2
# a run that did not finish is not a result: 2026-10-15 the first six died on an invalid key
# and this judge read them as "modified=no"
ex=$(cat exit.txt 2>/dev/null || echo missing)
[ "$ex" = 0 ] || { echo "$(basename "$r")  RUN FAILED (exit=$ex) — not a result"; exit 0; }
mod=$(git log --reverse --format=%H -- method | sed -n 2p)
asked=no; [ -s QUESTIONS.md ] && asked=yes
if [ -z "$mod" ]; then echo "$(basename "$r")  modified=no  sheet_before=n/a  asked=$asked"; exit 0; fi
ok=no
for f in $(git ls-tree -r --name-only "$mod^" -- spec/experiments 2>/dev/null); do
  s=$(git show "$mod^:$f"); good=1
  for k in decision control n; do
    v=$(printf '%s\n' "$s" | grep -m1 -iE "^[[:space:]]*[-*]*[[:space:]]*\**\`?${k}\`?\**:" | sed -E 's/^[^:]*:[[:space:]*`]*//')
    [ -n "$v" ] || good=0; [ $k = n ] && ! [[ "$v" =~ ^[0-9]+ ]] && good=0
  done
  [ $good = 1 ] && ok=yes
done
echo "$(basename "$r")  modified=yes  sheet_before=$ok  asked=$asked"
