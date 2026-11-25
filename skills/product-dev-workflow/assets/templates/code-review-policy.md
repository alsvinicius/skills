# [Product] — Code review policy

- Status: draft
- Revision: 1
- Revision history: [link to the entry in docs/revisions/vN/tech.md]
- Updated: [date]
- Sources and revisions: [code style baseline, technical definition, validation guide, enforcement checks]
- Related artifacts: [harness README, agents, docs/reviews/README.md, workflow state]

## When review runs
| Level | Trigger | Required |
|---|---|---|
| Task | [after validation of each code task] | [yes / no] |
| Phase | [before exit criteria are claimed] | [yes / no] |
| Release | [on request] | [on request] |

## Checklist for this stack
[The checks from the code review reference, adapted to the languages, frameworks and ADRs of this project. Cite STY, DEC and ADR IDs. Do not repeat what `docs/harness/enforcement.md` already checks.]

## Severity and blocking
- `blocker` and unwaived `major` findings stop the task from being marked done.
- Fix rounds before escalation: [2]
- Who may waive a finding: [the user; or, under autopilot, an autodecision that links the finding]

## Reviewer agent
[Path of the agent definition and any host-specific notes.]

## Records
Review records live in `docs/reviews/` (index in `docs/reviews/README.md`), one file per review (`CRV-0001-task-slug.md`).
