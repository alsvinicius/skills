# Agent Skills

This repository contains reusable skills in the open [Agent Skills format](https://agentskills.io/specification). Each skill is a portable directory with a `SKILL.md` entry point and may include references, templates, assets, and evaluation cases. Any agent that implements the format can use these packages; discovery and installation locations vary by host.

## Available skills

- [`skills/product-dev-workflow/`](./skills/product-dev-workflow/SKILL.md) — guide product discovery through an MVP-first implementation plan and authorised implementation.
- [`skills/open-source-preparation/`](./skills/open-source-preparation/SKILL.md) — audit and prepare an existing project for an understandable, privacy-conscious open-source release.
- [`skills/uniao-sinistra/`](./skills/uniao-sinistra/SKILL.md) — coordinate planning, CLI handoffs, execution and validation across coding agent harnesses.

Each skill is packaged in its own directory under `skills/`. The `product-dev-workflow` package keeps its internal skill name for trigger compatibility.

## Repository layout

```text
.
├── skills/
│   ├── product-dev-workflow/  # skill and resources
│   ├── open-source-preparation/ # skill and resources
│   └── uniao-sinistra/          # cross-harness orchestration skill
├── AGENTS.md
├── CONTRIBUTING.md
├── README.md
├── LICENSE
└── docs/
```

Local-only materials are excluded from this repository's distributable content.

## Install for an agent

Find the skills directory supported by your agent in its documentation, then copy any skill package into that directory. For example, set `AGENT_SKILLS_DIR` to the directory your agent scans and run these commands from the repository root:

```sh
test -n "$AGENT_SKILLS_DIR" || { echo "Set AGENT_SKILLS_DIR to your agent's skills directory" >&2; exit 1; }
mkdir -p "$AGENT_SKILLS_DIR/uniao-sinistra"
cp -R skills/uniao-sinistra/. "$AGENT_SKILLS_DIR/uniao-sinistra/"
```

Use the same pattern for either of the other packages. Some agents support project-level skills, links, or another installation mechanism; follow the host's documentation and refresh or restart it if needed. This repository does not include an installer or automatically install files when cloned. The [Agent Skills specification](https://agentskills.io/specification) defines the package format, not a universal installation path or identical behaviour across hosts.

Start with the selected skill's `SKILL.md`; it links to the supporting references and templates bundled with that skill.

## Repository guide

- [Tutorial: try a skill from this repository](docs/tutorials/try-a-skill.md)
- [How to add or update a skill](docs/how-to/update-a-skill.md)
- [Repository reference](docs/reference/repository-layout.md)
- [Why the skills are packaged this way](docs/explanation/packaging.md)
- [Contributing](CONTRIBUTING.md)

## Licence

Repository content is licensed under the MIT License. See [LICENSE](LICENSE).
