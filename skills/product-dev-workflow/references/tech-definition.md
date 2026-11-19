# Technical definition

Read [the template](../assets/templates/technical-definition.md), the PRD, journeys, and [domain model](domain-model.md), and deferred technical preferences.

Interview about existing systems, preferred languages, team skills/capacity, development workflow, testing, hosting/cloud, budget, integrations, data sensitivity, reliability, performance, accessibility, compliance, and operations. Mark unknowns. Verify material current tool capabilities in authoritative documentation when necessary.

Define implementation for full scope, separating MVP needs from future extension points. Start from the bounded contexts and context map; justify any deviation in an ADR, and confirm or revise the candidate aggregates. Generate architecture and sequence diagrams per [diagrams](diagrams.md). Choose the simplest architecture meeting confirmed requirements; example technology lists are not defaults. Document components/boundaries, data ownership/lifecycle, contracts, integrations, access rules, failure handling, security, measurable quality targets, development setup, testing strategy, CI/CD, deployment, observability, and recovery. Scale detail to requirements and explain relevant omissions.

Create one [ADR](adr.md) file per technical or architectural decision in `docs/adr/` with an index; each DEC in the technical definition is a short summary linking to its ADR, which holds status, alternatives, rationale, consequences, evidence, and REQ/JRN IDs. If the product has a frontend, suggest prototypes and ask for approval ([prototypes](prototypes.md)). Distinguish recommendations from user preferences. Surface feasibility conflicts for business decisions.

Completion: full scope has implementation coverage or explicit disposition; material constraints, decisions, contracts, and operations are documented; MVP and future scope are distinguished; every thread is decided, retired, or explicitly deferred by the user before `ready`; actual/proposed subprojects and mandatory files are identified under shared rules.
