# Repository guidance

## Project map

- `prd/` contains the `product-dev-workflow` skill, including its entry point, assets, references, templates, and evaluation cases.
- `open-source-preparation/` contains the separately packaged `open-source-preparation` skill and its supporting files.
- `docs/` explains how to use and maintain this repository; it is not a substitute for either skill's operating instructions.

## Editing

- Keep each skill's `SKILL.md` as its entry point. Preserve relative links and include required references, templates, assets, and eval cases with the skill that uses them.
- Ground operational instructions in the actual skill resources. Do not add credentials, personal data, machine-specific paths, or private prompts.
- Keep documentation in British English, consistent with the bundled documentation guidance, and update links when paths change.
- Do not invent a licence, evaluation result, installer, or supported runtime behaviour.

## Validation

- Review the full diff and check that links and referenced files resolve.
- Parse each skill's `evals/evals.json` as JSON with Python's standard library when evaluation files change. No evaluation runner is bundled in this repository.
- No build or runtime command is defined; do not claim that an evaluation suite passed unless one is added and run.

## Completion

Summarise changed skill paths, checks actually performed, and unresolved licensing or redistribution questions. Keep personal data out of commits and pull request descriptions.
