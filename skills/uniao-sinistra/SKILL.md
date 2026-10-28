---
name: uniao-sinistra
description: Orchestrate work between coding agents through their CLIs. Use whenever one harness plans and hands implementation to another, across Claude Code, OpenCode, Codex CLI, Oh My Pi, Kimi Code, DeepSeek Harness, Devin CLI, Antigravity CLI, Kiro CLI, Copilot CLI, Pi Agent, Cursor CLI, or compatible future harnesses. Covers planning, explicit execution profiles, handoff, return to coordinator, and validation.
compatibility: Requires the CLI(s) selected for a task to be installed and authenticated. Each harness has different non-interactive and permission semantics; consult its reference before invocation.
---

# União Sinistra

Coordinate coding work between independent agent harnesses. Any available agent may coordinate or execute. A task is complete only after the coordinator reviews the executor's changes against acceptance criteria.

## Load only needed references

Identify the coordinator and executor from the request or current environment. Read only their modules under `references/harnesses/`. For a new harness, discover its module by name or aliases in that directory and read it before invocation. If none exists, inspect the installed CLI's help and official documentation, use only verified flags, and report that the harness is not yet documented; add a module using `assets/harness-module-template.md` when asked to extend support.

## Protocol

1. Clarify the deliverable and acceptance criteria from the user request and repository context. Do not ask again for settled details.
2. Create a concise Markdown plan in the user-designated location or a suitable task-local location. Record objective, context, ordered tasks, acceptance criteria, coordinator, executor per task, status, and execution log. Keep plans out of the repository unless they are a project deliverable.
3. Before each handoff, resolve and record an explicit execution profile: harness, executable, model, effort/reasoning setting, permission mode, working directory, timeout/budget if supported, and expected output. Use the user's requested values; otherwise inspect installed CLI/configuration and documented capabilities. Record `default/configured` when a value is inherited, and `unsupported` when a harness has no such control. Ask only when a missing decision materially affects the task or safe execution.
4. Pass the executor the task, relevant context and paths, acceptance criteria, scope constraints, and requested report format. Attach the plan using the harness's documented mechanism or include its path in the prompt. Do not assume that the executor has this skill installed.
5. Default to one coordinator and one executor per task. The executor returns findings and changes to the coordinator. Further delegation requires explicit permission in the plan; prevent recursive delegation and conflicting concurrent writes.
6. Capture the command, selected profile, timestamp, exit status, stdout/stderr location or concise result, files changed, checks run, and unresolved issues in the log. Do not treat a natural-language success claim as proof of completion. On failure or interruption, inspect repository/session state before retrying to avoid duplicating partial work.
7. The coordinator reviews the diff, runs appropriate acceptance checks, and updates task status to complete, blocked, or pending. Delegate focused corrections if needed, then validate again. Report completed work and remaining blockers accurately.

## Execution and permissions

Use the harness's documented non-interactive mode only after reading its module. Permissions are explicit per run: do not silently grant broad tool access or bypass an approval boundary. If the requested profile cannot be represented by the CLI, report the limitation and use the narrowest supported mode. Never put credentials in the plan, prompt, or execution log.

A CLI that is absent, unauthenticated, or unable to run headlessly is a blocker for that handoff. Do not substitute another harness or model without recording the change and confirming it is compatible with the user's intent.

## Adding harness support

Add a single Markdown module following `assets/harness-module-template.md`. Include aliases, executable, official documentation links and date checked, verified non-interactive invocation/context passing/output capture, model and effort controls, permission behavior, exit/failure semantics, and limitations. Mark uncertain or version-dependent behavior clearly. Adding a module must not require edits to this protocol.
