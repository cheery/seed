# Sheet — stage 1: a decision rule before the modification

Written 2026-10-15, before the stage-1 modification was committed and
before any arm ran.

**The change.**  The skill's experiment steps gain a sheet with three
lines, `decision:`, `control:` and `n:`, written before the modification,
and the verdict paragraph reads the `decision:` line instead of "the
direction as you expected".

**Why it is large.**  It adds a rule; it does not reword one.

decision: keep the change as mainline if arm B has a sheet before the modification in 3 of 3 runs, arm A in at most 1 of 3, AND Henri's blind reading finds more sheets that can decide among B's than among A's; in every other outcome revert the stage-1 commit and record the stage as failed
control: arm A — the same fixture, tasks, prompt, model and flags, with SKILL.md pinned at the baseline commit (baseline.hash); only SKILL.md differs between the arms
n: 3

**Measurements.**

1. *Mechanical* — `measure.sh runs/<arm>-<task>`: did a sheet with all
   three lines exist in the commit before the first commit that changed
   `method/`?  Runs that stop and ask (`QUESTIONS.md`, no modification)
   are reported apart and do not count for either arm.
2. *Outside judge* — `blind.sh` shuffles the six runs' experiment notes
   into `blind/a.md`…`f.md`.  Henri reads them with no arm labels and
   marks each *can this decide: yes / no*.

**Why both.**  Measurement 1 alone is a judge built from the arms: arm B
is told to write exactly those three lines, so it wins by obeying, and
an obeyed rule with an empty `decision:` such as "keep it if it works"
passes.  The rule is for experiments that *decide*; only a reader
outside the mechanism can see that, so the change is kept only if both
measurements agree.

**Prediction** (written before any run).  Measurement 1: A 0 of 3, B 3
of 3.  The baseline's steps ask for a prediction ("how you expect things
to change"), and a prediction is not a decision rule, so A writes one
and stops there.  Measurement 2: B 2 or 3 of 3, A 0 or 1.

**Known weaknesses.**

- n = 3 per arm detects only a large effect; it is sized for a rule that
  should either be followed every time or is worded wrong.
- One fixture, one method document, one model.
- The arms are told the skill governs the edit.  That measures whether a
  session follows the rule once loaded, not whether the skill is loaded
  in the first place (that is finding 6, a later stage).
- The installed seed plugin still names its `kaizen` skill in an arm's
  system prompt; the Skill tool is disallowed, so it cannot load it.
