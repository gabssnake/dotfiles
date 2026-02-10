---
description: Verify recent commits match their messages
allowed-tools: Bash, Read
---

Review the last 10 commits and verify:

1. Each commit message accurately describes the changes
2. Changes are not mixed between commits (single responsibility)
3. No uncommitted work is left behind
4. Conventional commit format is used correctly

For each problematic commit, explain:
- What the message says
- What the changes actually do
- Whether a rebase/amendment is needed

List any uncommitted changes that should be committed.
