# Shared documentation and repository rules

## Diátaxis is mandatory

Every project created or maintained by this skill, greenfield or brownfield, must use the Diátaxis documentation framework. This is not optional and does not depend on project size.

Required structure (reuse an existing equivalent location and keep its paths if the repository already has one):

```text
docs/
  README.md              index linking every area below
  diataxis/
    README.md            Diátaxis index and the purpose of each axis
    tutorials/           learning-oriented; README.md index + one file per tutorial
    how-to/              task-oriented; README.md index + one file per task
    reference/           information-oriented; README.md index + one file per subject
    explanation/         understanding-oriented; README.md index + one file per topic
  adr/                   see adr.md
```

Rules:

- One folder per axis, each with an index `README.md`. Create all four axis folders and indexes during discovery/initialisation so the structure is stable.
- One file per point addressed. Never put several tutorials, tasks, reference subjects, or explanations in one file. Keep each file focused on one reader need; split by scope and link related files.
- Do not fabricate content to fill an axis. An axis whose index says "no content yet, planned: ..." is correct until confirmed behaviour or decisions support real documents. Do not create empty guide files.
- Link the index of each axis from `docs/diataxis/README.md` and from `docs/README.md`, and keep relative links valid after every move.

When creating, improving, or reviewing Diátaxis documentation, follow the [Diátaxis guide](diataxis.md) bundled with this skill. Use its compass to select the documentation type, keep each document focused on one need, and follow the type-specific guidance. State the chosen type and why when presenting documentation work.

Product-development records (PRDs, journeys, technical definitions, implementation plans, workflow state, brownfield assessments, ADRs, autonomous decisions, prototypes) are not tutorials, how-to guides, reference, or explanations. Keep them in their own locations (for example `docs/product/`, `docs/engineering/`, `docs/planning/`, `docs/adr/`) and link them from `docs/README.md`, clearly distinguished from `docs/diataxis/`. Do not move, duplicate, or classify them as Diátaxis content. User-facing Diátaxis content that restates their facts links to the authoritative record instead of copying it.

PRDs and journeys primarily contain business reference and explanation; technical definitions contain engineering reference and links to ADRs; plans contain execution specifications and prioritisation rationale.

In an existing repository, inspect existing documentation, identify audiences and documented needs, classify useful user-facing content into the four axes (keeping existing paths where practical), identify gaps and stale content, and record the actual index and axis paths in workflow state. In a new repository, create the structure above. Keep the map current in every workflow step: product changes may create documentation needs or invalidate existing docs; reconcile affected docs and indexes, or record the gap and next action. During `/mvp` and `/execute`, update relevant Diátaxis files whenever implemented behaviour, setup, interfaces, contracts, or rationale changes, and add documentation updates to task DoD. Create only content supported by confirmed behaviour or decisions; label provisional content and keep it draft.

## Language, thread closure, and focused artifacts

Use the language the user is using for the active workflow throughout newly written and revised artifacts. Keep the linked set consistent unless the user directs a change; preserve technical identifiers and quoted source material. Before marking any step `ready`, give each discussion thread a disposition: resolved with a source, retired with a reason, or explicitly deferred by the user as `TBD` with owner/source, affected IDs, impact, and revisit point. A merely nonblocking question remains open.

Do not create large files. Always split by scope (subject, journey, channel, decision, component, or task set) into focused files, and keep an index file that links them and links back. Keep overviews short; put detail in the focused file. Do not wait until a file is hard to read: design the split up front, and split any file that starts to mix purposes. Maintain one canonical home per detailed item, stable IDs, bidirectional cross-links between related files, and an index per folder. Update source revisions, links, and workflow state after moves. Do not fragment into trivial files either: a file should carry a coherent, self-contained scope.

## Mandatory files at actual project boundaries

Maintain `.gitignore`, `README.md`, `CONTRIBUTING.md`, and `AGENTS.md` at root and every actual subproject root. Discover boundaries from repository configuration, build/deployment structure, and user input. Ordinary docs/assets folders are not automatically projects. Infra/backend/frontend directories are examples, not requirements; a single application may have only a root project.

