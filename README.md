# Codex skills

This repository contains reusable skills for Codex. Each skill has a `SKILL.md` entry point and may include references, templates, assets, and evaluation cases.

## Available skills

- [`product-dev-workflow` (root package)](./SKILL.md) — guide product discovery through an MVP-first implementation plan and authorised implementation.
- [`open-source-preparation/`](./open-source-preparation/SKILL.md) — audit and prepare an existing project for an understandable, privacy-conscious open-source release.

The `product-dev-workflow` skill remains at the repository root for compatibility with its existing installation path. The second skill is packaged in its own directory.

## Install for Codex

The examples below install both skills into the default Codex skills directory. Set `CODEX_HOME` if your Codex setup uses a different home directory. The default location follows the Codex skill setup guidance.

```sh
skills_dir="${CODEX_HOME:-$HOME/.codex}/skills"
mkdir -p "$skills_dir/product-dev-workflow" "$skills_dir/open-source-preparation"
cp SKILL.md "$skills_dir/product-dev-workflow/"
cp -R assets references evals "$skills_dir/product-dev-workflow/"
cp -R open-source-preparation/. "$skills_dir/open-source-preparation/"
```

Restart or refresh Codex if it does not discover the new skills. The repository does not include an installer or automatically install files when cloned. For the skill package format and other host integrations, see [OpenAI's skill documentation](https://developers.openai.com/api/docs/guides/tools-skills).

Start with the selected skill's `SKILL.md`; it links to the supporting references and templates bundled with that skill.

## Repository guide

- [Tutorial: try a skill from this repository](docs/tutorials/try-a-skill.md)
- [How to add or update a skill](docs/how-to/update-a-skill.md)
- [Repository reference](docs/reference/repository-layout.md)
- [Why the skills are packaged this way](docs/explanation/packaging.md)
- [Licence and redistribution status](docs/reference/licensing-and-redistribution.md)
- [Contributing](CONTRIBUTING.md)

## Licence

All repository content is licensed under the MIT License. See [LICENSE](LICENSE). The repository owner confirmed that the licence applies to all content in this repository.
