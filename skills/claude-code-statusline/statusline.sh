#!/usr/bin/env bash
# Claude Code status line, styled after kcchien/claude-code-statusline.
# Segments: ◆ brand | user@host:cwd | branch* | [model] | ctx gradient bar % (used/max tok) (% to compact)
#           | 5h/7d limit bars | advisor | cost | duration | +added/-removed
# Reads session JSON on stdin. Field names are read defensively; missing fields are hidden.

input=$(cat)
J() { printf '%s' "$input" | jq -r "$1 // empty" 2>/dev/null; }

RST='\033[0m'; DIM='\033[2m'; BOLD='\033[1m'
BRAND='\033[38;2;114;102;234m'      # #7266EA
GREEN='\033[38;2;80;200;120m'
YELLOW='\033[38;2;230;200;60m'
RED='\033[38;2;230;80;80m'
CYAN='\033[38;2;90;200;230m'
MAGENTA='\033[38;2;190;120;230m'
BLUE='\033[38;2;100;150;255m'
SEP="${DIM} │ ${RST}"

# gradient_bar <pct> : 10 cells, 24-bit green -> yellow -> red by cell position
gradient_bar() {
  local pct=$1 filled i r g b t out="" cell
  pct=$(LC_NUMERIC=C printf '%.0f' "$pct" 2>/dev/null || echo 0)
  filled=$(( pct / 10 )); [ "$filled" -gt 10 ] && filled=10; [ "$filled" -lt 0 ] && filled=0
  for ((i=0; i<10; i++)); do
    t=$(( i * 100 / 9 ))              # 0..100
    if [ $t -lt 50 ]; then r=$(( 255 * 2 * t / 100 )); g=255
    else r=255; g=$(( 255 - 255 * 2 * (t - 50) / 100 )); fi
    b=60
    if [ $i -lt $filled ]; then cell="█"; else cell="░"; r=$(( r/3 + 40 )); g=$(( g/3 + 40 )); fi
    out+="\033[38;2;${r};${g};${b}m${cell}"
  done
  printf '%b%b' "$out" "$RST"
}

# pct_color <pct> : color for limit/context numbers
pct_color() { if [ "$1" -ge 80 ]; then printf '%b' "$RED"; elif [ "$1" -ge 60 ]; then printf '%b' "$YELLOW"; else printf '%b' "$GREEN"; fi; }

# fmt_tokens <n> : 200000 -> 200k, 1000000 -> 1M
fmt_tokens() {
  local n=$1
  if [ "$n" -ge 1000000 ]; then printf '%sM' $(( n / 1000000 ))
  elif [ "$n" -ge 1000 ]; then printf '%sk' $(( n / 1000 ))
  else printf '%s' "$n"; fi
}

cwd=$(J '.workspace.current_dir // .cwd'); [ -z "$cwd" ] && cwd="$PWD"
model=$(J '.model.display_name // .model.id // .model')
cost=$(J '.cost.total_cost_usd')
duration_ms=$(J '.cost.total_duration_ms')
added=$(J '.cost.total_lines_added')
removed=$(J '.cost.total_lines_removed')
ctx_pct=$(J '.context_window.used_percentage')
ctx_used=$(J '.context_window.total_input_tokens // .context_window.used_tokens')
ctx_max=$(J '.context_window.context_window_size // .context_window.size')
five_h=$(J '.rate_limits.five_hour.used_percentage')
seven_d=$(J '.rate_limits.seven_day.used_percentage')
advisor=$(jq -r ".advisorModel // empty" "${CLAUDE_SETTINGS:-$HOME/.claude/settings.json}" 2>/dev/null)

segs=()

# Brand + identity
segs+=("$(printf "${BRAND}◆${RST} ${GREEN}%s@%s${RST}:${BLUE}%s${RST}" "$(whoami)" "$(hostname -s)" "$cwd")")

