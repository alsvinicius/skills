# Code review (`/review-code`)

Code review is a dedicated step with its own agent, policy and records. It judges whether a change is correct, maintainable and within scope. It complements, and does not replace, the [Validator](harness-and-agents.md#custom-agents) (which proves the work matches the specification and runs validation) and [deterministic enforcement](deterministic-enforcement.md) (which checks mechanical rules).

Slash names are routing conventions in user messages, not registered commands. The name `/review-code` avoids clashing with review commands the host may already provide.

## When review happens

| Level | Trigger | Scope | Default |
|---|---|---|---|
| Task | Validation passed for a code task | The task's diff and its linked `REQ`/`JRN`/`DEC`/`TASK`/BDD IDs | Required in `/mvp` and `/execute` when the harness has the reviewer |
| Phase | A phase's last task is done | Consistency across the phase's tasks, drift from ADRs and the domain model, leftover scaffolding | Required before the phase exit criteria are claimed |
| Release | The user asks for release review | The whole change set since the last release or baseline, including the security view in [product security](security.md), inside the authorised scope | On request |
| Ad hoc | `/review-code` on a branch, diff, path or task | What the user names | On request; works without a harness |

Documentation-only tasks get a lighter review: facts, links, and agreement with the specification.

## What the reviewer checks

Review the diff against the specification and the code around it, not against the author's explanation.

1. **Correctness:** behaviour against acceptance criteria and BDD scenarios; edge cases, error paths, concurrency, data loss.
2. **Scope:** nothing beyond the task; no product decision made silently; no unrelated refactor.
3. **Design fit:** respects ADRs, bounded contexts and ubiquitous language; no new dependency without an ADR.
4. **Tests:** they exercise the scenarios, would fail if the behaviour broke, and were not weakened or skipped. With [test-first](tdd.md), the red evidence exists.
5. **Style:** only what the [code style baseline](code-style.md) states. Where a rule is mechanical, point to its `CHK` instead of arguing it.
6. **Security and safety:** secrets, input handling, authorisation, logging of sensitive data, within [product security](security.md). Never run scans or tests outside the harness.
7. **Operability:** observability and performance criteria only when confirmed as `REQ`s ([observability and performance](observability-and-performance.md)).
8. **Documentation:** Diátaxis pages, ADRs, indexes and revision entries match the change.

## Findings

Each finding has: an ID (`F1`, `F2`, …), severity, location (`path:line`), the linked ID it violates (`REQ`, `STY`, `DEC`, BDD, ADR), what is wrong, a concrete failure scenario, and a suggested direction. A finding without evidence is not reported.

| Severity | Meaning | Effect |
|---|---|---|
| `blocker` | Wrong behaviour, data loss, security flaw, or spec violation | The task cannot be marked done |
| `major` | Likely defect, missing test, or design drift | Fix, or record a waiver with a reason |
| `minor` | Maintainability or clarity | Fix when cheap; otherwise leave visible |
| `nit` | Preference with no stated rule | Never blocks; do not report what a formatter handles |

A repeated finding that a program could catch becomes a proposed check in `docs/harness/enforcement.md` (pending until approved, see [deterministic enforcement](deterministic-enforcement.md)).

## Rules for the reviewer

- Read-only. It never edits product code, tests or specifications, never marks a task done, and never fixes what it finds. Fixes go back to the Executor (or the user).
- Independent context: it does not take the Executor's conclusions on trust and does not review its own output.
- Prefer a few verified findings to many speculative ones. Say what was not reviewed and why.
- A finding that needs a product or technical decision is not resolved by the reviewer. It is raised to the user, or in [autopilot](autonomous-mode.md) recorded as an autodecision by the agent that owns the change.

## Loop

1. Executor finishes the task and the validation and enforcement results are recorded.
2. Reviewer reviews and writes a [review record](../assets/templates/code-review.md) in `docs/reviews/` (`CRV-0001-task-slug.md`, one file per review, index in `docs/reviews/README.md`).
3. For each `blocker`/`major`: the Executor fixes and re-runs validation, or the user waives it with a reason. Waivers are recorded in the review record.
4. Reviewer re-reviews only the changed parts. Allow at most two fix rounds; after that the task stays open as blocked with the unresolved findings listed, and independent tasks continue.
5. The task is done only when validation passes, no `blocker` or unwaived `major` remains, and the review record is linked from the task evidence.

## Harness integration

- `/harness` creates the [Reviewer agent](../assets/templates/agents/reviewer.md) and `docs/harness/code-review.md` from [the policy template](../assets/templates/code-review-policy.md): triggers, checklist adapted to the stack, severity rules, round limit, and who may waive.
- `docs/harness/agents.md` lists the Reviewer; `docs/harness/validation.md` links the review evidence requirement; workflow state records the review policy and the latest review per task.
- Without a harness, the main agent follows this reference directly and still writes review records.
- The policy is part of the harness approval. It adds no commands that need separate approval.

## Autopilot

Review is not a question to the user, so autopilot does not skip it. Under [autopilot](autonomous-mode.md) the same loop runs; decisions the reviewer cannot make (product or technical choices) are recorded as autodecisions by the Executor, and the review record links them.
