---
description: Review Node.js + Bash projects for cross-platform portability
allowed-tools: Read, Glob, Grep, Bash
---

Review this project for portability issues when combining Node.js with Bash scripts.

## Bash compatibility (macOS ships Bash 3.2)

Check all .sh files for Bash 4+ features that break on macOS default shell:

**Bash 4.0+ (avoid):**
- `declare -A`, `local -A`, `typeset -A` (associative arrays)
- `mapfile`, `readarray`
- `coproc`
- `|&` (pipe stderr)

**Bash 4.3+ (avoid):**
- `declare -n`, `local -n`, `typeset -n` (namerefs)

**Bash 4.4+ (avoid):**
- `@Q`, `@E`, `@P`, `@A` (parameter transformation)

**Portable alternatives:**
- Use word-splitting strings instead of arrays when simple iteration suffices
- Use `#!/usr/bin/env bash` shebang (not `#!/bin/bash`)
- Use `[ ]` or `[[ ]]` tests (both work in 3.2)
- Use `command -v` instead of `which`

Don't add a useless comment about compatibility, like:
`# bash 3.2 compatible (macOS default)`

## Script structure

Check that scripts follow these practices:

- `set -euo pipefail` at the top (strict mode)
- Requirements check function that verifies: node, node_modules, any other tools
- Clear error messages with fix suggestions
- Proper exit codes (non-zero on failure)
- Wrap cohesive chunks of code into functions and use a `main()` function to init
- Usage comment header with relevant example

## Node.js setup

Check README includes these exact setup instructions:

```bash
brew install n
n <version>
node --version  # verify
```

```bash
npm config set registry https://repox.jfrog.io/artifactory/api/npm/npm
npm login --auth-type=web
```

```bash
npm ci
```

## Output

List each issue with file:line and provide the fix.

$ARGUMENTS
