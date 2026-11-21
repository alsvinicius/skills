# Product workflow state

- Product / repository: [actual destination]
- Updated: [date]
- Revision history: [docs/revisions/README.md and current vN]
- Language used by the user for this workflow: [language]
- Current step: [step]
- Requested scope: [selected step or authorized end-to-end workflow]
- Brownfield scope mode: [as-is / change / rebuild, with the source of the decision; or not applicable]
- Current activity: [interview / drafting / reconciliation / handoff]
- Last completed action: [action and saved artifact revision]
- Next action: [specific question batch or document operation]
- Recommended next workflow step: [next command/step, or the blocking work needed first]
- Autonomous mode: [off / on, user instruction and date; link to docs/autonomous-decisions/README.md]
- MVP test boundary: [included tasks, deferred-from-mvp tasks, how it will be tested, or not defined]
- MVP implementation progress: [active task, completed task IDs/evidence, validation results, blockers, or not started]
- Full execution progress: [phase, completed tasks/evidence, blockers, or not started]

## Interview checkpoint

- Completed topics: [topics and links to authoritative answers/IDs]
- Pending questions: [exact unanswered questions and why they matter]
- Checkpoint saved: [timestamp with timezone]
- Interrupted or pending writes: [remaining work or none; do not list unsaved work as completed]

## Artifacts
| Artifact | Actual path | Revision | Status | Source revisions | Blockers |
|---|---|---|---|---|---|
| Brownfield assessment | [link or not applicable] | [revision] | [draft / ready / needs-review / not applicable] | [repository and documentation revisions] | [questions or none] |
| PRD | [link] | [revision] | draft | [sources] | [questions or none] |
| Domain model (DDD) | [docs/domain/README.md] | [revision] | draft | [sources] | [questions or none] |
| Journeys | [link] | [revision] | draft | [sources] | [questions or none] |
| Technical definition | [link] | [revision] | draft | [sources] | [questions or none] |
| Implementation plan | [link] | [revision] | draft | [sources] | [questions or none] |
| MVP implementation | [repository paths / task IDs] | [code revision or commit if known] | not-started | [plan revision] | [blockers or none] |

## Project indexes and optional parts
| Item | Actual path | Status |
|---|---|---|
| Diátaxis index and four axis folders | [docs/diataxis/] | [created / reconciled] |
| ADR index | [docs/adr/README.md] | [created] |
| Prototypes | [docs/prototypes/README.md or n/a] | [not applicable (no frontend) / suggested / approved / declined / created] |
| Harness | [docs/harness/README.md or n/a] | [suggested / approved / declined / created] |
| Agents (validator, documenter, executor) | [paths] | [not created / created] |
| Diagrams (single draw.io file) | [docs/diagrams/architecture.drawio and README.md, or n/a] | [tool available / install suggested / fallback chosen / created] |
| Revisions index | [docs/revisions/README.md] | [current vN] |
| Autonomous decisions index | [docs/autonomous-decisions/README.md or n/a] | [off / on] |

## Confirmed decisions and sources
[Links to authoritative artifact sections/IDs; keep facts without an artifact home here temporarily. Approval only if explicitly given.]

## Assumptions and thread dispositions
[For each thread: resolved with source, retired with reason, or explicitly deferred by the user as TBD with owner/source, affected IDs, impact, and revisit point. Do not list a merely nonblocking question as closed.]

## Deferred technical preferences
[Preference and source for technical interview.]

## Pending downstream updates
| Source change | Affected artifact / IDs | Reason | Required action or decision |
|---|---|---|---|

## Recommended next step
[Specific next action, handoff, or blocker.]
