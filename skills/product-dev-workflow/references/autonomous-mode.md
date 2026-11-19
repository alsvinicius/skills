# Autonomous mode (no questions to the user)

Active only when the user explicitly asks for the whole run to be autonomous and not to ask them questions. It does not carry over implicitly from earlier sessions; record the user's instruction and its date in workflow state.

## Decision folder

- Create `docs/autonomous-decisions/` with `README.md` as the index (ID, title, step, date, link), ordered by ID.
- Write one file per decision: `docs/autonomous-decisions/AUTO-0001-short-slug.md`, from [the template](../assets/templates/autonomous-decision.md). Never batch decisions in one file.
- Record a decision every time the agent would otherwise have asked the user: scope, product assumptions, technical choices, prototype choice, harness choice, and conflict resolution. Include the question that was not asked, the options, the choice, the reasoning, the impact on REQ/JRN/DEC/TASK IDs, how to reverse it, and the sources used.
- A technical decision also gets an [ADR](adr.md). Link the two records both ways. The ADR holds the technical substance; the autonomous record holds the fact that the user was not asked and how to revisit it.
- Link each autonomous decision from the artifact it affects and from workflow state, and keep `needs-review` markers on anything the user may want to revisit.

## Limits

Autonomy does not authorise inventing metrics, baselines, budgets, or dates, exposing secrets, material paid services, production data changes, deployment or publication, security testing outside the authorised scope ([product security](security.md)), or other irreversible external actions. When a decision is blocked by one of these, choose the safest reversible option, record it, and continue independent work. If no safe option exists, record the blocker and stop that thread rather than guessing. Mark every artifact that depends on an autonomous assumption so the user can find and review it, and list the decisions at handoff.
