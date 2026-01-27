---
description: Review and fix code comments
allowed-tools: Read, Edit, Write, Glob, Grep, Bash
---

Review comments in this code. Remove or flag:
- Comments that restate what the code does
- Comments describing obvious behavior
- Redundant inline comments

Keep only comments that:
- Explain "why" something is done a certain way
- Provide context the reader couldn't infer from the code alone
- Warn about non-obvious gotchas or constraints

Also fix comment formatting:
- Start comments with lowercase, not sentence case
- Remove trailing punctuation on single-line comments

Make the changes directly, don't just recommend.

If multiple files need review, use parallel agents to process them concurrently.

$ARGUMENTS
