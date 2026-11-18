# Project harness and custom agents (`/harness`)

The harness is the project-specific scaffolding that guides the whole development flow: what agents read first, how work is validated, and how state and documentation stay current. Custom agents run inside it.

## Suggest the harness, then ask

After `/planning` is ready (or earlier if the user asks), suggest creating a project harness. Explain briefly what it contains and ask for approval. Do not create it without approval. In [autonomous mode](autonomous-mode.md), decide, create it, and record the decision. Record a declined or deferred harness in workflow state.

## Harness contents

Keep the harness small and grounded in the real project. Reuse what already exists (scripts, CI, task runners, hooks).

| Part | Purpose |
|---|---|
| `AGENTS.md` pointer | Entry point linking the product workflow, ADR index, Diátaxis index, and the harness. |
| `docs/harness/README.md` | Index of the harness and how the flow runs end to end. |
| `docs/harness/validation.md` | The real commands and evidence that count as validation (tests, lint, build, BDD suite). Do not invent commands; record how they are discovered when unknown. |
| `docs/harness/agents.md` | Which agents exist, what each may do, and when to use each. |
| Agent definitions | The three agents below, in the host's native agent location. |
| State and records | Workflow state, revision log, ADRs, autonomous decisions, and prototypes, with their paths. |

Do not add hooks, CI changes, or scripts that the project has not agreed to. Propose them and wait for approval, or record them as an autonomous decision.

## Custom agents

Create three agents from the templates in `assets/templates/agents/`, adapted to the project's stack, paths, and language:

- [Validator](../assets/templates/agents/validator.md): checks that work matches the specified REQ/JRN/DEC/TASK/BDD and runs project validation. Read-only apart from reporting; it never fixes what it finds.
- [Documenter](../assets/templates/agents/documenter.md): keeps Diátaxis docs, ADRs, indexes, workflow state, and revision log accurate and linked.
- [Executor](../assets/templates/agents/executor.md): runs the full planned project, task by task, through every phase, keeping artifacts current. See [full execution](full-execution.md).

Place each agent where the host expects custom agents. If the host or its location is unknown, ask once, or in autonomous mode use a neutral folder (`docs/harness/agents/`) and record the choice. Do not assume one host's file format or tool names; adapt the templates and keep the instructions identical in intent. Do not claim an agent was installed or invoked unless it actually was.

Each agent definition states: purpose, inputs to read, what it may change, what it must never do, the evidence it must report, and its stop conditions. Agents inherit the repository's `AGENTS.md`, the scope and authorisation limits in this skill, and the autonomous mode rules when active.

Record the agent definitions and their paths in workflow state and `docs/harness/agents.md`. Make an ADR for the choice of harness layout.
