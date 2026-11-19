# Domain model (`/domain-model`)

A Domain-Driven Design (DDD) view of the business, created at the start of project definition, right after the PRD interview begins to yield business facts. It gives the PRD, journeys, technical definition, and plan one shared language and a first cut of boundaries. Keep it at business level: no frameworks, databases, or code.

Read [the template](../assets/templates/domain-model.md). Start it as a draft during `/prd-generator` as soon as domain terms appear; complete it before `/to-user-journeys`. In brownfield work, derive it from the assessment and distinguish observed structure from confirmed intent.

## Contents (strategic DDD)

- **Domain and subdomains:** classify each as core, supporting, or generic, with the reason. Core subdomains deserve the most design effort and the MVP focus.
- **Ubiquitous language:** glossary of terms the business uses, one definition each, and terms to avoid (synonyms, overloaded words). Use these terms in every later artifact.
- **Bounded contexts:** each context, its responsibility, the language it owns, and the subdomain it implements. Note where the same word means different things in different contexts.
- **Context map:** relationships between contexts (upstream/downstream, shared kernel, customer-supplier, conformist, anti-corruption layer, open host service, separate ways) with the reason for each.
- **Domain events and actors:** key business events and who or what triggers them (event-storming level, in business words).
- **Candidate aggregates and invariants:** the business objects that must stay consistent together and the rules they protect. Mark as candidates; the technical definition confirms them.
- **Open questions:** terms or boundaries needing a business decision.

Tactical design (aggregate implementation, repositories, modules) belongs in the technical definition and ADRs, which must use these contexts as the starting point and justify any deviation.

## Files and links

Keep files small. Use `docs/domain/`:

```text
docs/domain/
  README.md                index and subdomain map
  ubiquitous-language.md
  context-map.md
  contexts/<context>.md    one file per bounded context (responsibility, language, events, aggregates, invariants)
```

Link each context to the REQ/JRN IDs it serves. The context map also appears as a page in the [project diagrams](diagrams.md). Do not split a small domain into trivial files; one context file is enough when there is a single context.

## Completion

Subdomains are classified, the glossary covers the terms used in the PRD, every REQ maps to a context or is marked cross-cutting, the context map explains each relationship, every thread is decided, retired, or explicitly deferred by the user, and navigation, revision entry, and workflow state are current. Then recommend `/to-user-journeys`.
