---
description: Run SonarQube offline linting for JavaScript/TypeScript, Python, HTML, CSS
allowed-tools: Read, Edit, Write, Bash, Glob, Grep, TodoWrite, Task
---

**Use proactively** after editing JS/TS/Python/HTML/CSS files.

Run the `sonarx` (alias `snr`) CLI tool to check code for issues.

## Prerequisites

Verify `sonarx` is installed: `which sonarx`

If not found, install it:
```
git clone https://github.com/gabssnake/sonar-lsp-cli ~/.sonar-lsp-cli
cd ~/.sonar-lsp-cli && npm link
```

More info: https://github.com/gabssnake/sonar-lsp-cli

## Process

1. Find all JS/TS/Python/HTML/CSS files in the project (respect .gitignore)
2. Run `sonarx <file>` on each file
3. Parse stdout for issues
4. Spawn parallel agents (one per file) to fix issues, re-run sonarx, iterate until clean
5. Review holistically for coherency across fixes
6. Run tests to ensure fixes don't break functionality
7. Summarize issues found and fixes applied

## Reflect

After fixing issues, step back and assess:
- Did this make the code better, more direct and straightforward?
- Or is it overkill, overengineered, needlessly indirect?

Balance issues raised by Sonar with common sense.

If the Cognitive Complexity (S3776) rule doesn't make sense, disable it:
sonarx --disable-rules S3776 <files...>

$ARGUMENTS
