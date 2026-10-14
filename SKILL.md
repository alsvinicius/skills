---
name: product-dev-workflow
description: Guide product discovery, including brownfield analysis of an existing repository, into a business PRD, user journeys, technical definition, and an MVP-first implementation plan, then implement the approved MVP through /mvp. Use for creating or revising these artifacts, continuing the workflow, implementing planned MVP tasks, and propagating requirement changes. Ordinary isolated bug fixes and unrelated coding do not require this workflow.
---

# Product Development Workflow

Use four independently selectable steps within one connected workflow. Trace implementation tasks back to product value.

## Select a step

Slash names are routing conventions in user messages; this file does not register executable commands.

| Request | Instructions | Required inputs | Default output |
|---|---|---|---|
| `/brownfield-discovery` | [Brownfield discovery](references/brownfield-discovery.md) | Existing product repository and its versioned documentation | Brownfield assessment, PRD, journeys, technical definition, and implementation plan |
| `/prd-generator` | [PRD](references/prd-generator.md) | Idea or product evidence | `docs/product/prd.md` |
| `/to-user-journeys` | [Journeys](references/user-journeys.md) | PRD or equivalent requirements | `docs/product/user-journeys.md` |
| `/tech-definition` | [Technical definition](references/tech-definition.md) | PRD and journeys or equivalents | `docs/engineering/technical-definition.md` |
| `/planning` | [Planning](references/planning.md) | PRD, journeys, technical definition | `docs/planning/implementation-plan.md` |
| `/mvp` | [MVP implementation](references/mvp-implementation.md) | Approved MVP plan, repository, and implementation instructions | Working software and updated task/workflow state |

Read the selected reference and its template, plus [shared documentation rules](references/documentation-and-repo-rules.md). For `/brownfield-discovery`, read the brownfield assessment template and the references/templates for PRD, journeys, technical definition, and planning. Load other steps when needed for prerequisites or changes.

An explicit step takes priority. For natural language, select the requested artifact. For “continue,” inspect existing artifacts and workflow state for the next incomplete step. Start a new end-to-end request with discovery. Ask one focused question if ambiguity materially affects the work. Finish the requested step; proceed further only when the user's scope includes later steps.

## Inspect before writing

1. Identify the target product and repository. The skill installation directory is not the product destination. If unknown, continue discovery in conversation and ask where to save before writing project files.
2. Read applicable repository instructions, existing artifacts, documentation navigation, and actual subproject boundaries.
3. Reuse existing paths and conventions. Use defaults only when no equivalent exists. Record actual paths in `docs/product/workflow-state.md` or its existing equivalent.
4. Establish the project's Diátaxis documentation map during discovery/initialization and keep it current throughout every workflow step, for both greenfield and brownfield projects. Treat it as project documentation, not as a one-time generated artifact.
5. Inspect prerequisite contents and source revisions. A filename or `ready` label alone does not establish sufficient input.

Accept equivalent user-supplied artifacts and explain how they satisfy the input contract. Identify specific gaps and ask the smallest useful batch of questions. Continue independent work or save a clearly labeled draft. Do not invent decisions to complete a later step or silently run all earlier interviews.

For `/brownfield-discovery`, treat repository code and versioned documentation as evidence about the existing product. Inspect statically; do not run the application or infer runtime behavior that the sources do not establish. Keep observed behavior, inferred intent, confirmed product decisions, and unresolved questions distinct. Do not turn existing behavior into a requirement without confirmation that it is desired. This route includes all four downstream artifacts, so proceed through them in order when their inputs are sufficient; checkpoint and ask focused questions at material product decision points. A blocker in one artifact must not prevent unrelated evidence gathering, but do not mark dependent artifacts ready while it remains unresolved.

## Interview and decision handling

