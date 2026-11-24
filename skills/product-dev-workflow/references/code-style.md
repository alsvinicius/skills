# Code style baseline

Define the baseline during [technical definition](tech-definition.md) so that humans and agents write consistent code from the first task. The baseline is a short, enforceable agreement, not a style essay. Use [the template](../assets/templates/code-style.md); the default location is `docs/engineering/code-style.md` (an index with one file per language or subproject if it grows).

## Scope

One baseline per language and actual subproject boundary. Cover only what the project will actually have; a docs-only or single-language project gets a small baseline. Skip a topic that has no decision to make.

| Topic | What to decide |
|---|---|
| Formatting | Formatter and its configuration file; line width, indentation, quotes, trailing commas, only when not fixed by the formatter |
| Linting and static checks | Linter, type checker, rule set and strictness; how exceptions are justified in code |
| Naming | Conventions for files, modules, types, functions, variables, constants, tests, branches |
| Structure | Module and directory layout, layering rules aligned with the bounded contexts and context map, dependency direction, public API surface |
| Imports and dependencies | Ordering, forbidden patterns, rule for adding a dependency (links to the ADR rule) |
| Errors and logging | Error-handling pattern, what may be logged (no secrets or personal data), message style |
| Comments and docs | When to comment, docstring or API-doc convention, link to the Diátaxis and ADR rules |
| Tests | Layout, naming, fixtures, how BDD scenarios map to tests |
| Version control | Commit message convention, branch naming, review expectations, only if the user has one or asks for it |
| Editor settings | `.editorconfig` and equivalent, so editors agree with the formatter |

## Procedure

1. **Start from evidence.** In an existing repository, read existing formatter, linter, editor, CI, and contribution configs and the dominant style in the code. Record them as the baseline; do not replace an established convention without a reason the user accepts. Where code and config disagree, record the config as intended and the drift as an open item.
2. **Ask only what the sources do not answer.** One to three focused questions per batch: team preferences, an existing standard they follow, strictness, tolerance for legacy exceptions. Offer a recommendation per language marked as a recommendation, not a user preference, and prefer the language's community-standard tooling.
3. **Prefer automation over prose.** Every rule that a tool can enforce is delegated to that tool's config file; the document states which tool and where, and keeps human-only rules brief. Do not duplicate tool configuration into the document.
4. **Never invent.** Do not state tool versions, flags, or commands you have not found in the project or verified in authoritative documentation. When the toolchain is not chosen yet, record the decision as pending with its owner and revisit point.
5. **Record the decision.** One [ADR](adr.md) per language or subproject baseline (not per rule), linked from a `DEC` in the technical definition. Rules inside it are numbered `STY-001` so tasks, reviews, and validation can cite them; keep IDs stable and mark removed rules retired.
6. **Wire it into the flow:**
   - Planning: add a task to set up style tooling and its configs before feature tasks that depend on it, and put "passes the style checks" in the Definition of Done of code tasks.
   - Harness: list the real format, lint, and type-check commands in `docs/harness/validation.md`; the validator reports style results separately from behaviour results.
   - Repository files: link the baseline and the commands from `CONTRIBUTING.md` and `AGENTS.md` at the relevant project boundary.
   - Enforcement: propose deterministic checks, validators, and git hooks following [deterministic enforcement](deterministic-enforcement.md); they are created through the harness approval, not unasked.
7. **Brownfield:** in `as-is` mode, document the existing style as observed, mark it `as-built`, and add no tooling tasks. In `change` or `rebuild`, propose changes only where the user confirms them.

## Changing the baseline

A change to a rule is a technical decision: update the ADR (or supersede it), bump the revision, and add the entry in `docs/revisions/` per [project revisions](revisions.md). Applying a new formatter rule across the codebase is its own planned task, not part of the rule change. Style-only edits in code that touch no artifact do not open a revision round.

## Completion

Each language and subproject in scope has a baseline with tooling named or explicitly pending, rules cite `STY` IDs, an ADR and `DEC` link exist, the plan includes the setup task and DoD criterion, validation commands are known or have a discovery note, and the repository files link to it.
