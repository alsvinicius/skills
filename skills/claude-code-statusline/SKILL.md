---
name: claude-code-statusline
description: Configure a Claude Code status line showing brand, user@host:cwd, git branch, model, context bar with absolute tokens and room before auto-compaction, 5h/7d limit bars, advisor model, cost, duration, and lines changed. Use when the user wants a Claude Code status line, statusLine setting, or a richer terminal status bar for Claude Code.
---

# Claude Code status line

`statusline.sh` is a bash script for Claude Code's `statusLine` setting. Claude Code pipes session JSON to it on stdin, and it prints one line.

## Install

1. Copy the script somewhere stable, for example `~/.claude/statusline.sh`, and make it executable:

   ```sh
   cp statusline.sh ~/.claude/statusline.sh
   chmod +x ~/.claude/statusline.sh
   ```

2. Add to `~/.claude/settings.json`:

   ```json
   {
     "statusLine": {
       "type": "command",
       "command": "~/.claude/statusline.sh"
     }
   }
   ```

Requires `jq` and a terminal with 24-bit colour.

## Configuration

- `CLAUDE_CODE_AUTO_COMPACT_WINDOW`: token count the "to compact" bar measures against (default `250000`). Set the same value used for auto-compaction.
- `CLAUDE_SETTINGS`: path to the settings file read for the advisor model (default `~/.claude/settings.json`).

## Notes

- The script reads JSON fields defensively. A segment stays hidden when its field is missing, so an unrecognised field name hides that segment rather than breaking the line.
- The JSON field names for token counts and rate limits (`context_window.total_input_tokens`, `context_window.context_window_size`, `rate_limits.five_hour.used_percentage`, `rate_limits.seven_day.used_percentage`) were not checked against the official schema. Verify them against the Claude Code docs before relying on those segments.
- Layout and colours were modelled on the text description of kcchien/claude-code-statusline; the screenshots were not reviewed.
