---
description: Suggest new slash commands based on your usage patterns
allowed-tools: Bash, Read, Glob
---

Analyze the user's Claude Code history to identify recurring patterns and suggest new slash commands that would help automate their workflow.

First, verify requirements:

```bash
command -v jq >/dev/null 2>&1 && echo "jq: ok" || echo "jq: missing (install with: brew install jq)"
```

```bash
[ -f ~/.claude/history.jsonl ] && echo "history: ok ($(wc -l < ~/.claude/history.jsonl | tr -d ' ') lines)" || echo "history: missing"
```

If jq is missing or history file does not exist, stop and inform the user. Otherwise, proceed.

Get existing user commands to avoid suggesting duplicates:

```bash
ls ~/.claude/commands/*.md 2>/dev/null | xargs -I{} basename {} .md | sort
```

Gather data for analysis:

1. Find repeated or near-duplicate prompts:
```bash
jq -s '
[.[] | select(.display) | select(.display | length > 20) | .display | select(startswith("/") | not)] |
group_by(.) |
map(select(length > 1) | {prompt: .[0], count: length}) |
sort_by(-.count) |
.[:10]
' ~/.claude/history.jsonl
```

2. Find common prompt prefixes (first 50 chars):
```bash
jq -s '
[.[] | select(.display) | select(.display | length > 50) | .display | select(startswith("/") | not) | .[:50]] |
group_by(.) |
map(select(length > 1) | {prefix: .[0], count: length}) |
sort_by(-.count) |
.[:10]
' ~/.claude/history.jsonl
```

3. Extract action verbs and their frequency:
```bash
jq -s '
[.[] | select(.display) | .display | select(startswith("/") | not) | split(" ")[0] | ascii_downcase] |
group_by(.) |
map({verb: .[0], count: length}) |
sort_by(-.count) |
.[:20]
' ~/.claude/history.jsonl
```

4. Sample longer prompts to understand request patterns:
```bash
jq -s '
[.[] | select(.display) | select(.display | length > 100) | select(.display | startswith("/") | not) | .display] |
.[:30]
' ~/.claude/history.jsonl
```

5. Find prompts containing common workflow phrases:
```bash
jq -s '
[.[] | select(.display) | .display | select(startswith("/") | not)] |
{
  take_moment: [.[] | select(test("take a moment"; "i"))] | length,
  lets_review: [.[] | select(test("let.?s review"; "i"))] | length,
  lets_create: [.[] | select(test("let.?s create"; "i"))] | length,
  lets_update: [.[] | select(test("let.?s update"; "i"))] | length,
  lets_fix: [.[] | select(test("let.?s fix"; "i"))] | length,
  could_you: [.[] | select(test("could you"; "i"))] | length,
  help_me: [.[] | select(test("help me"; "i"))] | length,
  make_sure: [.[] | select(test("make sure"; "i"))] | length,
  based_on: [.[] | select(test("based on"; "i"))] | length,
  use_parallel: [.[] | select(test("parallel"; "i"))] | length
}
' ~/.claude/history.jsonl
```

Based on this data, identify patterns and suggest 3-5 new slash commands. For each suggestion:

## Suggested commands

For each command, provide:

### /command-name
**Pattern detected**: Describe the recurring pattern you found in the data with specific evidence (counts, examples).

**What it would do**: One sentence describing the command's purpose.

**Draft implementation**:
```markdown
---
description: Brief description
allowed-tools: List, Of, Tools
---

The prompt template here, using $ARGUMENTS where user input belongs.
```

## Selection criteria

Prioritize suggestions that:
- Address frequently repeated prompts (high count in duplicates)
- Automate multi-step workflows the user does manually
- Complement existing commands without overlapping
- Match the user's established naming conventions (look at their existing commands)

Do not suggest commands that:
- Duplicate existing user commands
- Are too specific to be reusable
- Are trivial one-liners

$ARGUMENTS
