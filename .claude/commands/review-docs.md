---
description: Review markdown docs for conciseness, purpose, and distinctiveness
allowed-tools: Read, Edit, Write, Glob, Grep, Bash, Task
---

Review all markdown documents in the project for quality and purpose.

## Phase 1: Parallel Document Analysis

Find all .md files and analyze each in parallel using Task agents. For each document evaluate:

1. **Purpose clarity** - Does it have a clear, distinct reason to exist?
2. **Information density** - Is every sentence earning its place?
3. **Focus on "why"** - Does it explain motivations, not just restate code?
4. **Non-derivable content** - Does it provide context the code cannot?
5. **Actionable value** - Can readers act on this information?

Flag content that is:
- Verbose or padded with filler
- Repetitive of what code already shows
- Easily derived by reading the code
- Generic statements that add no insight
- Redundant across multiple documents

## Phase 2: Cross-Document Review

After individual analysis, review documents as a collection:

1. **Distinctiveness** - Each document should have a unique purpose
2. **No overlap** - Information should live in one place only
3. **Coherent structure** - Documents should complement, not duplicate
4. **Hierarchy** - Is there a logical organization?

Identify:
- Documents that could be merged
- Documents that could be deleted entirely
- Content that belongs elsewhere
- Gaps in documentation that matter

## Phase 3: Make Edits

Apply changes directly:
- Cut verbose prose, keep facts
- Remove redundant sections
- Consolidate overlapping content
- Delete empty or purposeless documents
- Strengthen "why" explanations
- Add missing critical context

## Principles

From Strunk & White and Zinsser:
- Omit needless words
- Use active voice, present tense
- Be specific and concrete
- Every word should work

What good documentation provides:
- Context code cannot express
- Motivations and design decisions
- Key insights and gotchas
- Strong technical foundations
- Actionable guidance

What to eliminate:
- Restating what code does
- Generic descriptions
- Marketing language
- Obvious information
- Repetition

Do NOT commit changes. Leave them for human review.

$ARGUMENTS
