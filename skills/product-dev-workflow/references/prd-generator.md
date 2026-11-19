# PRD generation

Read [the template](../assets/templates/prd.md).

Interview about macro idea, target users, current pain and alternatives, business need, value proposition, expected deliverables, success measures, scope, exclusions, business constraints, and risks. Distinguish buyers, operators, and end users when useful. Ask about metrics without inventing targets. For brownfield work, use the assessment as evidence and distinguish existing behavior from confirmed desired behavior; never infer intent solely from code or documentation.

Cover security during discovery: assets and data, actors and trust boundaries, abuse and threat concerns, and unknowns, following [product security](security.md). Express material concerns as `REQ` acceptance criteria without prescribing technology.

Capture domain terms the business uses as they emerge and start the [domain model](domain-model.md) glossary; use those terms in the PRD.

Describe capabilities and observable business outcomes. Exclude languages, frameworks, APIs, schemas, and cloud choices. Business constraints such as a required jurisdiction may constrain technology without prescribing it.

For each REQ record need, desired behavior, priority/rationale, observable acceptance criteria, and source. Explain initial product value and deferred scope. Treat the MVP boundary as provisional until journeys and technical feasibility are assessed.

Completion: problem, audience, value, and delivery are clear; requirements have stable IDs and acceptance criteria; material security concerns and unknowns are requirements or dispositioned open questions; scope/exclusions and success measures or unknowns are explicit; every thread is decided, retired, or explicitly deferred by the user before `ready`; artifact and workflow state are linked for handoff. Recommend `/domain-model` next.
