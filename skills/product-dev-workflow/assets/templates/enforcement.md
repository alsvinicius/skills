# [Product] — Enforcement checks

- Status: draft
- Revision: 1
- Revision history: [link to the entry in docs/revisions/vN/tech.md]
- Updated: [date]
- Sources and revisions: [code style baseline, technical definition, ADR, existing tool configs]
- Related artifacts: [validation guide, harness README, workflow state]
- Entry point: [one command that runs every check, or "to be discovered: how"]
- Hook activation: [documented command, or "no hooks"]
- CI: [job running the entry point, or "no CI" with the ADR that records it]

## Checks
| ID | Enforces | Source | Command and config | Scope | Stage | Failure mode | Proof (pass and fail) |
|---|---|---|---|---|---|---|---|
| CHK-001 | [rule] | [STY / REQ / DEC / skill rule] | [command, path] | [staged / repository] | [pre-commit / commit-msg / pre-push / CI / validator] | [block / warn] | [fixture or test path] |

## Waivers
| Check | Scope | Reason | Owner | Expiry or revisit point |
|---|---|---|---|---|

## Pending
[Checks proposed but not yet created, with owner/source, impact, and revisit point.]
