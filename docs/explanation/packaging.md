# Why the skills are packaged this way

A skill's `SKILL.md` is its starting point. References and templates provide detail that the entry point can load when needed, while evaluation cases remain alongside the instructions they assess. Keeping these resources close makes the package easier to inspect and copy as a unit.

The `product-dev-workflow` package lives in `prd/`, and `open-source-preparation` has its own directory. Both can be copied independently. The short `prd/` folder name does not change the internal `product-dev-workflow` skill name. This repository layout does not itself install either skill or guarantee discovery by a Codex client.

The project contains instructions, not a runnable application. As a result, clone safety focuses on avoiding credentials, personal information, private prompts, and unclear third-party material rather than configuring runtime data storage. Skill files can influence an agent's planning and tool use, so inspect them before installing or enabling them; the host application's permissions still determine what the agent can do. OpenAI describes skills as instruction bundles with supporting files in its [skill documentation](https://developers.openai.com/api/docs/guides/tools-skills).

All repository content is now licensed under MIT, with the owner confirming that the licence applies to everything in the repository. See [licence and redistribution status](../reference/licensing-and-redistribution.md) for the audit scope and guidance on future third-party material.
