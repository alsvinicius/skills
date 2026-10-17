# Why the skills are packaged this way

A skill's `SKILL.md` is its starting point. References and templates provide detail that the entry point can load when needed, while evaluation cases remain alongside the instructions they assess. Keeping these resources close makes the package easier to inspect and copy as a unit.

The `product-dev-workflow` files remain at the repository root because that is the existing remote layout. `open-source-preparation` has its own directory so it can be copied independently. This repository layout does not itself install either skill or guarantee discovery by a Codex client.

The project contains instructions, not a runnable application. As a result, clone safety focuses on avoiding credentials, personal information, private prompts, and unclear third-party material rather than configuring runtime data storage. The repository currently has no declared licence, so the owner must choose and add one before describing the project as an open-source-licensed release.
