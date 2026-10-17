# Repository layout reference

| Path | Purpose |
|---|---|
| `skills/product-dev-workflow/SKILL.md` | Entry point for the product workflow skill package. |
| `skills/product-dev-workflow/assets/templates/` | Templates used by `product-dev-workflow`. |
| `skills/product-dev-workflow/references/` | Supporting workflow instructions for `product-dev-workflow`. |
| `skills/product-dev-workflow/evals/evals.json` | Evaluation cases; no runner is included. |
| `skills/open-source-preparation/SKILL.md` | Entry point for the open-source preparation skill. |
| `skills/open-source-preparation/evals/evals.json` | Evaluation cases; no runner is included. |
| `docs/` | Repository tutorials, task guidance, reference, and explanation. |
| `README.md`, `AGENTS.md`, `CONTRIBUTING.md` | Repository overview, editing guidance, and contribution process. |
| `LICENSE` | MIT licence for repository content. |
| `docs/reference/licensing-and-redistribution.md` | Licence scope, audit findings, and redistribution guidance. |

## Environment and installation

The repository contains instructions and supporting files, not an application. It has no declared package dependencies, persistent user-data directory, package manifest, build system, or automated evaluation runner. Using the skills requires a Codex setup that loads local skills. The tutorial installs them under `${CODEX_HOME:-$HOME/.codex}/skills` and copies each skill's complete file set.

OpenAI's skill format uses a directory containing `SKILL.md` and optional supporting resources. See the [official skill documentation](https://developers.openai.com/api/docs/guides/tools-skills) for host-specific integrations and limitations.

Skills are plain-text instructions and supporting files. All repository content is licensed under MIT; see [licence and redistribution status](licensing-and-redistribution.md) for the audit scope and handling of future third-party material.

Local-only materials are not part of this repository's distributable content.
