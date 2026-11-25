# Autopilot (autonomous mode)

Autopilot lets the agent run the whole workflow without asking the user questions. Wherever it would have asked, it decides, continues, and saves the decision as its own file in `docs/autodecisions/`. It can be turned on and off at any moment.

Slash names are routing conventions in user messages, not registered commands.

## Turning it on and off

| Request | Effect |
|---|---|
| `/autopilot on`, or plain words such as "run this autonomously, don't ask me anything" | Turn it on |
| `/autopilot off`, or "stop, ask me again" | Turn it off |
| `/autopilot status` | Report the mode, since when, and how many decisions are `needs-review` |
| `/autopilot review` | List decisions, let the user confirm or reverse each |

- Only an explicit instruction from the user turns it on. Never infer it from silence, a long task, or a previous session.
- Record every change in workflow state (`Autopilot: on|off`, the user's instruction and the date) and in the mode log of `docs/autodecisions/README.md` (date, change, instruction). The field in workflow state is the switch: the user may also edit it by hand, and the agent re-reads it before every task and every step, not only at the start of a session.
- On resume, report the recorded mode in the first line. If it is on, continue in autopilot; the user can turn it off at any time.
- **Turning off takes effect at the next decision point.** Finish the current atomic action (the file being written, the subtask in progress), checkpoint, list the autodecisions made in this stretch with their `needs-review` markers, then ask questions normally. Nothing already decided is undone by switching off.
- **Turning on again** resumes from the saved state. Open questions that were already put to the user and are still unanswered are the user's to answer; do not autodecide them without telling the user.
- Any other change to the mode keeps the current task safe: if it cannot be paused cleanly, leave the artifacts `draft` and say so.

## Decision folder

- `docs/autodecisions/README.md` is the index: the mode log, then one row per decision (ID, title, step, date, status, link), ordered by ID.
- One file per decision: `docs/autodecisions/AUTO-0001-short-slug.md`, from [the template](../assets/templates/autonomous-decision.md). Never batch decisions in one file.
- Record a decision every time the agent would otherwise have asked the user: scope, product assumptions, technical choices, prototype choice, harness approval and its location, test approach, conflict resolution, and choices raised by [code review](code-review.md). Include the question that was not asked, the options, the choice, the reasoning, the impact on REQ/JRN/DEC/TASK IDs, how to reverse it, and the sources used.
- A technical decision also gets an [ADR](adr.md). Link the two records both ways. The ADR holds the technical substance; the autodecision holds the fact that the user was not asked and how to revisit it.
- Link each autodecision from the artifact it affects and from workflow state, and keep `needs-review` markers on anything the user may want to revisit.
- Projects created with an older version may keep `docs/autonomous-decisions/`. Use the path recorded in workflow state, never move it without approval.

## Statuses and reversal

`active` (decided, not yet looked at) → `confirmed` (the user accepted it) / `revised` / `reversed`.

- If the user answers a question an autodecision already covered, the user's answer wins: mark the record `reversed` or `confirmed`, and propagate.
- To reverse: update the affected artifacts through the normal [change propagation](../SKILL.md#propagate-changes) with a revision entry, mark dependents `needs-review`, supersede the ADR when technical, and keep the old record as history.

## Limits

Autopilot does not authorise inventing metrics, baselines, budgets, or dates, exposing secrets, material paid services, production data changes, deployment or publication, security testing outside the authorised scope ([product security](security.md)), or other irreversible external actions. It does not skip validation, enforcement or code review. When a decision is blocked by one of these, choose the safest reversible option, record it, and continue independent work. If no safe option exists, record the blocker and stop that thread rather than guessing. Facts only the user can supply (business facts, real numbers, credentials) become labelled assumptions or open threads, never invented values. Mark every artifact that depends on an autodecision so the user can find and review it, and list the decisions at handoff.
