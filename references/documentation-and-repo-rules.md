# Shared documentation and repository rules

## Diátaxis by reader need

Organize tutorials for learning, how-to guides for performing tasks, reference for facts/contracts, and explanation for understanding rationale. Preserve coherent product artifacts. Do not force each artifact into four sections or create empty guides.

When creating, improving, or reviewing Diátaxis documentation, apply the `writing-documentation-with-diataxis` skill. Use its user-need compass to select the documentation type, keep each document focused on one need, and follow the type-specific guidance. State the chosen type and why when presenting documentation work. This skill applies to user-facing Diátaxis docs, not to PRDs, plans, workflow state, or other product-development records.

Keep Diátaxis user documentation separate from workflow and planning artifacts. PRDs, journeys, technical definitions, implementation plans, workflow state, and brownfield assessments are product-development records; they are not tutorials, how-to guides, reference, or explanations in the Diátaxis map. Do not move, duplicate, or classify them as Diátaxis content. They may remain in their established locations under `docs/` (for example, `docs/product/` and `docs/planning/`), while user-facing Diátaxis documentation lives in a dedicated location such as `docs/diataxis/`. The index may stay at `docs/README.md` and link to both areas, clearly distinguishing them.

PRDs/journeys primarily contain business reference and explanation. Technical definitions contain engineering reference and linked decision explanations. Plans contain execution specifications and prioritization rationale. Separate substantial rationale from factual reference with clear links. Create tutorials/how-to guides when genuine reader needs and known behavior support accurate content.

This is a continuing project obligation for both greenfield creation and brownfield reverse engineering. During discovery/initialization, inspect existing documentation, identify actual audiences and documented user needs, then establish or reconcile a Diátaxis map for user-facing documentation. In a new repository, create `docs/README.md` as the index and organize applicable Diátaxis content in an appropriate dedicated location (for example, `docs/diataxis/`); do not mix planning/product-development artifacts into that map or create empty guide files to fill categories. In an existing repository, preserve established paths and navigation, classify useful user-facing content, identify gaps or stale content, and record the actual index and guide paths in workflow state. Use relative links and update them after moves.

Keep this map current in every workflow step. PRD, journey, technical definition, and planning changes may create documentation needs or invalidate existing docs; reconcile affected docs and the index, or record the gap and its next action. During `/mvp`, update relevant Diátaxis content whenever implemented behavior, setup, interfaces, contracts, or rationale changes. Add documentation updates to task DoD and planning tasks when the scope calls for them. Create only content supported by confirmed behavior or decisions; label provisional content and keep it draft when facts remain unresolved. Tutorials teach a learner through one reliable path, how-to guides help a competent user achieve a task, reference describes facts/contracts, and explanations cover rationale. Keep these types separate and link related pieces.

## Language, thread closure, and focused artifacts

Use the language the user is using for the active workflow throughout newly written and revised artifacts. Keep the linked set consistent unless the user directs a change; preserve technical identifiers and quoted source material. Before marking any step `ready`, give each discussion thread a disposition: resolved with a source, retired with a reason, or explicitly deferred by the user as `TBD` with owner/source, affected IDs, impact, and revisit point. A merely nonblocking question remains open.

Keep overviews concise and move detailed content into focused documents when separate audiences, purposes, channels, decisions, or execution boundaries make a document hard to scan. Avoid arbitrary size limits and unnecessary fragmentation. Maintain one canonical home per detailed item, stable IDs, cross-links, and an index. Update source revisions, links, and workflow state after moves.

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
Store change history in a separate central project log (normally `docs/revision-history.md`), organized by artifact path. Link each revisioned artifact to its log section and append an entry whenever its revision changes; keep the artifact body focused on current content. Preserve an existing equivalent repository convention.

Apply the main skill's checkpoint rules during interviews as well as at artifact completion. Save meaningful answers in draft artifacts and maintain state as a resume index. Record next actions and unanswered questions without duplicating authoritative content. On resumption, inspect actual artifacts for external changes before trusting the saved summary.
