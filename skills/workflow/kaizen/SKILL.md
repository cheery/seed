---
name: kaizen
description: improvement kata or kaizen to edit skills and method documents
---

# kaizen

**Status: suspected.** A first draft by the author, 2026-10-15, first
reviewed by a session the same day.  Any part of it may be wrong, and it
is subject to its own rules below: a small fix goes straight in, a large
one goes through an experiment.

A *skill document* is any agent skill that is available as editable to the session.
*Method* refers to documents within the repository, eg. (board/README.md, manifesto.md, vision.md, ..)

Whenever we edit a skill or a method document, we first classify the
change as small or large.

 - If it is a small change, e.g. a writing correction or a clarifying
   rephrase, make it in the files as they stand.
 - If it is a large change, e.g. adding new information, run an
   experiment to verify that the change moves the needle.

## Experiment

Store the experiment in the repository's `spec/experiments/` when the
change is to the repository's method documents or to its `.claude/skills/`.
Otherwise (a change to a skill in the seed plugin) store it in
`~/.claude/skills/seed/experiments/`.  Each experiment gets its own
directory, `<date>-<short-name>/`.

In the experiment:

 - Build or select the measurements that are relevant for the change
 - Measure those measurements against the current state
 - Record how you expect things to change after the modification
 - Write the experiment's sheet, `sheet.md`, with three lines, none blank:
   - `decision:` what you will do for each outcome — keep or revert, and
     the threshold between them
   - `control:` what isolates the change — the same measurement with
     the change absent
   - `n:` samples per arm, a number

   Commit the sheet.  A sheet with a blank line has said it cannot
   decide; do not make the modification until it can.
 - Write the modification and commit it
 - Record the modification's commit hash into the experiment directory
 - Re-measure (or mark the date to re-measure)

The `decision:` line gives the verdict.  If it says keep, the experiment
was successful and the modification becomes the mainline.  Otherwise the
changes to the skill or method are reverted and the experiment is
recorded as failed.  The sheet is not rewritten after the measurement.

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
