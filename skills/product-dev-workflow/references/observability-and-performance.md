# Observability and performance

Use this reference in `/prd-generator`, `/brownfield-discovery`, `/tech-definition`, `/planning`, `/mvp`, and `/execute` when a user request, a confirmed need, or evidence makes reliability, diagnosis, or performance material. Keep it proportionate. Do not add generic instrumentation, dashboards, service-level objectives, traffic levels, or latency targets to every product.

## When it applies

Consider this topic when at least one of these holds:

- the user asks for it, for example to diagnose failures, explain slow flows, or show that the service behaves as agreed;
- evidence makes it material: a reported slowdown or incident, a journey where waiting, failure, or duplication changes the outcome (such as a booking that must not be double-confirmed), an existing monitoring practice that operators rely on (brownfield), or a confirmed external expectation;
- operators must be able to find out what happened and act on it.

When none applies, record "not material" with the reason in the PRD's confirmed decisions and move on. Do not ask about every possible signal.

## Discovery (PRD)

Ask, in the normal batch rules, only what changes requirements or validation effort:

- what users must see or be able to do when something fails or is slow, in their own words;
- which flows must keep working during failures, and what must never be lost or duplicated;
- how the business learns of a problem today, who acts on it, and what they need to answer;
- what "too slow" or "unavailable" means to the people affected.

Express each confirmed outcome as a `REQ` with observable acceptance criteria that name no tool. For example: "When a booking request cannot be saved, the student sees that it was not sent and can try again without creating a duplicate." For diagnosis: "An operator can find the current status of a booking request from the student's reference."

**Targets:** record a number only when the user supplied or agreed it, with its source, period, and denominator. Otherwise record the target as an open question or a `TBD` with its owner, impact, and revisit point, and ask about it when it is material. Never estimate or assume latency, throughput, availability, traffic volume, or service-level objectives. Business success measures in the PRD follow the same rule.

## Technical definition

- Derive the minimum design from confirmed requirements: which states, events, or logs answer the operator's question, how failures reach users, and how long records are kept. Keep sensitive data out of signals unless a confirmed requirement needs it, and follow confirmed data-sensitivity rules.
- Prefer the project's existing logging, metrics, and alerting. Add a service, agent, or dashboard only when a confirmed need requires it, and record the choice in an ADR.
- Record performance targets only from confirmed requirements. When a target is unknown, state the assumption and the measurement that would settle it.
- Route choices with a recurring cost or retention effect to the user as decisions. Do not decide them silently.

## Planning

- Link each applicable `TASK` to its `REQ` IDs in its Sources and to its BDD scenario IDs. Add an observability or performance task only when a confirmed `REQ` needs it.
- Choose validation by requirement:
  - **Observable behaviour under failure or delay:** BDD scenarios that trigger the condition and assert the user-visible result and recovery.
  - **Diagnosis:** a scenario showing that an operator can answer the defined question from the recorded signal, without exposing data the requirement does not allow.
  - **Performance:** a repeatable measurement against the confirmed target, using the command and environment recorded in `docs/harness/validation.md`. When no target is confirmed, the expected result is to measure and report the figure. Do not mark it passed or failed.
- Use only the project's real commands. When none exist, the task gives a discovery rule (for example, inspect existing test, benchmark, or configuration files) and a stop condition.
- Do not plan load, stress, or soak tests against production or third-party services. Plan one only when the user asks for it and the harness records the environment, target, representative non-personal data, rate limits, time window, abort condition, and restore path. Otherwise record a blocker with the approval needed.
- Measurement tools or services that cost money are decisions for the user. Do not authorise paid spend.

## Limits

- Load, stress, or soak tests run only inside the approved harness and an authorised environment, under the [product security](security.md) rules.
- Do not invent targets, baselines, or pass/fail thresholds. Do not describe a measurement as passing against a target that does not exist.
- Do not collect personal data in logs, metrics, or traces beyond what a confirmed requirement needs.

## Completion

Each material outcome has `REQ` acceptance criteria and a disposition. Unknown targets are recorded as open questions or `TBD` with owner and revisit point. Applicable tasks link `REQ` and BDD IDs and name their validation evidence. No unrequested instrumentation, target, or production load test appears in the PRD, technical definition, or plan.
