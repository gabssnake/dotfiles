---
description: Review test coverage for gaps and regression risks
allowed-tools: Read, Glob, Grep, Bash, Task
---

Identify gaps in tests that could prevent regressions.

Analyze:
- What functionality exists and what tests cover it
- Critical paths lacking coverage (happy paths, error handling, edge cases)
- Integration points that could break silently

Prioritize:
- High-impact, low-effort test additions
- Tests that catch real regressions, not ceremonial coverage
- Functional tests using real pipeline over heavy mocking

Output concise recommendations with rationale. Use parallel agents.

$ARGUMENTS
