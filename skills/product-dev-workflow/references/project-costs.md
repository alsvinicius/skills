# Project costs

Use this reference in `/prd-generator`, `/tech-definition`, `/planning`, `/mvp`, and `/execute` when the user asks for a cost estimate or budget, or when cost is material: a confirmed budget or ceiling, a choice between paid services or hosting, recurring charges that scale with users or transactions, or staff time to operate the product. When none applies, record "not material" with the reason in the PRD's confirmed decisions and move on. The general rules on assumptions and budgets in [the skill](../SKILL.md) apply; this reference adds the structure, not new permissions.

This is guidance for the product being planned. Do not produce a cost estimate for the skill's own repository.

## Cost categories

| Category | What it covers | Where it is recorded |
|---|---|---|
| One-time implementation | Build, setup, migration, and one-off fees, from the plan's effort figures and a stated rate | Cost model, from plan effort |
| Recurring fixed | Baseline hosting, domains, subscriptions, minimum plan charges | Cost model |
| Recurring variable | Usage-based compute, storage, data transfer, message or API calls, per-transaction third-party fees | Cost model, with the usage basis |
| Operations and maintenance | Upgrades, dependency updates, incident handling, support, and who carries them | Cost model and plan tasks |
| Unit cost | Total cost divided by a defined denominator (per active user, per booking, per transaction) | Cost model |

## Business and technical split

- **PRD:** business-level cost constraints only: a confirmed ceiling with its period and approver, who pays, and any cost-related business measure the owner supplies. No provider names, price lists, or infrastructure choices.
- **Technical definition:** link the cost model at `docs/engineering/cost-model.md` ([template](../assets/templates/cost-model.md)), which holds options, unit costs, and scenarios. Each choice with a recurring cost is an ADR.
- **Plan:** cost-gated tasks, decision points, and paid-spend gates.

## Record each cost line

Each line has a `COST-NNN` ID and states:

- **item and category**, and whether it is one-time, recurring fixed, recurring variable, operations, or unit cost;
- **unit and period**, as the price source uses them (for example per month, per unit of storage per month, or per 1,000 calls);
- **denominator** for any unit cost: for example active users in the month versus registered users, or which events count as a transaction;
- **currency**, never assumed; convert only when the user asks, recording the rate source and date;
- **price source and date**: official pricing or a user-supplied quote, with plan, region, and the date retrieved; taxes, fees, and discounts are included only when stated;
- **usage assumption and its source**: the user, a measurement, or an explicit assumption;
- **confidence**: high (current official price for confirmed usage), medium (official price, assumed usage), or low (estimate or unofficial source);
- **status** (confirmed, assumed, or unknown) and **owner**.

Verify current prices in authoritative documentation when the agent can access it. Otherwise record the line as unknown with the source to check. Do not use prices from memory as current.

## Scenarios

Use scenarios only when each has its usage assumptions stated and sourced. Label them illustrative, not forecasts. Scenario outputs link to the `COST` lines they use; never present a scenario without its basis or claim a saving that no source supports.

## Discovery questions

Ask only what changes a decision, in the normal batch rules:

- Is there a budget ceiling? Amount, currency, period, and who approves it.
- Who pays recurring costs, and is there a cap on monthly or annual commitments?
- What usage basis applies, in the PRD's own terms (users, active share, transactions), and is it known, assumed, or unknown?
- Who carries operations and maintenance, and what support is expected?
- Are free tiers or trials acceptable? Default: no paid purchase is authorised.

Record each answer with its source. Unanswered items stay `unknown` with an owner and revisit point.

## Planning and decision points

- Link each cost task to its `REQ` IDs (for example a confirmed ceiling) and to the affected `COST` IDs, and state the evidence: price source and date, the usage basis, and the approving decision.
- Add a decision point before selecting a paid service or plan, before any recurring commitment, before deployment, and whenever usage or the denominator changes. Route each to the user and record it in an ADR when it is technical.
- Paid-spend gate: a task that would create a paid account, buy a plan, start a billed trial, or commit spend stops and reports a blocker unless the user explicitly authorised that spend. In autonomous mode, record it as a blocker ([autonomous mode](autonomous-mode.md)).
- Estimate effort only with capacity assumptions recorded in the plan. The cost model converts effort to cost only with a stated rate and currency.

## Limits

- Never invent prices, budgets, usage, unit targets, savings, or return on investment.
- Do not select a provider or stack on cost alone. Present comparisons only when requested, and keep recommendations separate from user preferences.
- A ceiling or unit-cost target becomes a number only when the owner confirms it with its source, period, and denominator.

## Completion

Each material cost category has lines with the fields above, or an explicit unknown with owner and revisit point. Scenarios state their assumptions. The PRD holds business constraints only; the technical definition links the cost model; the plan has cost-gated tasks, decision points, and paid-spend gates. No cost figure appears without a source and date.
