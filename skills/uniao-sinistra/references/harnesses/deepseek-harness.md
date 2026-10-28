# DeepSeek Harness

- **Aliases:** DeepSeek Harness, `dsh`
- **Executable:** `dsh`
- **Official documentation:** [CLI documentation](https://github.com/deepseek-ai/deepseek-harness/blob/master/apps/cli/README.md) (checked 2026-10-27)
- **Mode:** `dsh --profile headless "<job>"` runs a fresh persisted session and exits.
- **Context handoff:** Put task and plan path in job prompt; profile behavior is configurable.
- **Model, effort and permissions:** Profile-based configuration; inspect selected profile for model and tools. Headless profile required.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `dsh --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
# Replace placeholders with quoted values and flags verified for the installed version
dsh <documented-non-interactive-options> <task-and-plan-reference>
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
