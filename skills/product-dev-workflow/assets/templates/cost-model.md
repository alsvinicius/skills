# [Product] — Cost model

- Status: draft
- Revision: 1
- Revision history: [link to the entry in docs/revisions/vN/tech.md]
- Updated: [date]
- Sources and revisions: [price sources with retrieval dates, user quotes, plan and PRD revisions]
- Related artifacts: [technical definition, implementation plan, ADRs, workflow state]
- Language: [language used by the user for this workflow]

## Scope and basis
[Cost categories included and excluded; period; currency; denominators (for example active versus registered users, what counts as a transaction); taxes, fees, and discounts included or excluded.]

## Cost lines
| ID | Category | Item | Unit and period | Denominator | Currency | Price source and date | Usage assumption (source) | Amount or unknown | Confidence | Status | Owner |
|---|---|---|---|---|---|---|---|---|---|---|---|

[Categories: one-time implementation, recurring fixed, recurring variable, operations and maintenance, unit cost. Use `unknown` rather than an estimate when an input is missing.]

## One-time implementation
[Plan effort references and the stated rate, with currency and source. Capacity assumptions stay in the implementation plan.]

## Unit costs
[Cost per defined unit, with its denominator and the `COST` IDs it uses; `unknown` where inputs are missing.]

## Scenarios
[Only with stated usage assumptions and sources. Label each illustrative, not a forecast. Link each to its `COST` IDs.]

## Operations and maintenance
[Who carries upgrades, incidents, and support, and the cost basis if known; otherwise unknown with owner.]

## Unknowns, decisions, and paid-spend gates
| Item | Affected IDs | Impact | Owner / source | Revisit point |
|---|---|---|---|---|

[Record each open cost question. State that no paid purchase, trial, or commitment is authorised unless the user has approved it, with the approval source.]
