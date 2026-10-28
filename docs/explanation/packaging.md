# Why the skills are packaged this way

A skill's `SKILL.md` is its starting point. References and templates provide detail that the entry point can load when needed, while evaluation cases remain alongside the instructions they assess. Keeping these resources close makes the package easier to inspect and copy as a unit.

Each skill lives under `skills/` in its own directory and can be copied independently. The `product-dev-workflow` folder and skill use the same name. This repository layout does not install skills or guarantee discovery by any particular agent. The open Agent Skills format standardises package contents; each host controls its own discovery and activation behaviour.

The project contains instructions, not a runnable application. As a result, clone safety focuses on avoiding credentials, personal information, private prompts, and unclear third-party material rather than configuring runtime data storage. Skill files can influence an agent's planning and tool use, so inspect them before installing or enabling them; the host application's permissions still determine what the agent can do. The [Agent Skills specification](https://agentskills.io/specification) describes the package format and progressive disclosure model.

All repository content is now licensed under MIT, with the owner confirming that the licence applies to everything in the repository. See [licence and redistribution status](../reference/licensing-and-redistribution.md) for the audit scope and guidance on future third-party material.
