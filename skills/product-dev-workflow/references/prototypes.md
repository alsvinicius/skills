# Frontend prototypes (optional, approval required)

Applies only when the product has a frontend or user interface.

## Suggest, never assume

1. When the PRD, journeys, or technical definition show a frontend, suggest prototypes to guide development. Say what they would cover (key screens and journey flows) and what they cost (extra time, and a throwaway or reusable artifact).
2. Ask the user for approval. If the user declines or does not answer, do not create prototypes, and record the decision in workflow state so the question is not asked again.
3. In [autonomous mode](autonomous-mode.md) do not ask. Decide whether prototypes are useful, create them only if so, and record the decision in the autonomous decision folder.

## When approved

- Prototype the screens needed by the MVP journeys first, then later phases. Link each prototype to its `JRN` IDs.
- Prefer the lightest format that conveys the layout and flow (static HTML, a prototyping tool the user names, or annotated wireframes). Do not choose a tool the user has not agreed to when the choice has cost or lock-in; record the choice as an ADR.
- Store prototypes in `docs/prototypes/`, one folder or file per journey or screen group, with `docs/prototypes/README.md` as the index linking each prototype to its journeys and tasks.
- Treat prototypes as design evidence, not requirements. Label what is confirmed by the user and what is a suggestion. A prototype never overrides the PRD or journeys; conflicts go back to the user.
- Reference the relevant prototype in each frontend task's inputs so `/mvp` and `/execute` build against it.
- Keep them current when journeys change, or mark them `needs-review`.
