# Diátaxis guide (self-contained)

Diátaxis is a framework for technical documentation that separates content by the reader's need. This file holds everything the workflow needs; no external skill is required. Structure and mandatory rules live in [shared documentation rules](documentation-and-repo-rules.md).

## Choose the type: the compass

Ask two questions about the content you are about to write.

1. Does it inform **action** (the reader does something) or **cognition** (the reader needs to know or understand something)?
2. Does it serve the reader's **acquisition** of skill (studying) or the **application** of skill (working)?

| | Studying | Working |
|---|---|---|
| **Action** | Tutorial | How-to guide |
| **Cognition** | Explanation | Reference |

If a draft answers different questions in different parts, split it into separate files of the right types and link them.

## The four types

### Tutorial (`tutorials/`)
A lesson that takes a beginner through one reliable path to a small, visible success.
- Written for learning, not for completing a real task. The author is responsible for the outcome.
- Use concrete, numbered steps. Show the expected result after each step so the learner can check progress. Use "we".
- Give one path only. No options, alternatives, or digressions. Link to explanation and reference instead.
- Every step must work exactly as written. Do not write a tutorial for behaviour that is not confirmed and testable.
- Title as an outcome: "Build your first X".

### How-to guide (`how-to/`)
Directions for a competent user to achieve a specific goal.
- Written for working. Assume the reader knows what they want to do.
- Title states the task: "How to configure X". One goal per file.
- Sequence of actions in the order they are done. Handle realistic variations briefly with conditionals ("If X, do Y").
- No teaching, no background, no exhaustive option lists. Link to reference and explanation.

### Reference (`reference/`)
Neutral, accurate description of the machinery: APIs, commands, configuration, data models, errors, limits.
- Written for consulting, not reading end to end. Austere, complete, and consistent.
- Mirror the structure of the thing described; use the same layout for each item (tables and lists work well).
- State facts only: no instructions, opinions, or explanation of why. Examples are for illustration.
- Must stay accurate; update it with every behaviour or interface change. One subject per file.

### Explanation (`explanation/`)
Discussion that deepens understanding: why things are as they are, context, trade-offs, history, alternatives.
- Written for reflection, away from the keyboard. Title can be "About X" or "Why X".
- Make connections, give context, state design reasons and constraints, and admit alternatives and limits. Opinions are acceptable if marked as such.
- No step-by-step instructions and no reference tables. One topic per file; link to ADRs for decision rationale instead of copying them.

## Writing rules for all types

- One reader need per file; the file name and title say which.
- Do not mix types. When tempted to add a how-to step to an explanation, or an explanation to a reference, link instead.
- Use stable file names, relative links, and an `README.md` index per axis folder that lists each file with a one-line description.
- Write only from confirmed behaviour or decisions. Mark provisional content `draft`.
- State the chosen type and why when presenting documentation work.

## Review checklist

- Does each file serve exactly one of the four needs, and does its type match its folder?
- Tutorials: does each step run as written and show its result?
- How-to: one goal, no teaching?
- Reference: facts only, consistent layout, current?
- Explanation: reasons and context, no procedures?
- Are indexes and cross-links complete and valid?

Framework credit: Diátaxis was created by Daniele Procida (https://diataxis.fr). This guide is a condensed paraphrase for workflow use.
