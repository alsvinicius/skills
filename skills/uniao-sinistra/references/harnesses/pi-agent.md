# Pi Agent

- **Aliases:** Pi Agent, `pi`
- **Executable:** `pi`
- **Official documentation:** [CLI documentation](https://github.com/earendil-works/pi/tree/main/packages/coding-agent) (checked 2026-10-27)
- **Mode:** Inspect installed `pi --help` and official CLI docs before headless use; do not infer Oh My Pi flags.
- **Context handoff:** Use only documented input/context options for the installed version.
- **Model, effort and permissions:** Model/provider configuration is supported; verify non-interactive and permission controls locally before execution.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `pi --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
# Replace placeholders with quoted values and flags verified for the installed version
pi <documented-non-interactive-options> <task-and-plan-reference>
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
