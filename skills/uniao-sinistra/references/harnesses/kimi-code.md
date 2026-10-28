# Kimi Code

- **Aliases:** Kimi Code, `kimi`
- **Executable:** `kimi`
- **Official documentation:** [CLI documentation](https://www.kimi.com/code/docs/en/kimi-code-cli/reference/kimi-command.html) (checked 2026-10-27)
- **Mode:** `kimi -p <prompt>`; supports stream-json output.
- **Context handoff:** Use prompt with plan path; agent/session flags bind at session creation.
- **Model, effort and permissions:** Model via `-m`; agents via `--agent` / `--agent-file`; verify permissions in current CLI docs.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `kimi --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
# Replace placeholders with quoted values and flags verified for the installed version
kimi <documented-non-interactive-options> <task-and-plan-reference>
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
