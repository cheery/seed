---
name: kaizen
description: kaizen, the proper end to a session — four questions, and how to place an edit to a skill or any document (small, on trial, full trial); the longer improvement kata when asked for by name
---

# kaizen

**Status: expected.** Second draft by the author, 2026-10-28,
to-be-reviewed by session. Normally this would still be **suspected**
but we are working against very well-trodden territory here.
Most parts we expect to be right, because they're traditional answers.
This file is subject to its own rules below. It should be also changed
without fear, as long as you're aware what you are doing there.
This file directly shapes how sessions learn.

Author understood that any directory tree is part of a learning environment.
The biggest skill a tree and its sessions can learn is to teach
themselves, and to understand what that means.
Learning, whether self-directed or taught, is a skill that binds to the communities where you live.
Kaizen is the central idea in teaching oneself new skills, continuously.

Trees and sessions already know how to teach themselves. That happens by
writing into the tree and then checking whether it helps anything.
That is part of kaizen!

You choose some parts of your learning environment and shape it.
Person or entity teaching themselves shapes an environment that teaches them.
You create an environment where others - and you - can prosper and learn.

The learners are not only sessions.  The tree is also for the person
who works in it and for the people who read it, and they learn from it
too: what was decided, why, and what went wrong.  So a lesson is
written for a human reader as well as for the next session, in plain
words, with the person's own sentences quoted where the wording carries.
A tree that only its sessions can read has stopped teaching the people
it is for, and the people are where its lessons are checked.

Part of it is choosing the curriculum. We need to decide what is worth
learning at each time we shape our memories or environment.

A *skill document* is any agent skill that is available as editable to the session.
A *document* refers to text documents within the repositories accessible for the session, e.g. board/README.md, manifesto.md, vision.md.

## kaizen itself

Close the session with four questions, bounded to about fifteen minutes. The
unbounded version is the one that gets skipped on the day it is most
needed.

 1. what did we learn
 2. what did we get wrong
 3. what mechanism does that earn
 4. what is the next session's first thing

The third asks for a mechanism, or a stated reason there is none, and the
next kaizen opens by reading it back.  Ask the person first, with a
concrete hook from the day for each question, and offer your own answers
second.  Write the result where the next session will read it, or it
does not survive the session.  If the repository has no such place
yet, ask the person where it should be; that is the first mechanism.

*On trial: a lesson points at the day, and the read-back is the check,
from 2026-10-28.  Re-check at the next three kaizens: was a lesson
refused for having no evidence, and did a read-back find one unused?*

A learning environment does two things: it gives the learner something,
and it checks that it was learned.  The kaizen does both.

 - **What it gives** is a lesson written where the next session and
   the person read it.  Each lesson points at something from the session that supports
   it: a commit, an error, a measurement, the person's words.  A lesson
   that points at nothing is not written down; say "nothing new" instead.
   Reflection that is not grounded in what happened can make later work
   worse than no memory at all: in Harness² (arXiv:2610.14224), editing
   the agent without its probe evidence dropped a coding score from
   73.4 to 63.2, and a baseline that stores distilled reflections fell
   up to 6.6 points below no memory.
 - **What it checks** is the read-back.  The next kaizen does not ask
   whether the last mechanism was written, but whether it changed
   anything this session.  A mechanism that nobody met is a lesson not
   yet learned, and saying so is the answer to question 2.

The general improvement kata below is the longer cycle.  Run it only
when it is asked for by name.

## General improvement kata

This is to be used if author or user requests improvement kata:

The questions below go to the person first.  Give
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


## Placing a change

*On trial: proportionate ceremony, from 2026-10-15.  Re-check at the
next three uses of this skill: did a change land in the wrong tier?*

The mechanism a kaizen earns is most often an edit to a skill or a
document.  Before you make it, place the change in one of three tiers.
The cost should match the risk: how many sessions or people will follow
the change, and how hard its effect is to see.

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
trial too: an experiment without data cannot decide.  The on-trial mark
and the kaizen's read-back are how the tree teaches itself; most changes
need nothing more.

## Full trial

*On trial: the probe before the experiment, from 2026-10-28.  Re-check
at the next full trial: did a probe settle it?*

Rarely needed, and costly.  First try a probe: run the same task once
as it was and once changed, and compare what the two did, not whether either was right.
Harness² (arXiv:2610.14224) improves agents this way without any ground
truth.  Only when the contrast cannot tell the two apart, run the
experiment below.

Store the experiment in the repository's `spec/experiments/` when the
change is to the repository's documents or to its `.claude/skills/`.
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

