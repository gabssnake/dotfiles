---
description: Create granular commits with conventional format
allowed-tools: Read, Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*), Bash(git log:*)
---

Review the current changes and create granular, logical commits using conventional commits format (feat, fix, refactor, docs, chore, etc.).

For each commit:
- Group related changes together
- Write a concise subject line following conventional commits
- Include a brief body explaining why the change was made, not just what

Prefer multiple small commits over one large commit. Each commit should represent a single logical change.

Important:
- You should prioritize reducing risk of data loss (accidentally deleting changes)
- Make sure there are not unstaged changes before doing any git reset
- Be extra safe to not lose information and changes

$ARGUMENTS
