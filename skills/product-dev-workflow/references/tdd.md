# Test-first development (TDD)

In the technical definition, ask the user whether application tests should be written before the application code. When the answer is yes, every code task starts by writing the tests that define its behaviour, and the code is then written to pass them. This keeps the specified behaviour, not the implementation, in control.

## Ask during technical definition

Ask once, as one focused question inside the testing and development-workflow topics, with a recommendation:

> Should the agent write the tests first for each task (test-first / TDD), so the code has to pass tests derived from the requirements? Recommended when behaviour is well specified and the stack has a fast automated test runner. The alternative is writing tests together with or after the code.

- When the answer is yes, ask the follow-up in the same batch: should the failing tests also be **committed first**, before the implementation, so the history proves the order ([red commit](#red-commits-optional))? Recommend it when the team works on a branch per task and can merge without squashing. Record the answer next to the testing approach (`red-commit: yes / no / deferred`).
- Record the answer as a confirmed decision with its source: a `DEC` with an [ADR](adr.md) ("Testing approach"), a line in the technical definition's *Development and verification* section, and the workflow state field `Testing approach`. Link the ADR to the [code style baseline](code-style.md) and [deterministic enforcement](deterministic-enforcement.md) ADR when they share one.
- If the user already stated a preference earlier (including a deferred technical preference), reuse it and confirm rather than ask again. If the user declines or defers, record `tests-with-code` or the explicit deferral and do not ask again unless the stack or scope changes.
- Never present it as the default or assume agreement. In [autopilot](autonomous-mode.md), adopt test-first when the stack has an automated test runner, record an autodecision with how to reverse it, and keep the ADR `proposed`.
- Do not invent the test framework or commands. Use the project's, or record how the implementing agent will discover or select one.

## Rules when test-first is adopted

1. **Source of the tests.** Derive tests from the task's linked acceptance criteria and BDD scenario IDs, not from code that does not exist yet. A test cites the scenario or `REQ` ID it verifies.
2. **First subtask of every code task: write the tests.** The plan puts "write failing tests for [scenario IDs]" ahead of the implementation subtask, and the task's Definition of Ready includes the runner command or a discovery note.
3. **Red, then green.** Run the new tests and confirm they fail for the expected reason (missing behaviour, not a broken setup or a syntax error). Record that result as task evidence. Then write the smallest code that makes them pass, run the suite, and record the passing result. Refactor only with the suite green.
4. **The tests are the contract.** Do not weaken, delete, skip, or rewrite a test to make code pass. If a test is wrong, or the requirement is ambiguous or infeasible, stop on that task, record the affected IDs and the decision needed, and change the test only after the source artifact is changed through the [revision rules](revisions.md).
5. **Test level follows the scenario.** Use the cheapest level that proves the behaviour (unit, integration, end-to-end) as set by the BDD scenarios and the testing strategy in the technical definition.
6. **Honest exceptions.** Work that has no meaningful automated test first (pure configuration, documentation, scaffolding, exploratory spikes, visual layout) is marked `test-first: n/a` in the task with the reason, and carries another verification method. Exceptions are visible, not silent. A spike is replaced by test-first work before it becomes product code.
7. **Existing code.** For brownfield code with no tests, add characterization tests only for the code a task changes, and only in `change` or `rebuild` mode. In `as-is` mode add none.

## Red commits (optional)

When the user chose `red-commit: yes`:

1. **Authorisation.** The answer authorises the agent to create local commits on the task's branch for this purpose, and nothing more. Never push, force-push, rewrite history, or merge without separate authorisation. If the user did not choose it, make no commits.
2. **Two commits per task** (more only when a task has several scenario groups): first a commit containing only test files, support fixtures, and test configuration, with no application code; then the implementation commit. The first message names the `TASK` ID and scenario IDs and follows the project's commit convention; if it has none, use a plain `test(TASK-nnn): failing tests for BDD-nnn` style and record that in the [code style baseline](code-style.md).
3. **Evidence.** Record both SHAs, the failing run's summary, and the passing run's summary in the task evidence. Definition of Done requires them.
4. **Verification.** The Validator, or a check from [deterministic enforcement](deterministic-enforcement.md), confirms that the red commit is an ancestor of the implementation commit, touches only test paths, and that the suite fails at that commit for the expected reason (run in a clean worktree, not by trusting the log).
5. **Hooks and CI.** Do not weaken the pre-commit checks (format, lint, secrets) for red commits. Test execution belongs in `pre-push` and CI, which evaluate the branch tip, so a red commit does not block them, but the final tip must be green. Never use `--no-verify`; if a check that applies to red commits blocks them, fix the check's scope or record a [waiver](deterministic-enforcement.md#waivers).
6. **Keep the history.** Recommend merging without squashing, or record the SHAs before a squash and link them from the task. A squash that removes the commits removes the proof.
7. **Exceptions.** Tasks marked `test-first: n/a` get no red commit.

## In the flow

| Step | What changes |
|---|---|
| Technical definition | Ask (including the red-commit follow-up), record `DEC`/ADR and the testing-approach line |
| Planning | Each code task gets a first subtask "write failing tests", a `Test-first` field, and DoD evidence for red then green ([plan template](../assets/templates/implementation-plan.md)); the first Phase 1 task sets up the test runner if the project has none |
| Harness | `validation.md` lists the test commands; the Validator checks red and green evidence per task |
| `/mvp` and `/execute` | Follow the loop in [MVP implementation](mvp-implementation.md) and [full execution](full-execution.md): tests first, observe red, implement, observe green, then the rest of validation |
| `/reconcile` | A change that arrived without tests is reported as a gap; a follow-up task adds them. Reconciliation does not write code |

Without red commits, red evidence is recorded by the agent and no program can prove ordering afterwards; with red commits, the history proves it. Deterministic checks can still enforce that the suite passes and that tests exist for linked scenario IDs, if the project chooses such a check ([deterministic enforcement](deterministic-enforcement.md)).

## Completion

The technical definition records the user's answers; if test-first was adopted, every code task has test-first subtasks or a justified `n/a`, DoD requires red and green evidence, and, when red commits were chosen, each task records both SHAs and the verification passes; the validation guide lists the runner commands or their discovery note.
