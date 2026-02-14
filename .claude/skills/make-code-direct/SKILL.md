---
description: Review code for directness, simplicity, and cleanliness
allowed-tools: Read, Edit, Write, Glob, Grep, Bash
---

Review this code ruthlessly. Make it direct, clean, and honest. Change everything that needs changing.

## Code structure

Strip indirection. If a variable exists only to be used once, inline it. If a function wraps another function without adding logic, delete it. If a conditional can be simplified, simplify it. If a loop can be a built-in method, use it.

Remove:
- Abstraction layers that serve no current purpose
- Redundant steps, dead paths, unreachable branches
- Overly clever solutions where straightforward ones work
- Configuration systems for things that should be constants
- Error handling for conditions that cannot occur

Favor readability over brevity when they conflict. But genuinely redundant code is never readable.

## Comments

Comments explain "why", never "what". If the code needs a comment to explain what it does, rewrite the code instead.

Remove:
- Comments that restate what the code does
- Comments describing obvious behavior
- TODO comments with no actionable context
- Commented-out code

Keep:
- Context not inferable from code alone
- Warnings about non-obvious gotchas
- Links to external references that explain constraints

Format: lowercase start, no trailing punctuation.

## Logging

Logs are for debugging and operations, not decoration.

Remove:
- Decorative logs (emojis, ASCII art, separators, ellipsis)
- Redundant or verbose messages
- Logs that don't help understand what happened

Keep:
- Meaningful state changes and values
- Errors with actionable context

Format: short, lowercase, factual.

## Inline documentation

If it exists, make it earn its place.

Remove:
- Verbose explanations that restate code
- Outdated descriptions that don't match behavior
- Type annotations and docstrings that add no information

Keep:
- Documentation that helps users use the code
- Explanations of why, not what

Use parallel agents for multiple files.

$ARGUMENTS