- Reuse known answers. Ask one to three focused questions per batch, ordered by their effect on scope and decisions.
- Distinguish confirmed requirements, preferences, proposals, assumptions, and open questions; record sources.
- Confirm assumptions that materially determine scope, cost, or architecture. Routine authorized edits do not require approval.
- If the user requests a draft with missing information, label affected sections provisional and record blockers.
- Keep PRDs and journeys at business level. Save unsolicited stack preferences in workflow state for the technical interview.
- Never invent numerical targets, baselines, dates, budgets, capacity, policies, or tool preferences. Mark unknowns explicitly.
- Close every discussion thread before marking a step ready. Resolve it with a sourced decision, retire it with a reason, or record it as an explicit `TBD` only when the user chose to defer it. “Nonblocking” or “known unknown” is a status, not a disposition. Ask about unresolved material decisions; do not silently carry them into downstream artifacts.

## Language and document size

- Write new artifacts and user-facing sections in the language the user is using for the active workflow. Keep the linked artifact set consistent in that language unless the user asks for another language. Preserve code identifiers, protocol names, and quoted source text as needed.
- Prefer a short index/overview plus focused documents when an artifact mixes distinct purposes or becomes difficult to review. Split by stable subject, channel, decision group, or independently executable task set; do not split merely to meet an arbitrary word count. Keep IDs stable, add navigation, and update every inbound link when moving content.
- Keep one authoritative home for each detailed requirement, decision, journey, scenario, or task. Summaries should link to that home instead of copying its full content.

## Artifact and handoff contract

Use bundled templates as section contracts, adapting formatting to the repository. Each artifact records status, revision, sources with revisions, related links, decisions, assumptions, and the disposition of every open thread. Brownfield-derived artifacts link to the assessment and its evidence; the assessment distinguishes observed facts, inferences, confirmed decisions, and unresolved questions.
Keep revision histories in a separate central project log (normally `docs/revision-history.md`), with a section keyed by each artifact path. Every revisioned artifact links to its own section; add an entry whenever its revision changes. Do not embed a growing change log in the PRD, journeys, technical definition, implementation plan, or workflow state. Follow an existing repository convention when it already provides an equivalent central log.

Statuses: `draft` for incomplete/provisional content; `ready` when completion criteria are met and every thread has a disposition; `needs-review` when source changes may invalidate content. Readiness is a content assessment, not user approval. Record explicit approval separately only if it occurred. A deferred `TBD` must name its owner/source, affected IDs, impact, and revisit point; it may remain only when the user explicitly chose to defer it. Otherwise resolve or ask.

Use stable IDs: `REQ-001` for requirements, `JRN-001` for journeys, `DEC-001` for technical decisions, `TASK-001` for tasks. Preserve existing IDs, never reuse removed IDs, and mark removed items retired. Link journeys to requirements, decisions to requirements/journeys, and tasks to sources and dependencies. Attach business rules and acceptance criteria to their owning items.

Maintain workflow state using [the template](assets/templates/workflow-state.md): actual artifact paths, revisions, readiness, blockers, deferred technical preferences, and downstream updates. At handoff summarize outputs, remaining decisions, and the next usable step.

## Recommend the next step

At the end of every requested workflow step, explicitly recommend what should happen next:

| Completed step | Recommended next step |
|---|---|
| PRD | `/to-user-journeys` |
| User journeys | `/tech-definition` |
| Technical definition | `/planning` |
| Planning | `/mvp` to implement the Phase 1 MVP tasks, following task dependencies |
| MVP implementation | Validate the release criteria, then recommend release review or the next planned phase |

If the current artifact is still `draft` or has blockers, first name the specific action needed to complete or unblock it, then identify the subsequent step. If prerequisites are missing, say what must be resolved before that step can proceed reliably. For planning, point to the next unblocked Phase 1 task when the plan identifies one. Recommend without starting the next step; continue only when it is already within the user's request. If workflow state is being maintained, save the recommendation there too. Keep the handoff concise and tied to the artifact produced.

