---
description: Review markdown docs for conciseness, purpose, and distinctiveness
allowed-tools: Read, Edit, Write, Glob, Grep, Bash, Task
---

Review all markdown documents in the project for quality and purpose.

## Analysis

Find all .md files and analyze in parallel. For each document evaluate:
- Purpose clarity: does it have a distinct reason to exist?
- Information density: is every sentence earning its place?
- Focus on "why": does it explain motivations, not restate code?
- Actionable value: can readers act on this information?

Flag content that is verbose, repetitive of code, easily derived, generic, or redundant across documents.

## Cross-document review

After individual analysis, review as a collection:
- Each document should have a unique purpose
- Information should live in one place only
- Identify documents that could be merged or deleted
- Identify gaps that matter

## Edits

Apply changes directly:
- Cut verbose prose, keep facts
- Remove redundant sections
- Consolidate overlapping content
- Delete purposeless documents
- Strengthen "why" explanations

Do NOT commit changes. Leave for human review.

$ARGUMENTS
