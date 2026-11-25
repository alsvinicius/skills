# Architecture decision records (ADRs)

Record every technical and architectural decision as its own ADR file. This applies to `/tech-definition`, `/planning`, `/mvp`, `/execute`, and any agent choice that is technical in nature (stack, data model, boundaries, contracts, libraries, hosting, testing approach, security approach, and reversible implementation choices that shape later work).

## Location and layout

- Default folder: `docs/adr/`. Reuse an existing ADR folder or convention if the repository has one.
- One file per decision: `docs/adr/ADR-0001-short-slug.md`. Never combine decisions in one file.
- Keep `docs/adr/README.md` as the index: ID, title, status, date, and link, ordered by ID. Update it with every new or changed ADR.
- Use [the ADR template](../assets/templates/adr.md).
- Keep the ADR ID (`ADR-0001`) as the filename identity. Technical definition `DEC-xxx` entries become short summaries that link to their ADR; the ADR is the single authoritative home. Link each ADR to its REQ/JRN/TASK IDs, and link supersession both ways.
- Statuses: `proposed`, `accepted`, `superseded by ADR-xxxx`, `deprecated`. Never delete or rewrite an accepted ADR to change history; write a new ADR that supersedes it.

## When to write one

Write the ADR when the decision is made, not at the end. A decision is anything a later reader could reasonably ask "why was it done this way?" about. Skip trivial choices that follow an existing ADR or a repository convention.

During `/mvp` and `/execute`, an implementation choice that is technical gets an ADR before or together with the change that depends on it. Record the ADR in the task evidence.

## Rules

- Record context, decision, alternatives considered, consequences, and evidence. Do not invent alternatives or evidence.
- Distinguish a user-confirmed decision from an agent proposal. In [autopilot](autonomous-mode.md), also create the matching autodecision and link both ways.
- Keep each ADR short and focused. Link to deeper reference or explanation docs instead of copying them.
