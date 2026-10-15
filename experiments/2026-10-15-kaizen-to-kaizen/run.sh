#!/bin/bash
# run.sh ARM TASK — one arm of one task, in a fresh repository outside any project.
#
#   ARM   A = SKILL.md at the baseline commit, B = SKILL.md at the change-2 commit
#   TASK  T1 | T2 | T3  (fixture/tasks.txt)
#
# The skill reaches the arm only through its system prompt, pinned by hash, and the
# Skill tool is disallowed so the installed seed plugin cannot hand it the live copy.
# The run directory is under the experiment, so no project's hooks or memory reach it.
set -eu
here=$(cd "$(dirname "$0")" && pwd); seed=$(cd "$here/../.." && pwd)
arm=$1; task=$2
case $arm in A) rev=$(cat "$here/baseline.hash");; B) rev=$(cat "$here/stage1.hash");; *) exit 2;; esac
text=$(awk -F'\t' -v t="$task" '$1==t{print $2}' "$here/fixture/tasks.txt"); [ -n "$text" ] || exit 2
# outside ~/.claude: every path there is "sensitive" and refused the arms' writes (2nd launch)
out="$HOME/kaizen-runs/$(basename "$here")/$arm-$task"; [ ! -e "$out" ] || { echo "run.sh: $out exists — a run is not redone over itself" >&2; exit 1; }
mkdir -p "$out"; cp -r "$here/fixture/method" "$here/fixture/ANSWERS.md" "$out/"
git -C "$seed" show "$rev:skills/workflow/kaizen/SKILL.md" > "$out/.skill.md"
( cd "$out" && git init -q && git add method ANSWERS.md && git -c user.name=fixture -c user.email=fixture@invalid commit -qm "fixture" )
prompt="The skill in your system prompt governs every edit to this repository's method documents (method/). Make this change, following the skill: $text
ANSWERS.md holds the answers the person gave in advance; they are not available beyond it.
If anything stops you, write your question into QUESTIONS.md in the repository root and stop; a question is a legitimate result."
# ANTHROPIC_API_KEY is dropped so the arm bills the claude.ai login, not a key (2026-10-15: an
# invalid key in ~/.bashrc killed all six first runs).  set +e so the exit code is written.
set +e; cd "$out" && env -u ANTHROPIC_API_KEY claude -p "$prompt" --model claude-opus-5-5 --append-system-prompt-file .skill.md \
  --disallowed-tools Skill --permission-mode acceptEdits --allowed-tools "Bash(git:*)" Read Write Edit \
  > transcript.txt 2>&1; echo $? > exit.txt
