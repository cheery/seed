---
name: kaizen
description: improvement kata or kaizen to edit skills and method documents
---

# kaizen

The first session (you) reading this file should locate it from it's place,
and edit this skill. Currently this skill-file is a draft from the author.
Mark it suspected and amenable to changes.

Skill document is an any agent-skill that is available as editable to the session.
Method refers to documents within the repository, eg. (board/README.md, manifesto.md, vision.md, ..)

Whenever we edit any of the skills or method documents.
We should first classify whether the change is small or big.

 - It if is a small change, eg. writing correction or clarifying rephrase.
   Just do it into the files as it stands.
 - If if is a large change, eg. add new information,
   an experiment should be done to verify that the change moves a needle.

## Experiment

Store the experiment to `spec/experiments` if it's repository method files or `.claude/skills` experiment.
Otherwise into `experiments` -directory within the seed -plugin in `~/.claude/skills/seed/experiments`
Each experiment comes its own directory with `<date>-<short-name>/`

Into the experiment:

 - Build or select the measurements that are relevant for the change
 - Measure those measurements against the current state
 - Record how you expect things to change after the modification
 - Write the modification, commit
 - Record the modification's commit hash into the experiment directory
 - Re-measure (or mark the date to re-measure)

If things change into the direction as you expected, the experiment was successful
and the written modification becomes the mainline.
Otherwise the changes to the skill/method are reverted and the experiment is recorded as failed.

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
