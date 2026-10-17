---
name: open-source-preparation
description: Prepare an existing software project for a safe, understandable open-source release. Use whenever someone wants to open source, publish, share, or make an existing private or personal project cloneable by others. Audit personal data and secrets, move runtime personal files behind a local data directory, create or update README.md, AGENTS.md, CONTRIBUTING.md and Diátaxis documentation, and preserve project-relevant creation skills in .agents/ when appropriate. Recommend installing writing-documentation-with-diataxis as a companion and use it whenever it is available. Do not publish or push the repository unless explicitly asked.
---

# Open Source Preparation

Help make an existing project safe and understandable for open-source use. In prepare mode, make the requested changes in the target repository; in audit-only mode, inspect and report without changing it. In both modes, distinguish what is ready, what remains uncertain, and any privacy or release blockers.

## Choose the work mode

Infer the mode from the user's request:

- **Prepare mode**: the user asks to make the project ready, fix issues, or update files. Follow the full workflow and make the requested repository changes.
- **Audit-only mode**: the user asks to validate, assess, review, or check open-source readiness and says not to change anything, or otherwise clearly limits the task to an audit. Inspect the repository without creating, editing, moving, deleting, staging, or committing files. Report findings in the conversation; do not save a report into the repository unless asked. Give remediation recommendations without applying them.

In audit-only mode, use read-only inspection. Prefer static source, Git metadata, configuration, and documentation review. Run a check only when it is clearly non-mutating and safe for this project; if its side effects are uncertain, skip it and note that limitation. Do not run formatters, generators, migrations, dependency installation, or commands that may alter files or external state. Use the same privacy care as prepare mode: never expose secret values in the report.

Assess at least: personal data and secrets in the working tree and, when practical, tracked Git history; ignore-rule coverage; whether user files have a clone-safe local-data location and whether the application actually uses it; presence and accuracy of `README.md`, `AGENTS.md`, and `CONTRIBUTING.md`; Diátaxis coverage and functional/technical explanations; relevant `.agents/skills/` content; license and third-party redistribution status; and whether a fresh clone can be configured and run based on documented, verified steps.

Classify the result as **ready**, **ready with conditions**, or **not ready**. Support each finding with a path and concise evidence, separating confirmed facts from inferences and unknowns. List blockers first and provide specific recommended remediation steps, but do not make them in audit-only mode.

## Recommended companion skill

Recommend `writing-documentation-with-diataxis` for use alongside this skill. Before creating or revising project documentation, check whether that skill is available in the current environment. If it is installed, read and apply its instructions for classifying, writing, and reviewing tutorials, how-to guides, reference, and explanation pages. If it is not available, tell the user it is recommended for the strongest documentation workflow and continue using the Diátaxis guidance in this skill; do not make installation a blocker for the open-source preparation task.

## Workflow

### 1. Establish the project and its rules

1. Confirm the target repository from the current directory or the user's path. If there are several plausible repositories, ask which one; do not edit this skill's installation directory as if it were the project.
2. Read applicable `AGENTS.md` files, project docs, manifests, configuration, and ignore rules before changing files. Respect existing conventions and preserve useful content.
3. Inspect the project statically first. Identify languages, build/run commands, entry points, persistent storage, integrations, deployment assumptions, and any existing documentation. Do not claim behavior that code or an authoritative source does not establish.
4. Record a concise work plan and distinguish observed facts, inferences, and questions that need the owner's decision.

### 2. Audit privacy and repository contents

Inspect tracked, staged, untracked, and ignored files that could be included in a release. Use repository-aware tools such as `git status`, `git ls-files`, and `git check-ignore`; inspect likely sensitive paths and configuration. Search for credentials, personal identifiers, private URLs, machine-specific paths, personal documents/media, local databases, logs, backups, and generated files. Avoid copying sensitive values into notes or the final report; report paths and categories with redaction.

For every candidate file, decide whether it is safe and necessary to publish. Do not assume a filename is safe, and do not stage or commit anything. Add narrow ignore rules for local/private data and secrets without hiding source files, templates, or examples. Keep sanitized examples with fake values where useful.

If personal or secret material is already tracked, stop it from entering future snapshots and explain the required index cleanup. Check whether sensitive content appears in repository history when practical. Do not rewrite history, force-push, delete user files, or rotate credentials on the user's behalf; explain the impact and provide a safe remediation plan. `.gitignore` does not erase prior commits.

### 3. Give personal runtime files a clone-safe home

Make the application read user-specific files from one explicit, project-local directory that exists in a fresh clone but contains no personal data in version control.

