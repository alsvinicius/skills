# Capability registry

Every feature of this skill that changes what a project's files must contain is a capability with a stable ID. [`/upgrade`](upgrade.md) compares a project against this registry. The registry is append-only: never renumber or remove an entry; mark a superseded one `superseded by Cnn`.

**Maintenance rule:** any change to this skill that adds or alters required project structure, template sections, state fields, or standing rules must add or update an entry here in the same change, with detection and an additive migration action.

Detection is by evidence in the project, not by dates or skill versions (older projects recorded neither). `Kind`: **core** = expected in every project; **optional** = offer, never force; **conditional** = applies only when its condition holds.

| ID | Capability | Kind | Detect (present when) | Migration action (additive only) | Needs user input |
|---|---|---|---|---|---|
| C01 | Core artifacts: PRD, journeys, technical definition, implementation plan, workflow state | core | Files exist and are linked from workflow state | None; repair state if paths are stale | No |
| C02 | ADRs with index (`docs/adr/`) | core | `docs/adr/README.md` and one file per decision | Create the index. For decisions recorded only inside the technical definition, offer to extract them into ADRs (originals stay, linking to the ADR) | Only to confirm extraction |
| C03 | Diátaxis map: four axis folders, each with an index, linked from `docs/README.md` | core | `docs/diataxis/{tutorials,how-to,reference,explanation}/README.md` | Create missing indexes marked "no content yet"; classify existing docs into axes keeping their paths; never create empty guide files | No |
| C04 | Small focused files with indexes | core | No artifact mixes unrelated subjects; each folder has an index | Report oversized files and propose a split; split only with approval, keeping IDs and updating inbound links | Yes, for splits |
| C05 | Project revisions (`docs/revisions/vN/{product,tech}.md` plus index; artifacts link to entries) | core | `docs/revisions/README.md` exists and artifacts' `Revision history` points into it | If a central log or embedded changelog exists, keep it, create `v1` summarising it by link (do not rewrite history), and repoint the `Revision history` headers. If none exists, start `v1` from the current revisions | No |
| C06 | Revision entry for every content change (rule, not a file) | core | C05 present and each artifact's `Revision` has a matching entry | Create one catch-up entry for current mismatches, marked as reconstructed, with only facts the artifacts and history support | No |
| C07 | Domain model (DDD) in `docs/domain/` | optional | `docs/domain/README.md` | Offer `/domain-model` derived from the PRD; create as `draft`; link from the PRD and journeys only after it exists | Yes, to accept |
| C08 | Diagrams as one draw.io file, page per diagram | optional | `docs/diagrams/*.drawio` and `README.md` | Offer to generate from the technical definition; do not overwrite existing diagrams | Yes, to accept |
| C09 | Security coverage: assets, trust boundaries, abuse concerns, material items as `REQ`, proportionate validation | core | PRD/technical definition record security coverage or an explicit "none material" disposition | Review sources for assets and boundaries; add open questions and `needs-review` markers; never invent requirements | Yes, for any new requirement |
| C10 | Observability and performance as confirmed `REQ` acceptance criteria | conditional (user asks or evidence makes it material) | Related `REQ`s, or a recorded "not material" disposition | Ask once whether it is material; record the answer (including "not applicable") in workflow state so it is not asked again | Yes |
| C11 | Project costs: cost model with `COST-NNN` lines | conditional (user asks or material) | `docs/planning/cost-model.md` or equivalent, or a recorded "not material" disposition | Same as C10; never invent prices, budgets, or usage | Yes |
| C12 | Brownfield scope mode (`as-is`, `change`, `rebuild`) and `as-built` capability status | conditional (brownfield assessment exists) | Assessment header records the mode; capabilities carry a status | Infer the mode from the assessment and plan, state it, and ask for confirmation; mark capabilities already confirmed as `as-built (confirmed)`; keep previously admitted tasks | Yes, to confirm the mode |
| C13 | Prototypes, harness, custom agents, autonomous-decision records | optional | `docs/prototypes/`, `docs/harness/`, agent files, `docs/autonomous-decisions/` | Offer only where relevant (frontend, approved harness); record "declined" in state; if present, refresh agent definitions from the current templates by diff, never overwriting local edits | Yes, to accept or refresh |
| C14 | Standing workflow rule in `AGENTS.md`/`CLAUDE.md` | core | Section requiring all changes to go through the workflow, with the explicit-opt-out exception | Add or integrate the section from the template, preserving existing text; make `CLAUDE.md` import or point to it | No |
| C15 | Reconciliation baseline (`Last reconciled revision` in workflow state) | core | Field present and not "not yet recorded" | Set only after confirming the artifacts match the repository, or after `/reconcile`; see [upgrade](upgrade.md#baseline) | Yes, to confirm sync |
| C16 | Capability record in workflow state (`Capabilities applied` table) | core | Table present | Create it from this registry as the last upgrade step | No |

## Adding an entry

1. Next free `Cnn`. Add one row: detection that works on a project that never heard of the capability, and a migration action that adds structure without deleting or rewriting existing content.
2. Add an eval to `evals/evals.json` when the migration has non-obvious behaviour.
3. Update the workflow-state template if the capability needs a field.
