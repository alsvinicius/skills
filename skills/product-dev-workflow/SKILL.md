---
name: product-dev-workflow
description: Guide product discovery, including brownfield analysis of an existing repository, into a business PRD, user journeys, technical definition, and an MVP-first implementation plan, then implement the minimum testable MVP through /mvp, reconcile artifacts after out-of-workflow changes through /reconcile, upgrade older projects after a skill update through /upgrade, set up a project harness and custom agents (validator, documenter, reviewer, executor), review code changes through /review-code, execute the full project through /execute, and run the whole flow without questions through /autopilot, saving each decision it takes in docs/autodecisions/. Use for creating or revising these artifacts, continuing the workflow, implementing planned MVP tasks, propagating requirement changes, reconciling artifacts with changes made outside the workflow, and upgrading projects built with an older version of this skill. Once a project uses this workflow, its AGENTS.md/CLAUDE.md requires every change to go through it unless the user explicitly opts out for that change. Unrelated coding in projects that do not use it does not require this workflow.
---

# Product Development Workflow

Use independently selectable steps within one connected workflow. Trace implementation tasks back to product value.

## Select a step

Slash names are routing conventions in user messages; this file does not register executable commands.

| Request | Instructions | Required inputs | Default output |
|---|---|---|---|
| `/brownfield-discovery` | [Brownfield discovery](references/brownfield-discovery.md) | Existing product repository and its versioned documentation | Brownfield assessment, PRD, journeys, technical definition, and implementation plan |
| `/prd-generator` | [PRD](references/prd-generator.md) | Idea or product evidence | `docs/product/prd.md` |
| `/domain-model` | [Domain model](references/domain-model.md) | PRD or equivalent business evidence | `docs/domain/` (DDD: subdomains, ubiquitous language, bounded contexts, context map) |
| `/to-user-journeys` | [Journeys](references/user-journeys.md) | PRD or equivalent requirements | `docs/product/user-journeys.md` |
| `/tech-definition` | [Technical definition](references/tech-definition.md) | PRD and journeys or equivalents | `docs/engineering/technical-definition.md` |
| `/code-style` | [Code style](references/code-style.md) | Technical definition inputs, or an existing repository's configs | `docs/engineering/code-style.md` and its ADR |
| `/planning` | [Planning](references/planning.md) | PRD, journeys, technical definition | `docs/planning/implementation-plan.md` |
| `/mvp` | [MVP implementation](references/mvp-implementation.md) | Approved plan, repository, and implementation instructions | Only the minimum software needed to test the product, plus updated task/workflow state |
| `/reconcile` | [Reconciliation](references/reconciliation.md) | Workflow state with a baseline, plus repository changes made outside the workflow | Updated artifacts, revision entry, and new baseline in workflow state |
| `/upgrade` | [Upgrade](references/upgrade.md) | Project created with an older skill version, plus the [capability registry](references/capabilities.md) | Additive migration, capability record in workflow state, and a revision entry |
| `/harness` | [Harness and agents](references/harness-and-agents.md) | Ready plan (and user approval) | Project harness, code review policy, and validator, documenter, reviewer, and executor agents |
| `/review-code` | [Code review](references/code-review.md) | A change, task, phase, branch, or diff; the harness policy when one exists | Findings with severities, and a review record in `docs/reviews/` |
| `/execute` | [Full execution](references/full-execution.md) | Ready plan; harness recommended | The complete planned project, with all artifacts kept current |
| `/autopilot` | [Autopilot](references/autonomous-mode.md) | An explicit instruction to turn it `on` or `off`, or to `status`/`review` it | Workflow state switch, and one file per decision in `docs/autodecisions/` |

Read the selected reference and its template, plus [shared documentation rules](references/documentation-and-repo-rules.md) and the [ADR rules](references/adr.md). For `/brownfield-discovery`, read the brownfield assessment template and the references/templates for PRD, journeys, technical definition, and planning. Load other steps when needed for prerequisites or changes.