For `/mvp`, work through the authorized MVP plan autonomously within the confirmed product scope and repository rules. Autonomy covers selecting and completing unblocked tasks, using project-defined tools, updating affected docs and state, and proceeding to the next task. It does not authorize inventing product decisions, expanding scope, exposing secrets, incurring material costs, or performing irreversible external actions such as deployment or publication. Pause only when a material decision or an authorization boundary prevents safe progress; continue independent tasks and record the blocker.

## Checkpoint and resume across sessions

Once a project destination is established, initialize workflow state at the start of discovery, even in an empty folder. Create the selected artifact as a draft as soon as there is meaningful content. Keep project state in that project, never in the skill installation directory. Respect an explicit conversation-only request; explain that unsaved answers cannot be recovered by a new session.

After each meaningful interview answer batch, scope change, or decision, persist the confirmed information before asking the next batch or ending the turn. Also checkpoint before a planned pause or handoff. Do not wait for an artifact to be complete. Save concise facts and decisions, not whole transcripts, credentials, or unnecessary sensitive information.

Store information in its authoritative artifact and link to its section or stable ID from workflow state. Keep only information with no artifact home yet, such as deferred technical preferences, directly in state. Record the active step and activity, completed interview topics, pending questions, last completed action, and the exact next action. For MVP implementation, also track active task/subtask, completed tasks and evidence, validation results, blockers, and next unblocked task. Preserve the user's requested scope so resumption does not automatically authorize later steps.

Write changed artifacts first, then update state with their actual revisions and any remaining reconciliation work. Preserve user edits. If a write fails, report what was not saved and do not claim a successful checkpoint. Abrupt interruption may leave only the last completed checkpoint; do not promise recovery of unsaved conversation.

When the skill is invoked in a folder with saved state and no explicit new-step request, resume the recorded activity. Read state, linked artifacts, and applicable repository instructions; compare recorded revisions and content for external edits, missing files, and unfinished updates. Artifacts remain authoritative over stale summaries. Reconcile clear differences and repair state; ask only about material conflicts or missing decisions. If state is absent, reconstruct it from existing artifacts where possible without inventing interview history.

Briefly summarize the recovered step and next action, then continue. Reuse persisted answers instead of asking the user to restate context. A new explicit step or correction takes priority over the saved next action; checkpoint the resulting change. Keep incomplete work `draft` and affected dependencies `needs-review` until their criteria are satisfied.

## Propagate changes

1. Read affected artifacts and follow source links and IDs. Identify changes, retirements, and conflicts before overwriting content.
2. Update the authoritative source and increment its revision. Preserve unrelated content and user edits.
3. Reconcile affected journeys, technical decisions, tasks, acceptance criteria, dependencies, and Diátaxis documentation when implications are clear and within scope. Keep relevant tutorials, how-to guides, reference, and explanations accurate as product behavior changes.
4. If reconciliation needs a decision or exceeds scope, mark dependents `needs-review`. Record affected IDs, reasons, and required decisions in workflow state.
5. Update a dependent's source revision only after reconciliation. Maintain navigation and report resolved and outstanding impacts.

If technical constraints make a requirement infeasible, propose a business decision and consequences rather than silently shrinking scope.

## Completion check

Inspect required sections, source links and exact revisions, ID coverage, scenario coverage, thread dispositions, downstream impacts, and documentation navigation. Apply the selected step's completion criteria and shared repository rules. A step cannot be `ready` while an unowned or implicit TBD remains. For planning, inspect every task for agent readiness: bounded outcome, linked source IDs, required inputs, dependencies, allowed choices and constraints, observable DoD evidence, validation command/evidence when known, documentation updates, and a clear stop/escalation condition. If a command or tool is not known, specify how the implementing agent should discover or select it without fabricating project facts. Report outputs and remaining explicitly deferred decisions, then recommend the next workflow step. Document checks do not authorize implementation or deployment, or establish that software tests passed. `/mvp` authorizes implementation only within its defined scope; deployment and publication still require explicit authorization.
