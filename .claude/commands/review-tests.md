---
description: Review test coverage for gaps and regression risks
allowed-tools: Read, Glob, Grep, Bash
---

Looking at the project as a whole, identify obvious gaps in the tests that could be filled to avoid regressions on basic things or common problems.

Analyze:
- What functionality exists and what tests cover it
- Critical paths that lack coverage (happy paths, error handling, edge cases)
- Common failure patterns in this type of codebase that aren't tested
- Integration points between components that could break silently

Prioritize:
- High-impact, low-effort test additions
- Tests that would catch real regressions, not ceremonial coverage
- Basic sanity checks that are missing
- Functional tests that use the real pipeline, not heavy mocking

Output a concise list of specific test recommendations with rationale. Focus on practical value over completeness.

Use parallel agents to analyze different parts of the codebase concurrently.

$ARGUMENTS
