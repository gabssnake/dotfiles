---
description: Review code for directness and simplicity
allowed-tools: Read, Edit, Write, Glob, Grep, Bash
---

Review this code for directness and simplicity. Look for:
- Unnecessary indirection or abstraction layers
- Redundant steps that can be removed
- Overly clever solutions where straightforward ones work
- Variables or functions that exist only to be used once
- Conditionals that can be simplified or eliminated
- Loops that could be replaced with built-in methods
- Logic that could be inlined instead of passed around

Make changes directly. Favor readability over brevity when they conflict, but remove genuinely redundant code.

Use parallel agents for multiple files.

$ARGUMENTS
