# Repository layout reference

| Path | Purpose |
|---|---|
| `skills/product-dev-workflow/SKILL.md` | Entry point for the product workflow skill package. |
| `skills/product-dev-workflow/assets/templates/` | Templates used by `product-dev-workflow`. |
| `skills/product-dev-workflow/references/` | Supporting workflow instructions for `product-dev-workflow`. |
| `skills/product-dev-workflow/evals/evals.json` | Evaluation cases; no runner is included. |
| `skills/open-source-preparation/SKILL.md` | Entry point for the open-source preparation skill. |
| `skills/open-source-preparation/evals/evals.json` | Evaluation cases; no runner is included. |
| `skills/uniao-sinistra/SKILL.md` | Cross-harness orchestration protocol and progressive-disclosure entry point. |
| `skills/uniao-sinistra/references/harnesses/` | One Markdown reference per supported agent harness. |
| `docs/` | Repository tutorials, task guidance, reference, and explanation. |
| `README.md`, `AGENTS.md`, `CONTRIBUTING.md` | Repository overview, editing guidance, and contribution process. |
| `LICENSE` | MIT licence for repository content. |
| `docs/reference/licensing-and-redistribution.md` | Licence scope, audit findings, and redistribution guidance. |

## Environment and installation

The repository contains instructions and supporting files, not an application. It has no declared package dependencies, persistent user-data directory, package manifest, build system, or automated evaluation runner. Use requires an agent that supports the Agent Skills format. The tutorial shows how to copy a complete skill package into a host-selected skills directory; the format does not define that directory or guarantee identical behaviour across agents.

The [Agent Skills specification](https://agentskills.io/specification) defines a skill as a directory containing `SKILL.md` and optional supporting resources. Consult each agent's documentation for discovery paths, installation, and host-specific limitations.

Skills are plain-text instructions and supporting files. All repository content is licensed under MIT; see [licence and redistribution status](licensing-and-redistribution.md) for the audit scope and handling of future third-party material.

Local-only materials are not part of this repository's distributable content.