- `.gitignore`: scoped patterns for actual tooling, generated outputs, and secrets; preserve intentional exceptions and source.
- `README.md`: purpose, status, accurate setup/quickstart where known, and navigation.
- `CONTRIBUTING.md`: known development, contribution, review, and verification procedures; link shared rules where useful.
- `AGENTS.md`: scope, boundaries, known commands, and authoritative context. When this workflow is used for the project, include a concise Product workflow section pointing to the actual product artifacts and explaining how implementation work follows and updates them. Respect parent instructions and preserve user rules.

Treat a repository path as a destination, not permission by itself to edit it. Write project files when the user asks to create, initialize, update, or save an artifact in that repository, or when the requested workflow deliverable is clearly a file and the destination is established. A request to explain, advise, or define documentation obligations is guidance only: answer in conversation and describe suggested files without creating them. If intent to write is ambiguous, fulfill the informational request and state which files could be created if requested. Edit existing files narrowly and preserve filename conventions for equivalents. Do not invent setup commands. Mark unavailable details pending with their next decision point. When creation is authorized, create missing files at existing boundaries with stage-appropriate content; business discovery warrants minimal files without speculative tooling. In conversation or unattached documents record obligations for initialization. List four files for planned subprojects in the plan and create them when those subprojects are initialized.

### Product workflow guidance in `AGENTS.md`

Add or maintain this guidance when the product workflow creates or maintains artifacts for the repository; do not change `AGENTS.md` merely because the skill is installed or mentioned. The PRD, journeys, technical definition, implementation plan, and workflow state remain the sources of truth. `AGENTS.md` provides a short, durable entry point for coding agents; do not copy detailed requirements or decisions into it.

- **Greenfield:** when initializing an actual project boundary, create `AGENTS.md` with a concise Product workflow section and relative links to the artifacts that exist or are planned. Update placeholder paths as artifacts are created.
- **Brownfield:** preserve existing instructions and user edits. Add the section or integrate its guidance into the existing equivalent; do not replace the file or create duplicate instructions. Reconcile links to actual artifact locations.
- **Subprojects:** follow the boundary rules above. Root guidance can point to shared product artifacts; a subproject `AGENTS.md` should add only its local scope, commands, and constraints, plus links needed to locate applicable shared artifacts.
- Keep the section idempotent and concise. Update it only when artifact paths, project boundaries, relevant commands, or durable workflow instructions change—not after every code change.
- Before implementation, agents read the plan and the relevant requirements, journeys, and decisions. Trace work from `TASK` to its source IDs. When a change affects product behavior, scope, acceptance criteria, or a technical decision, update the authoritative artifact and reconcile downstream artifacts or mark them `needs-review`. Update `AGENTS.md` only if its guidance or links are affected.

Use a short project-specific section such as the following, adapting links and wording to the repository's language and conventions:

```markdown
## Product workflow

- Product artifacts: [link to docs index or workflow state]
- Before implementation, read the relevant plan task and linked requirements, journeys, and technical decisions.
- Trace changes to their source IDs. Update affected product artifacts and documentation when behavior, scope, acceptance criteria, or decisions change; flag unresolved downstream impacts for review.
```

## Maintenance

Every artifact revision updates metadata, source references, related links, index, and workflow state. Reconcile downstream artifacts or mark them `needs-review`. Implementation task DoD names affected Diátaxis docs and requires updates alongside behavior changes. Establish this contract without claiming future documentation has already been maintained.
Store change history in `docs/revisions/vN/{product,tech}.md` following [project revisions](revisions.md). Each revisioned artifact links to its entry and keeps only its own `Revision: N`; append the entry whenever a revision changes. Preserve an existing equivalent repository convention.

Apply the main skill's checkpoint rules during interviews as well as at artifact completion. Save meaningful answers in draft artifacts and maintain state as a resume index. Record next actions and unanswered questions without duplicating authoritative content. On resumption, inspect actual artifacts for external changes before trusting the saved summary.