# Git branch
if git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
  branch=$(git -C "$cwd" symbolic-ref --short -q HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  dirty=""; [ -n "$(git -C "$cwd" status --porcelain 2>/dev/null | head -n1)" ] && dirty="*"
  segs+=("$(printf "${MAGENTA}%s%s${RST}" "$branch" "$dirty")")
fi

# Model (with context size only when the name doesn't show it) and advisor, adjacent
if [ -n "$model" ]; then
  m="$(printf "${CYAN}%s${RST}" "$model")"
  if [ -n "$ctx_max" ]; then
    size=$(fmt_tokens "$ctx_max")
    case "$model" in *"$size"*) ;; *) m+=" $(printf "${DIM}(%s)${RST}" "$size")";; esac
  fi
  [ -n "$advisor" ] && m+=" $(printf "${MAGENTA}%s${RST} ${DIM}as advisor${RST}" "$advisor")"
  segs+=("$m")
fi

# Context bar, absolute tokens, and room before auto-compaction (window from CLAUDE_CODE_AUTO_COMPACT_WINDOW, default 250k)
if [ -n "$ctx_pct" ]; then
  pct_i=$(LC_NUMERIC=C printf '%.0f' "$ctx_pct")
  c="ctx $(gradient_bar "$pct_i") $(pct_color "$pct_i")${pct_i}%${RST}"
  if [ -n "$ctx_used" ] && [ -n "$ctx_max" ]; then
    c+=" $(printf "${DIM}(%s/%s tok)${RST}" "$(fmt_tokens "$ctx_used")" "$(fmt_tokens "$ctx_max")")"
  elif [ -n "$ctx_used" ]; then
    c+=" $(printf "${DIM}(%s tok)${RST}" "$(fmt_tokens "$ctx_used")")"
  fi
  W=${CLAUDE_CODE_AUTO_COMPACT_WINDOW:-250000}
  if [ -n "$ctx_used" ]; then used=$ctx_used
  elif [ -n "$ctx_max" ]; then used=$(( ${pct_i} * ctx_max / 100 )); else used=""; fi
  if [ -n "$used" ] && [ "$W" -gt 0 ]; then
    left=$(( (W - used) * 100 / W )); [ "$left" -lt 0 ] && left=0; [ "$left" -gt 100 ] && left=100
    c+=" $(printf "${DIM}to compact${RST} %s ${DIM}(%s%% left)${RST}" "$(gradient_bar $(( 100 - left )))" "$left")"
  fi
  segs+=("$c")
fi

# Rate limits, hidden when absent or zero
for pair in "5h:$five_h" "7d:$seven_d"; do
  label=${pair%%:*}; val=${pair#*:}
  [ -z "$val" ] && continue
  v=$(LC_NUMERIC=C printf '%.0f' "$val" 2>/dev/null || echo 0)
  [ "$v" -eq 0 ] && continue
  segs+=("$(printf "%s %s %s%s%%${RST}" "$label" "$(gradient_bar "$v")" "$(pct_color "$v")" "$v")")
done


# Cost: yellow, red above $10, dimmed when zero
if [ -n "$cost" ]; then
  cost_c=$(LC_NUMERIC=C printf '%.2f' "$cost" 2>/dev/null)
  if [ "$(LC_NUMERIC=C printf '%.0f' "$cost")" -ge 10 ]; then cc=$RED; else cc=$YELLOW; fi
  if [ "$cost_c" = "0.00" ]; then segs+=("$(printf "${DIM}\$0.00${RST}")")
  else segs+=("$(printf "${cc}\$%s${RST}" "$cost_c")"); fi
fi

# Duration, hidden at zero
if [ -n "$duration_ms" ]; then
  secs=$(( ${duration_ms%.*} / 1000 ))
  [ "$secs" -gt 0 ] && segs+=("$(printf "${DIM}%dm%02ds${RST}" $((secs/60)) $((secs%60)))")
fi

# Lines changed, hidden when zero
if [ "${added:-0}" -gt 0 ] || [ "${removed:-0}" -gt 0 ]; then
  segs+=("$(printf "${GREEN}+%s${RST}/${RED}-%s${RST}" "${added:-0}" "${removed:-0}")")
fi

out=""
for s in "${segs[@]}"; do
  [ -n "$out" ] && out+="$SEP"
  out+="$s"
done
printf '%b' "$out"
