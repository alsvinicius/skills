# Project revisions (`docs/revisions/`)

Keep a browsable history of how the project definition changed and why. This replaces a single central revision log.

## Layout

```text
docs/revisions/
  README.md        index: version, date, motivation (one line each), links
  v1/
    product.md     changes to business artifacts
    tech.md        changes to engineering artifacts
  v2/
    product.md
    tech.md
```

- `vN` is a project revision round, not a software release. `v1` is the first complete definition. Open a new `vN` when a change round alters artifacts that were already `ready` (new requirement, retired scope, changed decision, brownfield finding, implementation feedback).
- `product.md` covers the PRD, domain model, journeys, brownfield assessment, prototypes, and prototype-driven product changes. `tech.md` covers the technical definition, ADRs, diagrams, implementation plan, harness, and agents. Create only the file that has changes; do not create empty ones.
- Use [the product template](../assets/templates/revision-product.md) and [the tech template](../assets/templates/revision-tech.md). Keep each file focused; if a round is large, split by subject into `v2/product-<subject>.md` and link it from the index.

## What each entry records

- **Motivation:** why the change happened (user request, discovery finding, feasibility conflict, test feedback, autonomous decision), with the source.
- **Artifacts changed:** path, revision before → after, and status change.
- **What changed:** short summary using stable IDs (REQ, JRN, DEC, ADR, TASK, AUTO), including retired items and why.
- **Impact:** downstream artifacts reconciled, marked `needs-review`, or still pending, with next action.
- **Decisions and approvals:** who decided, and links to ADRs or autonomous decision records.

## Rules

- Every artifact keeps its own `Revision: N`. Its `Revision history` header links to the matching entry in `docs/revisions/`; do not embed a changelog in the artifact.
- Add the entry in the same step as the change, before updating workflow state. Preserve earlier versions; never rewrite history. Corrections go in a new entry.
- Record only what changed and why, not full content copies. Link to the authoritative artifact.
- Keep the revisions index and workflow state current. Follow an existing equivalent repository convention if present.
