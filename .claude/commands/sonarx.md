---
description: Run SonarQube offline linting for JavaScript/TypeScript
allowed-tools: Read, Edit, Write, Bash, Glob, Grep, TodoWrite
---

Run the `sonarx` (alias `snr`) CLI tool to check JavaScript/TypeScript code for issues.

## Prerequisites

First verify `sonarx` is installed:
```
which sonarx
```

If not found, install it:
```
git clone https://github.com/gabssnake/sonar-lsp-cli ~/.sonar-lsp-cli
cd ~/.sonar-lsp-cli
npm link
```

To uninstall:
```
npm unlink -g sonarx
rm -rf ~/.sonar-lsp-cli
```

More info: https://github.com/gabssnake/sonar-lsp-cli

## Process

1. Find all JavaScript/TypeScript files in the project (respect .gitignore)
2. Run `sonarx <file>` on each file
3. Parse the stdout for issues
4. Fix each issue in the code
5. Re-run sonarx until no issues remain
6. Run tests to ensure fixes don't break functionality
7. Provide a summary of issues found and fixes applied
8. Offer to commit the changes

$ARGUMENTS
