---
description: Verify data consistency with docs and queries
allowed-tools: Task, Read, Bash, Glob, Grep
---

Verify the generated data is consistent with its source:

1. Identify data files and their source queries/documentation
2. Check that query output matches documented expectations
3. Verify data shapes and types are as expected
4. Flag any anomalies, nulls, or outliers that seem wrong

Use parallel agents to verify multiple data sources simultaneously.

Report findings as a table:

| File | Source | Status | Issues |
|------|--------|--------|--------|
| ... | ... | ... | ... |

Focus on accuracy and coherence, not formatting.
