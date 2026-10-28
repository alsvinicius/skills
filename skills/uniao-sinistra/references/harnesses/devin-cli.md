# Devin CLI

- **Aliases:** Devin CLI, `devin`
- **Executable:** `devin`
- **Official documentation:** [CLI documentation](https://docs.devin.ai/cli/reference/commands) (checked 2026-10-27)
- **Mode:** `devin --print <prompt>` or `devin -p`; `--prompt-file` supported.
- **Context handoff:** Use `--prompt-file <path>` for handoff instructions.
- **Model, effort and permissions:** Supports `--model` and `--permission-mode`; `autonomous` requires sandbox. Print mode respects workspace trust.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `devin --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
# For an untrusted workspace in print mode, this flag skips the interactive trust prompt.
devin --respect-workspace-trust false --print "<task; include the plan path>"
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
