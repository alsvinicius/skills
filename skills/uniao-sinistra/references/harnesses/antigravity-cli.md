# Antigravity CLI

- **Aliases:** Antigravity CLI, `agy`
- **Executable:** `agy`
- **Official documentation:** [CLI documentation](https://antigravity.google/docs/cli/headless/) (checked 2026-10-27)
- **Mode:** `agy -p <prompt>`; text, JSON and stream-json output formats.
- **Context handoff:** Provide plan path in prompt; use documented prompt/context options.
- **Model, effort and permissions:** Model and agentMode settings documented; shell actions may remain Ask/soft-denied headlessly.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `agy --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
agy -p "<task; include the plan path>" --output-format text
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
