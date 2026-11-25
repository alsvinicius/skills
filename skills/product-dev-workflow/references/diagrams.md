# Diagrams with draw.io

Generate architecture, sequence, and related diagrams as a single draw.io file with one page per diagram.

## Tool check first

1. Check whether a draw.io skill or MCP server is available in the current environment. If so, use it to create and edit the diagrams.
2. If none is available, tell the user and suggest installing a draw.io skill or MCP server for their agent host (check the host's current documentation or the draw.io project for the supported option; do not invent install commands). Do not make installation a blocker.
3. While waiting or if the user declines, offer these fallbacks and take the one they choose: write the `.drawio` file directly (it is plain XML, an `mxfile` with one `diagram` element per page), or keep the diagrams as text diagrams in the documentation. In [autopilot](autonomous-mode.md), choose the fallback without asking and record it as an autonomous decision. Never claim a diagram was rendered or validated when it was only written as XML.

## File and pages

- One file: `docs/diagrams/architecture.drawio`. Each diagram is its own page, named clearly. This is the single exception to the small-files rule; keep each page focused on one diagram and keep the file index current.
- Index: `docs/diagrams/README.md` lists each page with its purpose and the REQ, JRN, DEC/ADR, or context it supports.
- Suggested pages, adding only what the project needs: system context, containers/components, bounded-context map (from the [domain model](domain-model.md)), data model, sequence diagrams for key journeys (one page each, named by `JRN` ID), deployment/infrastructure, and state or flow diagrams where behaviour is stateful.
- Draw only confirmed or clearly labelled proposed structure. Mark proposals. Do not add components that no decision or requirement supports.
- Create diagrams in `/tech-definition` (architecture level) and extend them in `/planning` and implementation. Update the affected page whenever a decision, boundary, or journey changes, and record it in the revision entry.
- Link diagrams from the technical definition and the relevant ADRs; reference the page name, not a copy.
