# Cursor CLI

- **Aliases:** Cursor CLI, `agent`
- **Executable:** `agent`
- **Official documentation:** [CLI documentation](https://cursor.com/docs/cli/headless) (checked 2026-10-27)
- **Mode:** `agent -p <prompt> --output-format text`; print mode.
- **Context handoff:** Pass plan path in prompt.
- **Model, effort and permissions:** `--force` / `--yolo` enables file modifications in print mode; use only when the plan authorizes it. Model flag is documented.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `agent --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
# Replace placeholders with quoted values and flags verified for the installed version
agent <documented-non-interactive-options> <task-and-plan-reference>
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
