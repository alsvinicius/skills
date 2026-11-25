# Product security

Use this reference in `/prd-generator`, `/brownfield-discovery`, `/planning`, `/mvp`, `/execute`, and `/harness`. Keep security proportionate: material concerns become stable requirements with validation evidence. Do not prescribe technology, and do not require penetration testing for every project.

## Discovery (PRD)

During the interview, identify from business evidence (and, for brownfield work, the assessment):

- **Assets and data:** what the business must protect, such as personal data, money, credentials, business records, or service availability. Record sensitivity only as the user confirms it. Do not assume a regulatory regime.
- **Actors and trust boundaries:** who acts (visitors, end users, operators, administrators, third parties) and where data or authority passes between them. Describe business boundaries, not network topology.
- **Abuse and threat concerns:** plausible ways a user or outsider could misuse the product, such as impersonation, access to another party's data, manipulating an approval or status, fraud, scraping, or flooding.
- **Unknowns:** missing sensitivity, obligations, exposure, or risk tolerance. Record each as an open question with its owner and impact, and ask the material ones in the normal batch rules.

Ask only what changes scope, requirements, or validation effort. When a confirmed low-sensitivity product has no material concern, record that with its reason.

## Express material concerns as requirements

For each material concern, add a `REQ` with:

- the need and desired behaviour, stated as an observable outcome;
- acceptance criteria observable without naming a mechanism, for example "A student sees only their own requests; a request for another student's record is refused and shows no data from it";
- priority, rationale, and source.

Do not name authentication providers, cryptographic methods, tools, or headers in PRD requirements. A confirmed business constraint, such as a required jurisdiction, may be recorded as a constraint without prescribing how to meet it.

## Plan proportionate validation (planning)

Choose validation for each security requirement by risk and exposure:

- **Authorisation and data isolation:** BDD scenarios that attempt the forbidden action and assert refusal. This is the default for security requirements.
- **Existing or chosen automated checks:** for example dependency, secret, or static checks. Record the real commands in `docs/harness/validation.md`, or a discovery rule when the command is unknown.
- **Vulnerability testing or authorised penetration testing:** plan these only when exposure, data sensitivity, or a confirmed requirement justifies them. Record the reason and the authorised scope.

Each security-relevant `TASK` names its validation evidence, affected documentation, and a stop condition for missing authorisation or containment.

## Harness and authorisation limits

All security scans, vulnerability tests, and penetration tests must:

1. Run only inside the project's approved harness, using commands and environments recorded in `docs/harness/validation.md`.
2. Target only systems and data explicitly authorised by the product owner: named environments, services, methods, accounts, time window, and data handling.
3. Never bypass harness controls, permissions, or approval gates. Never expand scope to new targets, third-party systems, production, or real user data without a new explicit authorisation.

When safe containment (an isolated or test environment, non-production data, rate limits, and a restore path) or explicit authorisation is missing:

- do not run the test;
- record a blocker in workflow state with the approval or containment needed and the affected `REQ`/`TASK` IDs;
- continue independent work.

Record findings as evidence with severity and affected IDs. Keep exploit detail to what is needed to fix and verify the issue, and do not publish findings outside the project.

## Agents and autonomy

- The validator may run only the security checks listed in the validation guide, within the authorised scope. It reports findings and never exploits them further.
- The executor never runs security tests outside the harness or authorised scope.
- In [autopilot](autonomous-mode.md), missing authorisation or containment is a blocker to record, not a decision to proceed. Autonomous choices may select only among safe, in-scope options.

## Completion

Security concerns and unknowns each have a disposition. Each material security concern has observable requirements and acceptance criteria. Validation is proportionate, stays within the harness and authorised scope, and every missing authorisation or containment is recorded as a blocker.
