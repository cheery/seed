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
   `grep -rn '^ *\*On trial:'` lists everything still open, and not
   the two lines here that describe the mark.
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

 1. Build or select the measurements relevant to the change, and
    measure the current state.
 2. Record how you expect things to change after the modification.

    *On trial: what an expectation holds, from 2026-10-15.  Re-check at
    the next full trial.*  Write it as reasoning, not as a form: the
    sheets that could decide (`experiments/2026-10-15-kaizen-to-kaizen/`)
    compared against something that separates the change from other
    causes, checked that the change is followed at all before crediting
    it, and said how noisy the data is.
 3. Make the modification, mark it on trial pointing at the experiment,
    commit it, and record the commit hash in the experiment.
 4. Re-measure, or mark the date to re-measure.

If things change in the direction you expected, the experiment succeeded:
remove the mark, and the modification becomes the mainline.  Otherwise
revert it and record the experiment as failed.

*On trial: measuring a skill, from 2026-10-15.  Re-check at the next full
trial of a skill.*  A skill is measured by giving fresh sessions the same
task with the skill as it was and as changed; the session that wrote the
change does not judge it.  `run.sh` in the experiment above is a worked
example.  It needed data in the fixture to measure, a fixed answers file
so a question was not left unanswered, and run directories outside
`~/.claude/`, where writes are refused.

## Daily kaizen

*On trial: the daily kaizen, from 2026-10-15.  Re-check at the next three
evenings.*

Close the day with four questions, bounded to about fifteen minutes.  The
unbounded version is the one that gets skipped on the day it is most
needed.

    what did we learn · what did we get wrong · what mechanism does
    that earn · what is tomorrow's first thing

The third asks for a mechanism, or a stated reason there is none, and the
next kaizen opens by reading it back.  Ask the person first, with a
concrete hook from the day for each question, and offer your own answers
second.  Write the result where the next session will read it, or it
does not survive the session.

The general improvement kata below is the longer cycle.  Run it only
when it is asked for by name.

## General improvement kata

This is to be used if author or user requests improvement kata:

*On trial: the person answers first, from 2026-10-15.  Re-check at the
next three kaizens.*  The questions below go to the person first.  Give
each a concrete hook from the work so it is not a blank page, then stop
and wait.  Offer your own answers only after theirs, as the second half.
A kaizen answered by the session alone is the session grading itself.

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
