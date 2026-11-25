# Reconciliation (`/reconcile`)

Use when the repository changed without going through this workflow (manual edits, another tool or agent, a merged branch, a hotfix, a dependency or configuration change) and the workflow artifacts may no longer describe it. Reconciliation evaluates everything that changed since the artifacts were last in sync and brings the artifacts back in line with it.

Reconciliation records what is true now. It does not approve, redo, or undo the change, and it does not authorise new scope.

## Inputs

- Workflow state, with the recorded baseline (`Last reconciled revision`: commit or equivalent) and the revisions of each artifact.
- The repository history and working tree since that baseline. If no baseline is recorded, use the commit that last touched a workflow artifact; if there is none, say so and ask the user for the starting point.
- The PRD, domain model, journeys, technical definition, implementation plan, ADRs, Diátaxis docs, diagrams, harness, and `AGENTS.md`/`CLAUDE.md`.

## Procedure

1. **Establish the change set.** List commits, files, and uncommitted changes since the baseline using the repository's version control. Group them by subject (feature, fix, refactor, dependency, configuration, documentation, test). Inspect statically as in [brownfield discovery](brownfield-discovery.md): do not run the application or claim runtime behaviour the sources do not establish. Never record secret values.
2. **Classify each group** against the artifacts:
   - *No artifact impact:* formatting, typo, internal refactor with unchanged behaviour. Note it and move on.
   - *Implements planned work:* matches an open `TASK-nnn`. Link evidence; set the task status only when its DoD evidence exists.
   - *Unplanned behaviour or scope:* changes what the product does, who it serves, or a business rule. This needs a product decision.
   - *Technical decision made implicitly:* new dependency, data store, boundary, protocol, or pattern. Needs an ADR/`DEC`.
   - *Contradicts an artifact:* the code and an artifact disagree. Do not assume which is right.
   - *Documentation drift:* a Diátaxis page, index, diagram, or `AGENTS.md` section is now inaccurate.
3. **Separate evidence from intent.** Keep observed (code shows it), inferred, confirmed (user decided), and open distinct, as in the brownfield assessment. Record evidence with source path and revision.
4. **Ask about product intent only where it matters.** For unplanned behaviour or a contradiction, ask one to three focused questions per batch: keep it (adopt into the artifacts), change it (create a task), or revert it (create a task). Do not promote observed behaviour to a `REQ` without confirmation. Reuse earlier answers. In [autopilot](autonomous-mode.md), decide and record an autonomous decision instead.
5. **Update the artifacts**, following [Propagate changes](../SKILL.md#propagate-changes), from the authoritative source outward:
   - PRD, domain model, and journeys: confirmed behaviour only; new items get new stable IDs; items that no longer exist are marked retired, never deleted or reused. Adopted unplanned behaviour is recorded as such, with its source evidence.
   - Technical definition and ADRs: record decisions already embodied in the code as ADRs, noting that they were recorded after the fact and by whom they were confirmed, or mark them open when unconfirmed.
   - Implementation plan: update task status and evidence, add tasks for reverts or follow-ups, and re-run the dependency check.
   - Diátaxis docs, diagrams, harness validation commands, and indexes: correct what the change made inaccurate; create only content supported by confirmed behaviour.
   - `AGENTS.md`/`CLAUDE.md`: ensure the [product workflow rule](documentation-and-repo-rules.md#product-workflow-guidance-in-agentsmd-and-claudemd) is present and its links are valid.
6. **Record the round** in `docs/revisions/vN/{product,tech}.md` with motivation "reconciliation of out-of-workflow changes" and the baseline and head revisions, per [project revisions](revisions.md). Bump each changed artifact's `Revision` and index line. Several related changes share one round.
7. **Update workflow state:** set `Last reconciled revision` to the head that was evaluated, record items still `needs-review` with affected IDs and the decision required, and set the next action.
8. **Report** the change set size, what each artifact gained, retired, or changed, what was left open and why, and the recommended next step.

## Boundaries

- Reconciliation edits workflow artifacts and documentation only. It never edits application code, tests, or configuration, and it does not run deployments or security tests.
- Unconfirmed items stay `draft`/`needs-review`; do not mark an artifact `ready` while a reconciliation thread has no disposition.
- If the change set is too large to evaluate in one pass, split it by subject, reconcile in order of product impact, and record the remaining baseline range in workflow state rather than claiming a full reconciliation.
- A change made with the user's explicit instruction to skip the workflow is still reconciled when `/reconcile` is requested; the instruction only exempts the change from being routed through the workflow beforehand.

## Completion

The recorded baseline equals the evaluated head (or a remaining range is stated), every change group has a classification, every artifact whose content changed has a revision entry, no open thread lacks a disposition, and the Diátaxis map, ADR index, and `AGENTS.md`/`CLAUDE.md` links resolve.
