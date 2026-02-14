---
description: Reconstruct design rationale from git history, code, and conversations
allowed-tools: Read, Glob, Grep, Bash, Task
---

Answer the question: why is this project shaped this way?

Most analysis looks at the current snapshot. This looks at evolution: what was tried, what was abandoned, what survived, and why.

## Sources

Mine three sources in parallel:

**Git history.** Commits tell the story of what changed and when. Look for pivots: commits with "revert", "remove", "simplif", "instead", "rather than". Find rapid iteration patterns (same files touched repeatedly). Identify consolidation points (large refactors, renames). List abandoned branches.

**Codebase.** Comments with "why", "must", "never", "invariant" encode constraints. Naming conventions and structural patterns encode decisions. README, CLAUDE.md, and docs/ encode intent.

**Claude sessions.** Search `~/.claude/projects/` for trade-off discussions: "instead of", "rather than", "alternative", "rejected". Extract debates, rejected approaches, and moments where understanding shifted. Skip this source if no sessions exist.

## Output

Write to DESIGN.md (or path from $ARGUMENTS if provided).

Structure around what matters:

**Invariants**: what must never change, and why. One list, not categories.

**Design debates**: the decisions that shaped the project. For each:
- Considered: alternatives explored
- Discarded: why rejected
- Chosen: what was selected
- Consequence: tradeoffs accepted

**Tradeoffs**: tensions the project lives with, and how they're resolved.

| Tension          | Resolution       | Where documented |
| :--------------- | :--------------- | :--------------- |
| ...              | ...              | ...              |

Focus on structural decisions, not implementation details. Preserve the "why" behind decisions, not the "what."

$ARGUMENTS
