#!/usr/bin/env python3
"""Report a Claude Code session's name and whether the user supplied it.

Usage: session-name.py [SESSION_ID]   (default: $CLAUDE_CODE_SESSION_ID)

Prints JSON: {session_id, name, user_named, source, normalized, ai_title}.
`custom-title` entries in the transcript are names the user set; `ai-title`
entries are auto-generated. The last entry of each kind wins. `agent-name`
just mirrors whichever title is current, so it is ignored.
"""
import glob, json, os, re, sys

sid = sys.argv[1] if len(sys.argv) > 1 else os.environ.get("CLAUDE_CODE_SESSION_ID", "")
if not re.fullmatch(r"[0-9a-f-]{36}", sid):
    sys.exit("error: no valid session id (pass one, or run inside Claude Code)")

paths = glob.glob(os.path.expanduser(f"~/.claude/projects/*/{sid}.jsonl"))

custom = ai = None
# Live-process record: nameSource is "user" (user-set), "auto" (generated) or
# "derived" (default dir-pid name). Covers a session whose transcript has not
# written its title yet, e.g. right after /clear.
for sf in glob.glob(os.path.expanduser("~/.claude/sessions/*.json")):
    try:
        rec = json.load(open(sf))
    except Exception:
        continue
    if rec.get("sessionId") == sid and rec.get("nameSource") == "user":
        custom = rec.get("name")
if not paths and not custom:
    sys.exit(f"error: no transcript or live record found for session {sid}")

lines = open(paths[0], errors="ignore") if paths else []
for line in lines:
    if '"custom-title"' not in line and '"ai-title"' not in line:
        continue
    try:
        d = json.loads(line)
    except Exception:
        continue
    if d.get("type") == "custom-title":
        custom = d.get("customTitle") or custom
    elif d.get("type") == "ai-title":
        ai = d.get("aiTitle") or ai

def normalize(s):
    """Drop the fork marker and a trailing ' (2)'-style duplicate suffix."""
    return " ".join(re.sub(r"\s*\(\d+\)$", "", s.replace("⑂", "")).split())

name = custom or ai
print(json.dumps({
    "session_id": sid,
    "name": name,
    "user_named": custom is not None,
    "source": "custom-title" if custom else "ai-title",
    "normalized": normalize(name) if name else None,
    "ai_title": ai,
}, ensure_ascii=False))
