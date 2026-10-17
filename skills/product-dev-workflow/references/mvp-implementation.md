# MVP implementation workflow

Use this step when the user invokes `/mvp`, asks to implement the planned MVP, or resumes an active MVP implementation. Read the repository's `AGENTS.md` and equivalent local instructions first. Also read the ready implementation plan, relevant requirements, user journeys, technical definition, and workflow state. If required inputs are missing or stale, inspect actual content and identify the specific gap; do not treat a `ready` label or revision number as sufficient by itself.

## Scope and autonomy

Implement only the approved Phase 1 MVP scope and its explicit task breakdown. The user's `/mvp` request authorizes coding, normal local project commands, and project-defined validation needed to complete that scope. It does not authorize product-scope changes, external publication or deployment, production data mutations, material paid services, credential disclosure, or other irreversible external actions. Follow the plan's agent-execution contract: make reversible implementation choices within documented criteria, record them, and escalate only product, scope, security, compatibility, material-cost, or irreversible choices that lack authorization.

Do not ask for confirmation at every task boundary. Continue through all unblocked MVP tasks that can be completed within the approved scope. Stop at a blocker only when no safe in-scope work remains, and explain the concrete decision or authorization required to proceed.

## Execution loop

1. Recover the active task from workflow state and the plan. If there is no active task, select the first unblocked Phase 1 task in dependency order.
2. Check its Definition of Ready, source IDs, dependencies, and repository state. If the task is not ready, record the missing input and select another independent unblocked task.
3. Implement the smallest coherent change that meets the task's expected results and acceptance criteria. Preserve existing conventions and unrelated user changes. Keep each scenario ID linked from the task aligned with the corresponding journey and requirement.
4. Automate and run the task's linked BDD scenarios as part of the appropriate project suite. Run project-defined checks relevant to the change. If no checks are defined, inspect project configuration and select proportionate checks within the task's constraints; document the command and evidence. Do not claim checks passed unless they ran successfully.
5. Update affected Diátaxis documentation, applying the `writing-documentation-with-diataxis` skill to select and write the right documentation type. Also update required repository guidance files when actually affected, task status, and workflow state. Keep `AGENTS.md` as a concise pointer to the authoritative product artifacts and their change rules; update it only when its links or durable project guidance change. Record evidence for Definition of Done and any failed or skipped checks.
6. Reconcile actual changes against the source requirements, journeys, and BDD scenario IDs. If implementation reveals a thread, resolve it within the task's documented authority or record the affected IDs, impact, and required decision; do not silently carry an implicit TBD forward. If behavior or scope must change, stop that change and request the decision.
7. Select the next unblocked MVP task and repeat. Checkpoint state after each task or meaningful interruption so another session can resume without repeating completed work.

## Workflow state during implementation

Keep `Current step` as `/mvp` and record:

- active TASK ID and subtask, or the next task selection;
- completed task IDs with concise completion evidence and changed paths;
- validation commands and outcomes, including failures or skips;
- blocked task IDs, reason, required decision/input, and independent work remaining;
- next action and recommended next workflow step.

Mark a task complete only when its Definition of Done is supported by evidence. Keep blocked or partially implemented tasks open; report partial changes accurately. Update artifact revisions and source links only after reconciliation.

## Completion

The MVP implementation step is complete when every Phase 1 task is complete or explicitly blocked with the user's decision required, all Phase 1 release criteria have recorded evidence, relevant documentation and navigation are current, and remaining failures or deferred work are visible. Do not call the MVP complete when release criteria are unverified.

Summarize delivered behavior, changed areas, verification results, remaining blockers, and the exact next action. When the planned MVP is complete, recommend release review and authorization for any deployment or publication. If implementation is blocked, recommend the decision needed and identify any next independent task.
