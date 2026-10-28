# Claude Code

- **Aliases:** Claude Code, `claude`
- **Executable:** `claude`
- **Official documentation:** [CLI documentation](https://code.claude.com/docs/en/headless) (checked 2026-10-27)
- **Mode:** `claude -p <prompt>`; documented print mode; combine with documented output-format and allowedTools as needed.
- **Context handoff:** Pass plan path in prompt or documented file context.
- **Model, effort and permissions:** Use `--model` where supported; effort via CLI/config; permissions via `--allowedTools`, never broad approval by default.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `claude --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
# Replace placeholders with quoted values and flags verified for the installed version
claude <documented-non-interactive-options> <task-and-plan-reference>
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
