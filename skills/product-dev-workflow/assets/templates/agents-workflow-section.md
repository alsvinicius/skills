## Product workflow (`product-dev-workflow`)

<!-- Keep this section short and durable. Do not copy requirements or decisions here. -->

Every change to this project goes through the product workflow, and the workflow artifacts are kept current as part of the change.

- Artifacts (sources of truth): [PRD]([path]) · [domain model]([path]) · [journeys]([path]) · [technical definition]([path]) · [implementation plan]([path]) · [workflow state]([path]) · [ADRs]([path]) · [revisions]([path]) · [docs]([path])
- Before changing anything, read the affected artifacts and link the work to its `REQ`, `JRN`, `DEC`, and `TASK` IDs. If none applies, update the artifacts first (new requirement, task, or decision), then implement.
- After changing anything, update the affected artifacts, ADRs, Diátaxis docs, workflow state, and the revision entry in `docs/revisions/` in the same change.
- Exception: skip the workflow only when the user explicitly says so for that change (for example, "do not update the workflow artifacts"). The exception covers that change only. Do not touch the artifacts for it, and say in the reply that they are now out of sync; `/reconcile` later recovers the change from the recorded baseline.
- If the repository changed outside this flow, run `/reconcile` before relying on the artifacts.
