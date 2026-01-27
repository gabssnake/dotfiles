---
description: Run SonarQube offline linting for JavaScript/TypeScript
allowed-tools: Read, Edit, Write, Bash, Glob, Grep, TodoWrite, Task
---

**Use proactively** after editing JS/TS files.

Run the `sonarx` (alias `snr`) CLI tool to check JavaScript/TypeScript code for issues.

## Prerequisites

Verify `sonarx` is installed: `which sonarx`

If not found, install it:
```
git clone https://github.com/gabssnake/sonar-lsp-cli ~/.sonar-lsp-cli
cd ~/.sonar-lsp-cli && npm link
```

More info: https://github.com/gabssnake/sonar-lsp-cli

## Process

1. Find all JS/TS files in the project (respect .gitignore)
2. Run `sonarx <file>` on each file
3. Parse stdout for issues
4. Spawn parallel agents (one per file) to fix issues, re-run sonarx, iterate until clean
5. Review holistically for coherency across fixes
6. Run tests to ensure fixes don't break functionality
7. Summarize issues found and fixes applied
8. Offer to commit the changes

$ARGUMENTS
