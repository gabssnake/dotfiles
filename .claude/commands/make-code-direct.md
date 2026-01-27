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
- Sometimes things can be made more direct by inlining logic instead of passing
    stuff around which adds indirection

Make the changes directly, don't just recommend. Favor readability over brevity when they conflict, but remove genuinely redundant code.

If multiple files need review, use parallel agents to process them concurrently.

$ARGUMENTS
