---
name: kaizen
description: improvement kata or kaizen to edit skills and method documents
---

# kaizen

**Status: suspected.** A first draft by the author, 2026-10-15, first
reviewed by a session the same day.  Any part of it may be wrong, and it
is subject to its own rules below.

A *skill document* is any agent skill that is available as editable to the session.
*Method* refers to documents within the repository, eg. (board/README.md, manifesto.md, vision.md, ..)

## Placing a change

*On trial: proportionate ceremony, from 2026-10-15.  Re-check at the
next three uses of this skill: did a change land in the wrong tier?*

Before you edit a skill or a method document, place the change in one of
three tiers.  The cost should match the risk: how many sessions or people
will follow the change, and how hard its effect is to see.

 - **Small**: a correction or a clarifying rephrase.  Make it.
 - **On trial**: everything else, by default.  Make it and commit it,
   and put a mark at the top of the changed part:
   `*On trial: <what to check>.  Re-check <a date, or the next N uses>.*`
   Whoever meets the re-check decides: keep (delete the mark) or revert.
   `grep -rn "On trial:"` lists everything still open.
 - **Full trial**: only when the change will be followed widely *and*
   its effect is hard to see in ordinary use, so an on-trial mark would
   not catch a fault.  Run the experiment below before it becomes
   mainline.

When unsure, choose on trial.  A change with nothing yet to measure is on
trial too: an experiment without data cannot decide.

## Full trial

Store the experiment in the repository's `spec/experiments/` when the
change is to the repository's method documents or to its `.claude/skills/`.
Otherwise (a change to a skill in the seed plugin) store it in
`~/.claude/skills/seed/experiments/`.  Each experiment gets its own
directory, `<date>-<short-name>/`.

 1. Measure the current state.
 2. Write `sheet.md` with three lines, none blank, and commit it:
    - `decision:` keep or revert for each outcome, and the threshold
      between them
    - `control:` the same measurement with the change absent
    - `n:` samples per arm, a number

    A blank line means the sheet cannot decide yet.  Do not modify until
    it can.
 3. Make the modification, mark it on trial pointing at the experiment,
    commit it, and record the commit hash in the experiment.
 4. Re-measure.  The `decision:` line gives the verdict: keep (remove the
    mark) or revert.  Record it in the experiment either way, and do not
    rewrite the sheet after measuring.

## General improvement kata

This is to be used if author or user requests kaizen:

### Long-term vision

 - Define your long-term vision
 - Establish a stretch goal that you do not yet know how to solve completely

### Grasp the current condition

 - Look at where you actually stand right now using real facts and data
 - Study the current reality without jumping straight to solutions or guessing

### Establish the next target condition

 - Pick a short term milestone to reach
 - Narrow your focus so you do not get overwhelmed by the mountain

### Experiment

 - Run a rapid PDCA (Plan,Do,Check,Act) cycle to test the idea
 - Uncover and clear obstacles one small step at a time
