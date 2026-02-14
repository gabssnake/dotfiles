---
description: Analyze your Claude Code usage patterns and generate a profile
allowed-tools: Bash, Read
---

Analyze the user's Claude Code usage from ~/.claude/history.jsonl and provide a personalized assessment of how they use the tool.

First, verify requirements:

```bash
command -v jq >/dev/null 2>&1 && echo "jq: ok" || echo "jq: missing (install with: brew install jq)"
```

```bash
[ -f ~/.claude/history.jsonl ] && echo "history: ok ($(wc -l < ~/.claude/history.jsonl | tr -d ' ') lines)" || echo "history: missing"
```

If jq is missing or history file does not exist, stop and inform the user. Otherwise, proceed.

Run the following jq commands to gather statistics:

1. Basic counts and patterns:
```bash
jq -s '
[.[] | select(.display) | select(.display | length > 0)] |
{
  total: length,
  unique: (map(.display) | unique | length),
  slash_commands: [.[] | select(.display | startswith("/"))] | length,
  questions: [.[] | select(.display | test("\\?$"))] | length,
  lets_prefix: [.[] | select(.display | test("^let.?s"; "i"))] | length,
  pasted_content: [.[] | select(.display | test("Pasted|attached"; "i"))] | length
}
' ~/.claude/history.jsonl
```

2. Topic analysis:
```bash
jq -s '
[.[] | select(.display) | select(.display | length > 0) | .display] |
{
  review: [.[] | select(test("review"; "i"))] | length,
  commit: [.[] | select(test("commit"; "i"))] | length,
  test: [.[] | select(test("test"; "i"))] | length,
  read_understand: [.[] | select(test("read|look|understand"; "i"))] | length,
  create_build: [.[] | select(test("create|make|write|build"; "i"))] | length,
  fix_debug: [.[] | select(test("fix|debug|error"; "i"))] | length,
  improve_refactor: [.[] | select(test("improve|simplif|refactor|clean"; "i"))] | length,
  agent_parallel: [.[] | select(test("agent|parallel"; "i"))] | length,
  explain_help: [.[] | select(test("explain|help|how"; "i"))] | length
}
' ~/.claude/history.jsonl
```

3. Slash command breakdown (excluding /exit):
```bash
jq -s '
[.[] | select(.display) | select(.display | length > 0) | .display | select(startswith("/")) | select(test("^/exit"; "i") | not)] |
group_by(. | split(" ")[0]) |
map({cmd: .[0] | split(" ")[0], count: length}) |
sort_by(-.count) |
.[:15]
' ~/.claude/history.jsonl
```

4. Sample of longer prompts (to understand typical requests):
```bash
jq -s '
[.[] | select(.display) | select(.display | length > 50) | select(.display | startswith("/") | not) | .display] |
.[:20]
' ~/.claude/history.jsonl
```

Based on these statistics, write an assessment covering:

## Primary use cases
3-5 main ways the user employs Claude Code, with evidence from data.

## Working style
- Directive vs interrogative (commands vs questions ratio)
- Iterative vs big-bang (small steps vs large requests)
- Solo vs orchestrated (single tasks vs parallel agents)

## Tool adoption
Custom commands and how heavily they use them.

## Summary
One paragraph synthesis of usage patterns.

$ARGUMENTS
