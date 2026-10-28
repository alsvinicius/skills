# Kiro CLI

- **Aliases:** Kiro CLI, `kiro-cli`
- **Executable:** `kiro-cli`
- **Official documentation:** [CLI documentation](https://kiro.dev/docs/cli/headless/) (checked 2026-10-27)
- **Mode:** `kiro-cli chat --no-interactive <prompt>`; tool trust flags are available.
- **Context handoff:** Include plan path in prompt; select workspace/agent as documented.
- **Model, effort and permissions:** Use narrow `--trust-tools` values; V3 headless behavior and hooks may vary by version.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `kiro-cli --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
kiro-cli chat --no-interactive "<task; include the plan path>"
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