An explicit step takes priority. For natural language, select the requested artifact. For “continue,” inspect existing artifacts and workflow state for the next incomplete step. Start a new end-to-end request with discovery, and begin the domain model as business terms emerge. Ask one focused question if ambiguity materially affects the work. Finish the requested step; proceed further only when the user's scope includes later steps.

## Inspect before writing

1. Identify the target product and repository. The skill installation directory is not the product destination. If unknown, continue discovery in conversation and ask where to save before writing project files.
2. Read applicable repository instructions, existing artifacts, documentation navigation, and actual subproject boundaries.
3. Reuse existing paths and conventions. Use defaults only when no equivalent exists. Record actual paths in `docs/product/workflow-state.md` or its existing equivalent.
4. Establish the project's Diátaxis documentation map during discovery/initialization and keep it current throughout every workflow step, for both greenfield and brownfield projects. Treat it as project documentation, not as a one-time generated artifact.
5. Inspect prerequisite contents and source revisions. A filename or `ready` label alone does not establish sufficient input.

Accept equivalent user-supplied artifacts and explain how they satisfy the input contract. Identify specific gaps and ask the smallest useful batch of questions. Continue independent work or save a clearly labeled draft. Do not invent decisions to complete a later step or silently run all earlier interviews.

For `/brownfield-discovery`, treat repository code and versioned documentation as evidence about the existing product. Inspect statically; do not run the application or infer runtime behavior that the sources do not establish. Keep observed behavior, inferred intent, confirmed product decisions, and unresolved questions distinct. Do not turn existing behavior into a requirement without confirmation that it is desired. Determine the scope mode first (`as-is`, `change`, or `rebuild`): in `as-is` mode, confirmed existing behaviour is recorded as `as-built` and admits no implementation tasks (see [brownfield discovery](references/brownfield-discovery.md) and [task admission](references/planning.md#task-admission-for-existing-products)). This route includes all four downstream artifacts, so proceed through them in order when their inputs are sufficient; checkpoint and ask focused questions at material product decision points. A blocker in one artifact must not prevent unrelated evidence gathering, but do not mark dependent artifacts ready while it remains unresolved.

## Interview and decision handling

- Reuse known answers. Ask one to three focused questions per batch, ordered by their effect on scope and decisions.
- Distinguish confirmed requirements, preferences, proposals, assumptions, and open questions; record sources.
- Confirm assumptions that materially determine scope, cost, or architecture. Routine authorized edits do not require approval.
- If the user requests a draft with missing information, label affected sections provisional and record blockers.
- Keep PRDs and journeys at business level. Save unsolicited stack preferences in workflow state for the technical interview.
- Never invent numerical targets, baselines, dates, budgets, capacity, policies, or tool preferences. Mark unknowns explicitly.
- Close every discussion thread before marking a step ready. Resolve it with a sourced decision, retire it with a reason, or record it as an explicit `TBD` only when the user chose to defer it. “Nonblocking” or “known unknown” is a status, not a disposition. Ask about unresolved material decisions; do not silently carry them into downstream artifacts.

## Cross-cutting rules (every step)

- **ADRs:** record every technical and architectural decision as its own file in `docs/adr/`, with an index. Follow [ADR rules](references/adr.md).
- **Small files:** never create large files. Split by scope and keep indexes and links between related files. See the document size rules below.
- **Diátaxis is mandatory** for every project this skill creates or maintains: separate folders for tutorials, how-to, reference, and explanation, each with an index and one file per point. See [shared documentation rules](references/documentation-and-repo-rules.md) and the bundled [Diátaxis guide](references/diataxis.md).
- **Domain model (DDD):** start a Domain-Driven Design view at the beginning of project definition and use its ubiquitous language and bounded contexts in every later artifact. See [domain model](references/domain-model.md).
- **Revisions:** record every revision round in `docs/revisions/vN/{product,tech}.md`. See [project revisions](references/revisions.md).
- **Diagrams:** generate architecture, sequence, and related diagrams as one draw.io file with a page per diagram, using a draw.io skill or MCP if available, otherwise suggest installing one. See [diagrams](references/diagrams.md).
- **Security:** cover assets, trust boundaries, and abuse concerns in discovery, express material ones as requirements, and plan proportionate validation. All security testing stays inside the approved harness and authorised scope. See [product security](references/security.md).
- **Observability and performance:** consider them only when the user requests them or evidence makes them material. Express confirmed outcomes as `REQ` acceptance criteria, never invent targets, and validate inside the harness. See [observability and performance](references/observability-and-performance.md).
- **Project costs:** estimate costs only when the user requests them or they are material. Keep PRD constraints at business level; put cost lines (`COST-NNN`, with units, period, denominator, currency, source and date, confidence) in the cost model. Never invent prices, budgets, or usage, and never authorise paid spend. See [project costs](references/project-costs.md).
- **Code style baseline:** define per language and subproject during technical definition, with enforceable tooling, numbered `STY` rules, and one ADR; wire it into planning, the harness, and `CONTRIBUTING.md`. See [code style](references/code-style.md).
- **Test-first development:** in the technical definition, ask whether the user wants tests written before the application code. If yes, every code task starts by writing the failing tests, then makes them pass. Record the answer. See [test-first development](references/tdd.md).
- **Deterministic enforcement:** enforce mechanically checkable rules with programs, not judgement: a single check entry point, generated validators, and git hooks and CI that call it. Choose the strategy in the technical definition, plan the tasks, and create them through the harness. See [deterministic enforcement](references/deterministic-enforcement.md).
- **Prototypes:** if the product has a frontend, suggest prototypes to guide development, and create them only if the user approves. See [prototypes](references/prototypes.md).
- **Standing rule in `AGENTS.md`/`CLAUDE.md`:** every project that uses this workflow carries a short section requiring all changes to go through it and keep the artifacts current, unless the user explicitly says otherwise for a change. Create or repair it in every step that touches those files and in `/reconcile`. See [shared documentation rules](references/documentation-and-repo-rules.md#product-workflow-guidance-in-agentsmd-and-claudemd).
- **Reconciliation:** changes made outside the workflow are brought back into the artifacts with `/reconcile`. See [reconciliation](references/reconciliation.md).
- **Backwards compatibility:** projects built with an older version of this skill are brought forward with `/upgrade`, which is additive and driven by the [capability registry](references/capabilities.md). Any change to this skill that alters required project structure must add a registry entry. See [upgrade](references/upgrade.md).
- **Harness and agents:** suggest a project harness to guide the development flow, and ask for approval. See [harness and agents](references/harness-and-agents.md).
- **Code review:** every code task is reviewed by a dedicated read-only Reviewer agent (or the main agent when there is no harness) after validation. Findings carry severities, `blocker` and unwaived `major` findings stop a task from being done, and each review is saved in `docs/reviews/`. See [code review](references/code-review.md).
- **Autopilot:** if the user explicitly asks for the whole flow to run without questions, decide instead of asking and save each decision as its own file in `docs/autodecisions/`. The user can turn it on and off at any time, and the `Autopilot` field in workflow state is the switch. See [autopilot](references/autonomous-mode.md).

## Language and document size

- Write new artifacts and user-facing sections in the language the user is using for the active workflow. Keep the linked artifact set consistent in that language unless the user asks for another language. Preserve code identifiers, protocol names, and quoted source text as needed.
- Do not create large files. Use a short index/overview plus focused documents, designed up front. Split by stable subject, channel, decision, component, or independently executable task set, and do not fragment into trivial files. Keep IDs stable, add navigation, and update every inbound link when moving content.
- Keep one authoritative home for each detailed requirement, decision, journey, scenario, or task. Summaries should link to that home instead of copying its full content.

## Artifact and handoff contract

Use bundled templates as section contracts, adapting formatting to the repository. Each artifact records status, revision, sources with revisions, related links, decisions, assumptions, and the disposition of every open thread. Brownfield-derived artifacts link to the assessment and its evidence; the assessment distinguishes observed facts, inferences, confirmed decisions, and unresolved questions.
Keep revision histories in `docs/revisions/vN/{product,tech}.md` with an index, following [project revisions](references/revisions.md): motivation, artifacts changed, impact, and decisions per round. Every revisioned artifact links to its entry; do not embed a growing change log in the PRD, domain model, journeys, technical definition, implementation plan, or workflow state. Follow an existing repository convention when it already provides an equivalent.

Statuses: `draft` for incomplete/provisional content; `ready` when completion criteria are met and every thread has a disposition; `needs-review` when source changes may invalidate content. Readiness is a content assessment, not user approval. Record explicit approval separately only if it occurred. A deferred `TBD` must name its owner/source, affected IDs, impact, and revisit point; it may remain only when the user explicitly chose to defer it. Otherwise resolve or ask.

Use stable IDs: `REQ-001` for requirements, `JRN-001` for journeys, `DEC-001` for technical decisions, `TASK-001` for tasks, and `COST-001` for cost-model lines. Preserve existing IDs, never reuse removed IDs, and mark removed items retired. Link journeys to requirements, decisions to requirements/journeys, and tasks to sources and dependencies. Attach business rules and acceptance criteria to their owning items.

Maintain workflow state using [the template](assets/templates/workflow-state.md): actual artifact paths (including ADR, Diátaxis, prototype, harness, autodecisions, and review indexes), revisions, readiness, blockers, deferred technical preferences, and downstream updates. At handoff summarize outputs, remaining decisions, and the next usable step.

## Recommend the next step

At the end of every requested workflow step, explicitly recommend what should happen next:

| Completed step | Recommended next step |
|---|---|
| PRD | `/domain-model` |
| Domain model | `/to-user-journeys` |
| User journeys | `/tech-definition` |
| Technical definition | `/planning` |
| Planning | Suggest the project harness (`/harness`, needs approval); then `/mvp` to build the minimum testable slice, or `/execute` for the whole project. For an `as-is` plan with no admitted tasks, report that no implementation is needed instead |
| Harness | `/mvp` for a quick testable slice, or `/execute` for the full project |
| Code review | Fix the blocking findings, re-validate, then continue with the next task or phase |
| MVP implementation | Test the slice with real users, then `/execute` for the remaining scope |
| Full execution | Validate every phase's exit criteria, then release review |

If the current artifact is still `draft` or has blockers, first name the specific action needed to complete or unblock it, then identify the subsequent step. If prerequisites are missing, say what must be resolved before that step can proceed reliably. For planning, point to the next unblocked Phase 1 task when the plan identifies one. Recommend without starting the next step; continue only when it is already within the user's request. If workflow state is being maintained, save the recommendation there too. Keep the handoff concise and tied to the artifact produced.

For `/mvp`, build only the minimum needed to test the product (see [MVP implementation](references/mvp-implementation.md)); defer every other planned task. For `/execute`, work through the whole plan. In both cases work autonomously within the confirmed product scope and repository rules: select and complete unblocked tasks, use project-defined tools, update affected docs, ADRs, and state, and proceed to the next task. Autonomy does not authorize inventing product decisions, expanding scope, exposing secrets, incurring material costs, running security tests outside the approved harness and authorised scope, or performing irreversible external actions such as deployment or publication. Pause only when a material decision or an authorization boundary prevents safe progress; continue independent tasks and record the blocker. While autopilot is on, record would-be questions as autodecisions instead of asking. Review each finished task with [code review](references/code-review.md) before moving on.

## Checkpoint and resume across sessions

Once a project destination is established, initialize workflow state at the start of discovery, even in an empty folder. Create the selected artifact as a draft as soon as there is meaningful content. Keep project state in that project, never in the skill installation directory. Respect an explicit conversation-only request; explain that unsaved answers cannot be recovered by a new session.

After each meaningful interview answer batch, scope change, or decision, persist the confirmed information before asking the next batch or ending the turn. Also checkpoint before a planned pause or handoff. Do not wait for an artifact to be complete. Save concise facts and decisions, not whole transcripts, credentials, or unnecessary sensitive information.

Store information in its authoritative artifact and link to its section or stable ID from workflow state. Keep only information with no artifact home yet, such as deferred technical preferences, directly in state. Record the active step and activity, completed interview topics, pending questions, last completed action, and the exact next action. For MVP implementation, also track active task/subtask, completed tasks and evidence, validation results, blockers, and next unblocked task. Preserve the user's requested scope so resumption does not automatically authorize later steps.

Write changed artifacts first, then update state with their actual revisions and any remaining reconciliation work. Preserve user edits. If a write fails, report what was not saved and do not claim a successful checkpoint. Abrupt interruption may leave only the last completed checkpoint; do not promise recovery of unsaved conversation.

When the skill is invoked in a folder with saved state and no explicit new-step request, resume the recorded activity. Read state, linked artifacts, and applicable repository instructions; compare recorded revisions and content for external edits, missing files, and unfinished updates. Artifacts remain authoritative over stale summaries. Reconcile clear differences and repair state; ask only about material conflicts or missing decisions. If state is absent, reconstruct it from existing artifacts where possible without inventing interview history.

If the recorded capabilities are absent or miss registry entries, say so and recommend `/upgrade` without applying it. Briefly summarize the recovered step and next action, then continue. Reuse persisted answers instead of asking the user to restate context. A new explicit step or correction takes priority over the saved next action; checkpoint the resulting change. Keep incomplete work `draft` and affected dependencies `needs-review` until their criteria are satisfied.

## Changes made inside and outside the workflow

When a project uses this workflow, treat every requested change as in scope of it: identify the affected artifacts first, implement, then update them and add the revision entry in the same step. Skip this only when the user explicitly says not to for that change; then leave the artifacts untouched, say they are now out of sync, and do not record it as a workflow change. When the user asks to catch up (`/reconcile`, or plain language such as "update the docs to match what changed"), or when resuming finds the repository ahead of the recorded baseline, follow [reconciliation](references/reconciliation.md). Resuming never reconciles silently: report the drift and the proposed reconciliation, then proceed if the request covers it.

## Propagate changes

1. Read affected artifacts and follow source links and IDs. Identify changes, retirements, and conflicts before overwriting content.
2. Update the authoritative source, increment its revision, and write or append its entry in `docs/revisions/vN/` in the same step ([project revisions](references/revisions.md)). This applies to every edit of a revisioned artifact, including changes requested in plain conversation, changes made during `/mvp` or `/execute`, and changes recovered by `/reconcile`; do not wait for a slash command. Preserve unrelated content and user edits.
3. Reconcile affected journeys, technical decisions, tasks, acceptance criteria, dependencies, and Diátaxis documentation when implications are clear and within scope. Keep relevant tutorials, how-to guides, reference, and explanations accurate as product behavior changes.
4. If reconciliation needs a decision or exceeds scope, mark dependents `needs-review`. Record affected IDs, reasons, and required decisions in workflow state.
5. Update a dependent's source revision only after reconciliation. Maintain navigation and report resolved and outstanding impacts.

If technical constraints make a requirement infeasible, propose a business decision and consequences rather than silently shrinking scope.

## Completion check

Where the project has an enforcement entry point, run it for the structural checks below instead of inspecting them by eye. Inspect required sections, source links and exact revisions, ID coverage, scenario coverage, thread dispositions, downstream impacts, revision entries (every artifact whose `Revision` changed has a matching entry and index line), and documentation navigation. Apply the selected step's completion criteria and shared repository rules. A step cannot be `ready` while an unowned or implicit TBD remains. For planning, inspect every task for agent readiness: bounded outcome, linked source IDs, required inputs, dependencies, allowed choices and constraints, observable DoD evidence, validation command/evidence when known, documentation updates, and a clear stop/escalation condition. If a command or tool is not known, specify how the implementing agent should discover or select it without fabricating project facts. Report outputs and remaining explicitly deferred decisions, then recommend the next workflow step. Document checks do not authorize implementation or deployment, or establish that software tests passed. `/mvp` authorizes implementation only of the minimum testable slice, and `/execute` only within the planned scope; deployment and publication still require explicit authorization.
