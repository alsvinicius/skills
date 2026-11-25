# Upgrade after a skill update (`/upgrade`)

Use when the installed skill is newer than the one that built a project's artifacts, so the project may lack structure, rules, or sections that the current skill expects. The goal is backwards compatibility: bring an older project forward without losing, renaming, or rewriting anything it already has.

Run `/upgrade` after updating the skill, before continuing other steps in an older project. On resume ([Checkpoint and resume](../SKILL.md#checkpoint-and-resume-across-sessions)), if the project's recorded capabilities are missing or lack entries from the [registry](capabilities.md), report that and recommend `/upgrade`; do not apply it silently.

## Principles

- **Additive only.** Add missing files, sections, fields, and links. Never delete, rename, renumber, or reuse IDs, and never move files unless the user approves. Existing content and user edits win over templates.
- **Evidence, not versions.** Detect each capability from project contents using the registry; older projects recorded no version.
- **Templates are contracts for new artifacts.** Do not reformat existing artifacts to match them. Add a missing section only when its capability needs it, and mark it `draft`.
- **Keep the project's conventions:** paths, language, ID formats, and filenames stay as they are. Record actual paths in workflow state.
- **No invented content.** Anything that needs a product or technical decision becomes an open question, `needs-review`, or a recorded "declined / not applicable". A declined or not-applicable answer is stored so it is not asked again.
- **Optional means optional.** Offer optional and conditional capabilities once; never create them unrequested.
- **Unknown newer state is left alone.** If the project records capabilities this skill does not know, keep them untouched and warn that the skill is older than the project.

## Procedure

1. **Locate the project and read it.** Workflow state, repository instructions, existing artifact headers (status, revision, sources), documentation navigation, and the git history if available. If workflow state is absent, reconstruct it from existing artifacts without inventing interview history.
2. **Detect.** Evaluate every registry entry and mark it `present`, `partial`, `missing`, `not applicable`, `declined`, or `unknown`. Inspect statically; do not run the application.
3. **Show the upgrade plan before writing.** One table: capability, finding with evidence path, proposed additive action, and whether user input is needed. Group actions into *safe* (indexes, links, state fields, rule sections), *needs input* (anything that adds requirements, decisions, extractions, or splits), and *offers* (optional). Ask for one approval of the safe group; ask the focused questions for the rest, one to three per batch. In [autopilot](autonomous-mode.md), apply the safe group, decide the rest conservatively (skip optional, mark requirements `needs-review`), and record each decision.
4. **Apply in dependency order:** C05/C06 revisions → C02/C03/C04 structure → C14 workflow rule → artifact-level sections (C09–C12, C17) → C13, C18 and C20 offers, C19 question, C21 field → C15 baseline → C16 record. Checkpoint workflow state after each group.
5. **Revision entry.** Open a round in `docs/revisions/` per [project revisions](revisions.md) with motivation "skill upgrade" and the registry IDs applied. Entries are required for changes that alter the meaning of an artifact (new `REQ`, retired item, new decision). Pure structure, index, link, and state additions do not need one but are listed in the same round for traceability. Never fabricate history: reconstructed entries say so.
6. **Record the result** in workflow state: the `Capabilities applied` table (ID, status, evidence or reason, date), pending questions, and artifacts now `needs-review`.
7. **Report:** what was added, what was left alone, what needs a decision, and the recommended next step (often `/reconcile`, or the step that was interrupted).

## Baseline

`Last reconciled revision` claims that the artifacts match the repository at a commit. An upgrade must not make that claim by itself. If the repository has commits that touched code after the last commit that touched a workflow artifact, report the drift and recommend `/reconcile` first; set the baseline only after it, or after the user confirms the artifacts are in sync. Otherwise leave it `not yet recorded` and mark C15 `pending`.

## Boundaries

- Upgrade edits workflow artifacts, documentation, and `AGENTS.md`/`CLAUDE.md`. It never edits application code, tests, or configuration, and never deploys or runs security tests.
- It does not re-interview the user about decisions already recorded, and it does not change artifact status to `ready` or alter existing statuses except to `needs-review` where a new section depends on an unconfirmed decision.
- It does not authorise implementation. `/mvp` and `/execute` remain separate requests.
- Running it twice is safe: a project whose registry entries are all `present`, `not applicable`, or `declined` changes nothing.

## Completion

Every registry entry has a recorded status with evidence or reason, nothing pre-existing was deleted or renamed (check the diff), indexes and links resolve, the revision round exists where required, and workflow state lists remaining questions and the next step.
