# GitHub Copilot CLI

- **Aliases:** GitHub Copilot CLI, `copilot`
- **Executable:** `copilot`
- **Official documentation:** [CLI documentation](https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-programmatic-reference) (checked 2026-10-27)
- **Mode:** `copilot -p <prompt>` for programmatic invocation.
- **Context handoff:** Pass plan path in prompt.
- **Model, effort and permissions:** Use `--allow-tool` / `--deny-tool` minimally; `--allow-all-tools` grants blanket permissions. Model selection documented.
- **Result capture:** Capture stdout, stderr and process exit status. Use structured output only when its schema is documented; retain session IDs when emitted.
- **Limitations:** CLI flags and capabilities can change by version. Check `copilot --help` and the linked docs before relying on a flag; do not claim runtime validation unless executed locally.

## Invocation example

```sh
copilot -p "<task; include the plan path>" --output-format text
```

## Handoff notes

The executor must report files changed, checks run, blockers and any partial work. Preserve configured permission boundaries; do not assume that headless mode implies safe or broad approval.
