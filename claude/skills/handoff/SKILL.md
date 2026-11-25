---
name: handoff
description: Compact the current conversation into a handoff document for another agent to pick up.
argument-hint: 'What will the next session be used for?'
user_invocable: true
---

# Handoff Skill

Write a handoff document summarising the current conversation so a fresh agent can continue the work.

## Where to save

Save the file to the OS temporary directory (`$TMPDIR` on macOS/Linux, `%TEMP%` on Windows), **not** inside the current workspace. Name it something descriptive, e.g. `handoff-<short-slug>-<YYYY-MM-DD>.md`.

## What to include

1. **Project context** — repo, branch, what the project does (one sentence).
2. **What we accomplished** — bullet list of completed work in this session.
3. **Current state** — where things stand right now (files changed, tests passing/failing, open questions).
4. **Next steps** — concrete, actionable items the next agent should tackle.
5. **Suggested skills** — list skills from the available-skills registry that the next agent should invoke (e.g. `gh-cli` before any GitHub calls, domain-specific skills for the work ahead). Explain briefly why each is relevant.
6. **References** — paths or URLs to any relevant artifacts (PRDs, plans, ADRs, issues, diffs, Confluence pages). Do **not** duplicate their content — link instead.

## What to omit / redact

- API keys, passwords, tokens, session cookies.
- Personally identifiable information beyond names/roles that are already public in the repo.
- Content already captured verbatim in the referenced artifacts — a path or URL is enough.

## Tailoring to arguments

If the user passed arguments (via `argument-hint`), treat them as a description of what the next session will focus on and weight the **Next steps** and **Suggested skills** sections toward that focus. Trim sections unrelated to the stated goal.

## Format

Use clean Markdown. Keep the total document under ~400 lines. Prefer bullet lists over prose for scannability.

After writing the file, tell the user the full path so they can share it with the next session.
