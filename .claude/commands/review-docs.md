---
description: Review markdown docs and README for quality and purpose
allowed-tools: Read, Edit, Write, Glob, Grep, Bash, Task
---

Review all markdown documents in the project. Make them earn their existence.

## README

If no README.md exists, create one. If it exists, improve it.

Structure:
1. Title and one-liner: project name, single sentence describing what it does
2. What it does: bullet points of key capabilities (not how, just what)
3. Quick start: fastest path to seeing it work
4. Local setup: prerequisites, dependencies, commands

Guidelines:
- Short and pragmatic, facts not prose
- Code blocks for commands, concrete prerequisites with versions
- Verify referenced files exist and information is current
- Help someone returning after months to quickly re-orient

## All documents

Find all .md files and analyze in parallel. For each document:
- Does it have a distinct reason to exist?
- Is every sentence earning its place?
- Does it explain motivations, not restate code?
- Can readers act on this information?

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
