# MVP implementation workflow

Use this step when the user invokes `/mvp`, asks to implement the planned MVP, or resumes an active MVP implementation. Read the repository's `AGENTS.md` and equivalent local instructions first. Also read the ready implementation plan, relevant requirements, user journeys, technical definition, and workflow state. If required inputs are missing or stale, inspect actual content and identify the specific gap; do not treat a `ready` label or revision number as sufficient by itself.

## Scope: the minimum necessary to test the product

`/mvp` builds only the smallest possible slice that lets the product be tested by real users or against its core hypothesis. It is not "implement everything in Phase 1". Do not build anything that is not needed for that test, even if it is planned, nice to have, or cheap.

Before coding, derive the **testable slice** from the plan and confirm it is the minimum:

1. State the core hypothesis or journey to test, with the `REQ`/`JRN` IDs that carry it.
2. Select only the tasks (or the subset of a task) without which that journey cannot be run end to end by a tester. Include essential security, data integrity, and deployment-to-test-environment needs only if the test cannot happen safely without them.
3. For every other planned Phase 1 task, mark it `deferred-from-mvp` in workflow state with the reason. Do not implement it. Later work belongs to `/execute` or a later phase.
4. Record the slice as the MVP test boundary in workflow state (included task IDs, excluded task IDs, how the product will be tested). If the plan's Phase 1 is larger than this minimum, say so, keep the plan's IDs unchanged, and ask the user to confirm the smaller boundary (in [autonomous mode](autonomous-mode.md), decide and record it).

Reject scope creep during the loop: no extra features, polish, abstractions for future needs, admin tooling, or optimisation unless the test cannot run without it. A shortcut that does not compromise the test (hard-coded config, manual step, stubbed non-core integration) is preferred, as long as it is recorded and does not touch security or data integrity.

Write an [ADR](adr.md) for every technical decision, including deliberate MVP shortcuts, so they can be revisited.

## Autonomy

The user's `/mvp` request authorizes coding, normal local project commands, and project-defined validation needed to complete the test slice. It does not authorize product-scope changes, external publication or deployment, production data mutations, material paid services, credential disclosure, or other irreversible external actions. Make reversible implementation choices within documented criteria, record them, and escalate only product, scope, security, compatibility, material-cost, or irreversible choices that lack authorization.

Do not ask for confirmation at every task boundary. Continue through the selected slice. Stop at a blocker only when no safe in-slice work remains, and explain the concrete decision or authorization required.

## Execution loop

1. Recover the active task from workflow state and the plan. If there is no active task, select the first unblocked task in the MVP test boundary, in dependency order. Never pick a task outside that boundary.
2. Check its Definition of Ready, source IDs, dependencies, and repository state. If the task is not ready, record the missing input and select another independent unblocked task.
3. Implement the smallest coherent change that makes the test slice work and meets the task's required acceptance criteria and acceptance criteria. Preserve existing conventions and unrelated user changes. Keep each scenario ID linked from the task aligned with the corresponding journey and requirement.
4. Automate and run the task's linked BDD scenarios as part of the appropriate project suite. Run project-defined checks relevant to the change. If no checks are defined, inspect project configuration and select proportionate checks within the task's constraints; document the command and evidence. Do not claim checks passed unless they ran successfully.
5. Update affected Diátaxis documentation (separate file per point, under the axis folder), following the [Diátaxis guide](diataxis.md) to select and write the right documentation type. Also update required repository guidance files when actually affected, task status, and workflow state. Keep `AGENTS.md` as a concise pointer to the authoritative product artifacts and their change rules; update it only when its links or durable project guidance change. Record evidence for Definition of Done and any failed or skipped checks.
6. Reconcile actual changes against the source requirements, journeys, and BDD scenario IDs. If implementation reveals a thread, resolve it within the task's documented authority or record the affected IDs, impact, and required decision; do not silently carry an implicit TBD forward. If behavior or scope must change, stop that change and request the decision.
7. Select the next unblocked task inside the MVP test boundary and repeat. Keep files small: split by scope and link them with an index. Checkpoint state after each task or meaningful interruption so another session can resume without repeating completed work.

## Workflow state during implementation

Keep `Current step` as `/mvp` and record:

- active TASK ID and subtask, or the next task selection;
- the MVP test boundary (included, `deferred-from-mvp`, how it will be tested);
- completed task IDs with concise completion evidence and changed paths;
- validation commands and outcomes, including failures or skips;
- blocked task IDs, reason, required decision/input, and independent work remaining;
- next action and recommended next workflow step.

Mark a task complete only when its Definition of Done is supported by evidence. Keep blocked or partially implemented tasks open; report partial changes accurately. Update artifact revisions and source links only after reconciliation.

## Completion

The MVP implementation step is complete when every task in the MVP test boundary is complete or explicitly blocked with the user's decision required, the product can be run end to end for the test described in the boundary with recorded evidence, release criteria needed for that test are verified, relevant documentation and navigation are current, and remaining failures or deferred work are visible. Do not call the MVP complete when release criteria are unverified.

Summarize delivered behavior, changed areas, verification results, remaining blockers, and the exact next action. When the testable slice is complete, recommend testing it with real users, then `/execute` (or a harness first, see [harness](harness-and-agents.md)) to build the remaining scope, and note that deployment or publication needs explicit authorization. If implementation is blocked, recommend the decision needed and identify any next independent task.
