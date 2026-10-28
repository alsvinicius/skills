# Oh My Pi

- **Aliases:** Oh My Pi, `omp`
- **Executable:** `omp`
- **Official documentation:** [CLI documentation](https://github.com/can1357/oh-my-pi/blob/main/docs/cli-reference.md) (checked 2026-10-27)
- **Mode:** `omp -p <prompt>`; `--mode json` for structured output.
- **Context handoff:** Prompt can reference plan; stdin is supported in print mode.
- **Model, effort and permissions:** Model flags/config are version-specific; `--plan-yolo` opts into unattended plan flow.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `omp --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
# Replace placeholders with quoted values and flags verified for the installed version
omp <documented-non-interactive-options> <task-and-plan-reference>
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
