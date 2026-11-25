#!/bin/bash
# Claude Code notification hook helper
# Reads hook JSON from stdin, sends a macOS notification via terminal-notifier
# with the correct app icon based on where Claude Code is running.
#
# Usage:
#   echo '<json>' | notify.sh
#   echo '<json>' | notify.sh --permission

INPUT=$(cat)
SID_FULL=$(echo "$INPUT" | jq -r '.session_id // empty')
SID=${SID_FULL:0:8}
NAME=""
[ -n "$SID_FULL" ] && NAME=$(jq -r --arg s "$SID_FULL" 'select(.sessionId==$s) | .name // empty' ~/.claude/sessions/*.json 2>/dev/null | head -1)
TITLE="Claude Code [${NAME:-${SID:-claude}}]"

case "$TERM_PROGRAM" in
  iTerm.app) SENDER="com.googlecode.iterm2" ;;
  vscode)    SENDER="com.microsoft.VSCode" ;;
  ghostty)   SENDER="com.mitchellh.ghostty" ;;
  *)         SENDER="" ;;
esac

if [ "$1" = "--permission" ]; then
  TOOL=$(echo "$INPUT" | jq -r '.tool_name // "unknown"')
  DETAIL=$(echo "$INPUT" | jq -r '.tool_input | to_entries[0] | "\(.key): \(.value | tostring | .[0:60])"' 2>/dev/null || echo "")
  ARGS=(-title "$TITLE" -subtitle "Permission needed: $TOOL" -message "$DETAIL" -sound Ping)
else
  MSG=$(echo "$INPUT" | jq -r '.message // "Needs your attention"')
  ARGS=(-title "$TITLE" -message "$MSG" -sound Glass)
fi

# Fall back to the launching app's bundle id (e.g. inside tmux, where TERM_PROGRAM=tmux)
[ -z "$SENDER" ] && [ "$__CFBundleIdentifier" = "com.mitchellh.ghostty" ] && SENDER="$__CFBundleIdentifier"

# -sender sets the icon; -activate focuses the app when the notification is clicked
# terminal-notifier 3.x removed -sender/-appIcon (icon always comes from terminal-notifier itself),
# so only -activate is used: it focuses the app when the notification is clicked
[ -n "$SENDER" ] && ARGS+=(-activate "$SENDER")

# If running inside tmux, clicking the notification also switches to this pane's session/window/pane
if [ -n "$TMUX" ] && [ -n "$TMUX_PANE" ]; then
  TMUX_BIN=$(command -v tmux)
  SOCK=${TMUX%%,*}
  T="$TMUX_BIN -S $SOCK"
  TARGET=$($T display-message -p -t "$TMUX_PANE" '#{session_name}:#{window_id}' 2>/dev/null)
  if [ -n "$TARGET" ]; then
    CMD="$T switch-client -t '${TARGET%%:*}' \\; select-window -t '${TARGET#*:}' \\; select-pane -t '$TMUX_PANE'"
    [ -n "$SENDER" ] && CMD="open -b $SENDER; $CMD"
    ARGS+=(-execute "$CMD")
  fi
fi

terminal-notifier "${ARGS[@]}"
