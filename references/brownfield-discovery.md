# Brownfield discovery

Use this route when the user wants to derive the complete product artifact set from an existing product repository. Read [the assessment template](../assets/templates/brownfield-assessment.md), [PRD generation](prd-generator.md), [business journeys](user-journeys.md), [technical definition](tech-definition.md), [MVP-first planning](planning.md), and [shared documentation rules](documentation-and-repo-rules.md).

## Establish the source and boundaries

Identify the repository the user intends to analyze; never treat the skill installation directory as the product. Read repository instructions, project documentation, existing product artifacts, and workflow state. Detect actual project boundaries from repository configuration, build/deployment structure, and instructions. Preserve established paths and conventions, and record the exact source revision (commit when available) and relevant file revisions. Inspect existing docs through Diátaxis: classify content by user need, note stale or missing material, and reconcile the documentation index/map. Record actual paths and gaps in workflow state. If the target is unclear, ask where the repository is before writing.

Inspect source statically. Use repository search, manifests, routes, UI components, domain models, persistence definitions, tests, configuration examples, and versioned docs to find evidence. Do not run the application, make network calls, inspect live systems, or claim runtime behavior from static evidence. Avoid recording secret values or sensitive personal data; identify a secret by location/type only if relevant and safe to do so.

## Build the assessment before deriving requirements

Create the assessment as a draft as soon as there is meaningful evidence. Record findings with stable evidence IDs (`EVD-001`), source path and line/section where practical, source revision, and a concise description. Classify each finding as one of:

- **Observed:** directly supported by code or versioned documentation.
- **Inferred:** a reasoned interpretation, with its supporting evidence and uncertainty.
- **Confirmed:** product intent explicitly confirmed by the user or an authoritative product decision.
- **Open:** a question, contradiction, or decision not yet resolved.

Inventory product surfaces and user-visible capabilities, actors/roles, key flows, business rules, integrations, data handled, and technical constraints only to the degree supported by evidence. Note missing, stale, and contradictory sources. Do not treat code presence, tests, TODOs, or documentation statements as proof that a capability is currently used or desired. Do not promote observed behavior into a product requirement without confirming the intended behavior.

## Confirm intent and generate the linked artifacts

Use the assessment to ask one to three focused questions per batch about the business problem, intended users, which existing capabilities should remain/change/retire, target outcomes, scope, and material conflicts. Reuse established user answers and authoritative decisions. Save answers in their authoritative artifact and checkpoint state before asking another batch. Do not ask the user to confirm every factual observation; ask about material product decisions and uncertain inferences.

Generate the complete set in this order, preserving current artifact contracts and completion criteria:

1. PRD: express confirmed desired outcomes and capabilities. Use assessment evidence as sources, label unconfirmed migration or parity assumptions, and keep implementation details out of business requirements.
2. User journeys: describe intended user outcomes and relevant exception/recovery paths. Link journeys and BDD scenarios to requirements; use evidence for context, not as a substitute for acceptance criteria.
3. Technical definition: distinguish discovered current constraints from proposed target architecture. Verify material tool or platform claims in authoritative sources when needed. Link decisions to requirements, journeys, and evidence.
4. Implementation plan: account for each in-scope requirement and journey as a phase, explicit deferral, or retirement. Include migration, compatibility, data transition, and documentation tasks only when supported by scope and evidence; include maintenance of affected Diátaxis docs and navigation, and surface unknowns instead of inventing them.

The user's request for this route authorizes generation of all four artifacts, but does not authorize implementation, deployment, publication, destructive migration, or unconfirmed product decisions. Continue independent analysis where possible when a decision blocks a downstream artifact. Keep affected artifacts `draft` or `needs-review`, record the blocker and exact next question in workflow state, and do not silently defer a decision as `TBD` unless the user explicitly chooses to defer it.

## Reconcile, checkpoint, and hand off

Before editing existing artifacts, compare their content and IDs with the assessment and preserve user edits. Resolve clear implications; mark dependent artifacts `needs-review` when reconciliation needs a decision. Maintain the central revision history and documentation index under the repository's conventions. Reconcile the root and actual subproject `AGENTS.md` files: preserve local instructions and add or update concise product-workflow guidance with links to the actual artifact locations. Do not replace existing files or duplicate detailed requirements there. Workflow state records actual paths, revisions, source revision, completed stages, pending questions, blockers, and the next specific action. Do not duplicate the full assessment in downstream artifacts; link to evidence IDs and the assessment.

At completion, check evidence links and classifications, requirement/journey/decision/task traceability, source revisions, open-thread dispositions, documentation navigation, and readiness criteria for each artifact. Summarize which artifacts are ready or draft, list material decisions still needed, and recommend `/mvp` only when the implementation plan is ready. Do not start implementation as part of discovery.
