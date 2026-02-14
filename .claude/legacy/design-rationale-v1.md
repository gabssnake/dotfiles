# design-rationale

Reconstruct design rationale by analyzing git history, codebase, and Claude conversations.

## Usage

/design-rationale [output-file]

- output-file: Path for generated document (default: DESIGN.md)

## Process

Run three exploration phases in parallel, then synthesize findings.

### Phase 1: Git History Analysis

Launch Explore agent to:

1. Get commit timeline: `git log --oneline -100`
2. Search for pivots: commits with "revert", "remove", "simplif", "instead", "rather than"
3. List abandoned branches: `git branch -a --no-merged`
4. Find rapid iteration patterns (multiple commits touching same files)
5. Identify consolidation points (large refactors, renames)

Extract: direction changes, abandoned approaches, evolution patterns.

### Phase 2: Codebase Structure Analysis

Launch Explore agent to:

1. Identify entry points and main abstractions
2. Find documentation: README, CLAUDE.md, docs/, comments with "why"
3. Look for naming conventions and consistency patterns
4. Identify constraints in code comments ("must", "never", "invariant")
5. Map data flow and dependencies

Extract: architectural constraints, naming contracts, structural patterns.

### Phase 3: Claude History Analysis

Launch Explore agent to:

1. Find project sessions in `~/.claude/projects/`
2. Search transcripts for "instead of", "rather than", "alternative", "rejected", "discarded"
3. Find trade-off discussions and debates
4. Identify "aha moments" where understanding shifted
5. Extract lessons learned and mistakes

Extract: considered alternatives, rejection reasons, design debates.

### Phase 4: Synthesis

Combine findings into structured document:

1. **Core invariants**: what must never change
2. **Key design debates**: considered/discarded/chosen/consequence format
3. **Theoretical invariants**: mental models that structure decisions
4. **Structural invariants**: architectural constraints
5. **Documented tradeoffs**: tensions and their resolutions (table)

## Output Format

```markdown
# Design Rationale

Purpose: preserve design decisions, invariants, and rationale for future evolution.

## Core Invariant

[The single most important constraint]

## Key Design Debates

### [Decision Name]
- Considered: [alternatives explored]
- Discarded: [why rejected]
- Chosen: [what was selected]
- Consequence: [tradeoffs accepted]

## Theoretical Invariants

### [Mental Model Name]
[Description of the conceptual constraint]

## Structural Invariants

1. [Constraint 1]
2. [Constraint 2]

## Documented Tradeoffs

| Tension | Resolution | Location |
|:--------|:-----------|:---------|
| [Conflict] | [How resolved] | [Where documented] |

## The N Invariants

1. [Summary of all invariants as numbered list]
```

## Guidelines

- Focus on structural decisions, not implementation details
- Identify patterns of "considered and discarded"
- Extract invariants from consistency patterns
- Note documented tradeoffs vs hidden compromises
- Preserve the "why" behind decisions, not just the "what"
