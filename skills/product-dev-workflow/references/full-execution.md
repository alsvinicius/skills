# Full project execution (`/execute`)

Use when the user asks to execute the whole planned project, not just the MVP. It is run by the Executor agent from the [harness](harness-and-agents.md), or directly by the main agent when no harness exists.

## Difference from `/mvp`

| | `/mvp` | `/execute` |
|---|---|---|
| Scope | Smallest set needed for the product to be testable | All phases and all planned tasks |
| Goal | Learn from real use quickly | Deliver the complete specified project |
| Stops after | Phase 1 testable slice | Every phase's exit criteria have evidence |

## Loop

1. Read repository instructions, the plan, linked REQ/JRN/DEC/ADR, workflow state, and the harness validation guide.
2. Take the next unblocked task across all phases, in dependency order. When the project adopted test-first ([TDD](tdd.md)), write the failing tests first and record the red result; with `red-commit: yes`, commit only the tests first on the task branch (local, never pushed) and record the SHA. Implement it fully within its acceptance criteria and BDD scenarios, until the tests pass.
3. Write an [ADR](adr.md) for each technical or architectural decision made.
4. Run the enforcement entry point from `docs/harness/enforcement.md`, then the rest of validation. Use the Validator agent when available and record the evidence. Do not claim a pass that did not happen.
5. Send the change to the Reviewer agent (or review it directly when there is no harness) per [code review](code-review.md). Fix every `blocker` and unwaived `major` finding, re-validate, and have the changed parts re-reviewed, at most two rounds; then leave the task blocked and continue with independent work. A phase review runs before the phase's exit criteria are claimed.
6. Use the Documenter agent when available, or do the same work directly: update Diátaxis docs, indexes, ADR index, workflow state, and revision entries (`docs/revisions/`).
7. Re-read the `Autopilot` field in workflow state, checkpoint, then continue. Do not ask for confirmation at task boundaries.

Honour all scope and authorisation limits: no product-scope changes, deployment, publication, production data changes, secrets, or material paid services without explicit authorisation. Run security checks and tests only inside the approved harness and authorised scope ([product security](security.md)). Escalate only what the plan's stop conditions name. When [autopilot](autonomous-mode.md) is on, record every would-be question as an autodecision in `docs/autodecisions/` instead of asking; if it was switched off, ask as normal from the next decision point.

## Completion

All phases are complete or explicitly blocked, every phase's exit criteria have evidence, every task has a review record with no open blocker, all artifacts and documentation are current and linked, and remaining failures or deferred work are visible. Summarise by phase, then recommend release review.