1. Prefer an existing project convention. Otherwise choose a clear local-data path, such as `data/local/`, and use it consistently in code, configuration, and documentation.
2. Configure the application to resolve that directory from a documented environment variable or project setting, with a sensible path relative to the repository as the default. Avoid absolute paths tied to the current machine. Keep secrets in environment configuration, not in the data directory unless the app's security model specifically requires it.
3. Ensure the directory is present in a clone with a harmless tracked marker or short README. Ignore its contents while allowing only the marker/documentation through. For example, ignore `/data/local/*`, then allow `!.gitkeep` and `!README.md` as needed. Adapt the pattern to the actual directory and Git behavior.
4. Update all readers, writers, importers, scripts, and tests that currently point at personal paths. Handle a missing directory gracefully where appropriate. Do not move, rename, or delete personal files without explicit authorization; explain how the owner can place existing files in the new location.
5. Document the expected local files, format, permissions, initialization, backup implications, and how another clone supplies their own data. Include a fake or empty example only when it helps.

### 4. Make the project understandable and contributable

Create or revise these root files, adapting to the actual project:

- `README.md`: what the project does, who it is for, key capabilities, supported environment, quick start, local data setup, configuration, documentation map, contribution path, license status, and known limits. Keep it an entry point, not a duplicate manual.
- `AGENTS.md`: repository-specific instructions for coding agents and contributors: project map, setup and validation commands discovered from the repo, code and documentation conventions, privacy boundaries, and completion expectations. Do not invent commands or repeat generic agent advice.
- `CONTRIBUTING.md`: prerequisites, local setup, branch/change expectations, issue or pull request process if known, validation, documentation updates, and privacy/security rules. Mark unknown hosting or process details as decisions to confirm instead of fabricating them.

Do not choose or add a license on the owner's behalf. If no license exists, make that a visible release decision: explain that the repository has no declared license and ask the owner to select one before representing it as open source. Likewise, flag any third-party assets, dependencies, or generated material with unclear redistribution rights.

### 5. Document with Diátaxis

Follow the companion-skill rule above first. Create or adapt a navigable documentation structure that serves real needs. Use the four Diátaxis types without forcing empty pages:

- **Tutorials**: a reliable first successful experience for a new user.
- **How-to guides**: direct steps for real tasks, such as configuring local data, importing files, operating the app, or troubleshooting.
- **Reference**: complete factual details for configuration, commands, data formats, APIs, schemas, and supported integrations.
- **Explanation**: why the project exists and how its functional behavior, architecture, data flow, security/privacy model, and important design choices fit together.

Use the repository's existing docs layout. If none exists, a practical starting point is `docs/tutorials/`, `docs/how-to/`, `docs/reference/`, and `docs/explanation/`, with `docs/README.md` as an index. Write the functional and technical views in enough detail that a new maintainer can understand user-visible workflows and trace how the system implements them. Link related pages instead of copying the same details into every file. Keep each page focused on one documentation need.

Ground all claims in source, observed behavior, or confirmed owner input. Label inferred or unknown behavior clearly. Include diagrams only when they clarify real components or flows. Keep the README concise and link to the relevant tutorial, guide, reference, or explanation.

### 6. Preserve relevant project skills

When the user or project workflow identifies skills that were used to create or materially shape the project, place suitable copies under `.agents/skills/<skill-name>/` so they travel with the repository. Include the skill's required resources and preserve attribution and license notices. Do not copy unrelated global skills, private prompts, credentials, personal paths, or unavailable dependencies. If a skill is not distributable or depends on private resources, document its name and limitation without copying it. If no relevant skill was used, do not create an empty `.agents/` tree.

### 7. Review and hand off

Review the resulting diff and repository status. Confirm that:

- personal files and credentials are not newly tracked and local data is ignored;
- the clone-safe data directory exists through a safe marker or README;
- the application and its documentation agree on the data path and configuration;
- the required root documents exist and link to the Diátaxis documentation;
- docs separate learning, task guidance, facts, and rationale;
- bundled skills are relevant, complete enough to use, and legally/technically suitable;
- license, history cleanup, and redistribution questions are called out accurately.

Run only checks that are safe and supported by the repository. Do not install dependencies, execute untrusted project code, publish, push, create a release, or make irreversible history changes unless the user has authorized that action. Report checks actually performed; never imply that a test passed if it was not run.

## Final report

For audit-only mode, return the readiness classification, evidence-based findings, blockers, recommended remediation, and checks skipped or not run. Confirm that no repository files were changed. Do not imply a full audit of Git history, licenses, or runtime behavior when those areas were not inspected.

Summarize:

1. Files and behaviors changed.
2. The local personal-data path and how a clone configures it.
3. Privacy findings by category and redacted path, including any tracked-history concern.
4. Documentation and bundled skills created or updated.
5. Checks performed and their results.
6. Release blockers or owner decisions still needed, especially license and redistribution rights.

Do not call the project fully open-source-ready while a known privacy leak or required licensing decision remains unresolved.
