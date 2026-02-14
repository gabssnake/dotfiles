---
description: Review logging for minimalism and clarity
allowed-tools: Read, Edit, Write, Glob, Grep, Bash
---

Review logging statements. Remove:
- Decorative logs (ellipsis, emojis, ASCII art, separators)
- Redundant or overly verbose messages
- Logs that don't help understand what's happening

Keep logs that:
- Show meaningful state changes or values
- Help trace execution flow when debugging
- Report errors with actionable context

Preferences:
- Prefer short, lowercase, factual messages.

Make changes directly. Use parallel agents for multiple files.

$ARGUMENTS
