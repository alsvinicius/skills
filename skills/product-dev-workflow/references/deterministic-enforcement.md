# Deterministic enforcement

Anything that can be checked mechanically must be checked by a program, not by an agent's or reviewer's judgement. Programs give the same answer every time, run in seconds, and block regressions before they spread. Use this guidance to choose, generate, and wire those checks: validators, scripts, git hooks, and CI jobs. It extends the [code style baseline](code-style.md), the [harness](harness-and-agents.md), and [product security](security.md).

## Principles

- **Determinism first.** A check reads files and exits with a status. It uses no network, no model, no clock, no randomness, and no state outside the repository. Same input, same result.
- **Smallest mechanism that works.** In order of preference: an existing tool's own check mode and config; the project's task runner or package scripts; a small project script; only then new tooling. Do not write a custom validator for something a standard tool already checks.
- **Reuse the project's toolchain.** Write scripts in a language the project already depends on, and use its existing hook manager or CI if there is one. Record the choice in an [ADR](adr.md). Never assume a tool exists; discover it, or propose it as a pending decision.
- **One entry point.** All checks run through one documented command (for example a task-runner target) that hooks, CI, the Validator agent, and humans all call. Hooks hold no logic of their own.
- **Check mode by default.** Checks report and fail; they do not rewrite files. Formatters that fix are a separate, explicit command.
- **Fast where it blocks.** Pre-commit checks run on staged files and finish in seconds. Slow checks (full tests, security scans inside the approved harness) go to pre-push or CI, which evaluate the branch tip so that [red commits](tdd.md#red-commits-optional) are not blocked.
- **A validator not seen failing is unproven.** Each generated validator ships with a passing and a failing fixture or test, and the failure must be demonstrated once.
- **Never silently bypass.** Agents do not use `--no-verify` or disable a check to make work pass. A failing check is fixed, or waived explicitly (see Waivers), or reported as a blocker.

## What to enforce

Decide per project from its stack and artifacts. Propose only what applies.

| Group | Check | Source of the rule |
|---|---|---|
| Code style | Format check, lint, type check | [Code style baseline](code-style.md), `STY` IDs |
| Tests | Fast unit tests on pre-push, full suite in CI | Plan DoD, BDD scenarios |
| Secrets and safety | Secret scanning on staged changes; forbidden files (such as `.env`) | [Security](security.md); a scanner the project already trusts |
| Commit hygiene | Commit message convention, if the project has one | Code style baseline |
| Workflow integrity | The validators below | This skill's completion check |
| Test-first history | With red commits: the red commit precedes the implementation commit, touches only test paths, and fails in a clean worktree | [Test-first development](tdd.md#red-commits-optional) |
| Dependencies | Lockfile present and consistent; audit inside the authorised scope | Security, ADR rule for dependencies |

### Workflow-integrity validators

These make the skill's [completion check](../SKILL.md#completion-check) deterministic. Generate them for projects that use the workflow, scaled to what the project has:

| Check | Passes when |
|---|---|
| Links | Every relative link in `docs/`, `AGENTS.md`, `CLAUDE.md`, and `README.md` resolves |
| Indexes | Every folder named in this skill's layout has an index that lists each file in it, and the Diátaxis axis indexes exist |
| IDs | `REQ`, `JRN`, `DEC`, `TASK`, `COST`, `STY` IDs are unique, well-formed, never reused, and every referenced ID exists or is marked retired |
| Traceability | Each `JRN` links to at least one `REQ`, each `DEC` to its ADR, and each `TASK` to source IDs and dependencies without cycles |
| Artifact headers | Each artifact has status, revision, sources, and a `Revision history` link; status is one of `draft`, `ready`, `needs-review` |
| Revisions | Every artifact whose `Revision` changed in the staged diff has a matching entry in `docs/revisions/` and an index line |
| File size | No document exceeds the project's size limit (record the limit; do not invent one) |
| Workflow rule | `AGENTS.md`/`CLAUDE.md` carry the product workflow section |
| Open threads | A `ready` artifact has no unowned TBD |
| Autodecisions | Every `AUTO-nnnn` file is listed in `docs/autodecisions/README.md`, has a status, and links the IDs it affects; each `active` decision still carries its `needs-review` marker |
| Reviews | Every `CRV-nnnn` file is listed in `docs/reviews/README.md`; a task marked done has a review record with no open `blocker` or unwaived `major` finding |

Keep these checks structural. They never judge whether content is correct or complete; that stays with the Validator agent and the user.

## Check contract

Record every check in `docs/harness/enforcement.md` ([template](../assets/templates/enforcement.md)), one row with a stable ID `CHK-001`:

- what it enforces and the source ID (`STY`, `REQ`, `DEC`, or a skill rule);
- the exact command and where its config lives, or a pending note saying how it will be discovered;
- scope (staged files or whole repository) and stage (editor, pre-commit, commit-msg, pre-push, CI, validator);
- failure mode: **block** or **warn**;
- fixture or test proving it passes and fails.

Output shows `file:line: CHK-001 message`, exits `0` on pass and non-zero on fail, and says how to fix or waive.

## Git hooks

- **Where:** a versioned directory (`.githooks/`) activated with `git config core.hooksPath .githooks`, or the project's existing hook manager. Do not write into `.git/hooks`, and never change global or system git config.
- **What:** `pre-commit` (fast checks on staged files), `commit-msg` (convention), `pre-push` (slower checks). Start from the [hook templates](../assets/templates/hooks/); each calls the single entry point and nothing else.
- **Activation:** provide one documented command or setup target to enable the hooks, and put it in `README.md`/`CONTRIBUTING.md` and `AGENTS.md`. A hook that is not activated protects nothing, so CI repeats the same entry point as the authoritative backstop. If there is no CI, say so in the ADR.
- **Portability:** POSIX `sh`; no dependency on the user's shell profile; clear message when a required tool is missing, and fail rather than skip silently.
- **Agent-host hooks** (hooks of the coding tool itself) are host-specific. Propose them only if the host and its format are known; otherwise record the proposal and leave it out.

## Waivers

A rule may be waived only with a recorded reason: an inline marker the tool supports, or an entry in `docs/harness/enforcement.md` naming the check, scope, reason, owner, and expiry or revisit point. No blanket disables.

## Approval and authorisation

- Proposing checks is part of [technical definition](tech-definition.md) and planning. Creating them is part of the harness: the user's approval of the harness covers the checks listed in `docs/harness/enforcement.md`; anything added later needs its own approval. In [autopilot](autonomous-mode.md), decide and record an autonomous decision.
- Activating hooks changes only the local repository configuration the user asked to be set up. Installing new third-party tools, adding CI jobs, or changing remote or global settings needs explicit approval, as does anything that incurs cost.
- Creating files is not running them against production, secrets, or external systems. Security checks stay inside the approved harness and authorised scope.

## Where it appears in the flow

1. **Technical definition:** pick the enforcement strategy per language and subproject and record the ADR (usually the same one as the code style baseline).
2. **Planning:** add tasks for the entry point, each validator, and hook activation, placed before the feature tasks they protect; add "all enforcement checks pass" to the DoD of code tasks.
3. **Harness:** create the checks, hooks, and `docs/harness/enforcement.md`; list the commands in `docs/harness/validation.md`.
4. **`/mvp` and `/execute`:** run the entry point before declaring a task done and report the real result.
5. **`/reconcile`:** run the entry point on the evaluated head and report failures as findings; do not fix application code.
6. **Brownfield `as-is`:** document existing checks; add none.

## Completion

Every check has a `CHK` row with a working command or an explicit pending note, validators have passing and failing proofs, hooks call only the entry point and have a documented activation command, CI or its absence is recorded, and no check is described as passing unless it ran.
