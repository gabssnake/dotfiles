---
description: Review logging for minimalism and clarity
allowed-tools: Read, Edit, Write, Glob, Grep, Bash
---

Review logging statements in this code. Remove or fix:
- Decorative logs (ellipsis "...", emojis, ASCII art, separators)
- Redundant or overly verbose messages
- Logs that don't help understand what's happening
- Sentence case or shouting (prefer lowercase)

Keep logs that:
- Show meaningful state changes or values
- Help trace execution flow when debugging
- Report errors with actionable context

Prefer short, lowercase, factual messages. Make the changes directly, don't just recommend.

If multiple files need review, use parallel agents to process them concurrently.

$ARGUMENTS
