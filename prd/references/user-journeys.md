# Business journeys

Read [the template](../assets/templates/user-journeys.md) and inspect the PRD and open questions.

Reuse established personas; add roles only with supporting evidence. For each journey describe actor, goal, trigger, prerequisites, actions, observable responses, business rules, outcome, and acceptance criteria. Cover relevant exception paths such as invalid input, denied access, cancellation, and recovery. Derive stable, uniquely identified BDD scenarios from those acceptance criteria in the user's language, using Given/When/Then semantics. Link each scenario to its journey and requirements, avoid copying cross-cutting scenarios into unrelated journeys, and make each scenario specific enough to automate. Keep scenarios inline for a small journey set or move them into focused `.feature` files when that improves review; retain IDs and links either way.

Assign JRN IDs linked to REQ IDs. Map every in-scope requirement to a journey or explain its classification as a non-journey constraint. Record uncovered requirements as gaps. Describe what users observe rather than endpoints, tables, services, or code.

Assess whether MVP journeys reach a complete useful outcome. Surface conflicting business rules for a product decision.

Completion: actors/goals are supported; happy and relevant exception paths have testable criteria; each in-scope behavior maps to one or more uniquely identified BDD scenarios or has a documented reason not to be a journey; requirement coverage is explicit; MVP reaches a useful end state; every thread is decided, retired, or explicitly deferred by the user; source revisions, navigation, and workflow state are current.
