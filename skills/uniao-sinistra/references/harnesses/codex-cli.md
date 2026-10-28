# Codex CLI

- **Aliases:** Codex CLI, `codex`
- **Executable:** `codex`
- **Official documentation:** [CLI documentation](https://developers.openai.com/codex/cli/) (checked 2026-10-27)
- **Mode:** `codex exec <prompt>` for non-interactive execution; consult current command help.
- **Context handoff:** Prompt can reference plan path; use supported input options for installed version.
- **Model, effort and permissions:** Model/config and sandbox/approval controls are documented; retain configured safeguards.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `codex --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
codex exec -s read-only "<task; include the plan path>"
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
