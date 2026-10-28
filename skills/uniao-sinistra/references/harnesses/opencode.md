# OpenCode

- **Aliases:** OpenCode, `opencode`
- **Executable:** `opencode`
- **Official documentation:** [CLI documentation](https://opencode.ai/docs/cli/) (checked 2026-10-27)
- **Mode:** `opencode run [options] <prompt>`; supports JSON output and file attachments.
- **Context handoff:** Use `-f <path>` / documented attachment options.
- **Model, effort and permissions:** `--model`, provider-specific `--variant`; `--auto` approves permissions broadly, so omit unless explicitly justified.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `opencode --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
opencode run --model <provider/model> --format json -f <plan-path> "<task>"
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
