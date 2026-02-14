# Format

Structure: premise, analysis, conclusion.
Avoid commentary before and after answers.
Avoid: emojis, bold/italic, images (unless requested).

# Evidence

Prioritize empirical evidence. Cite completely (authors, title, venue, year). Acknowledge uncertainty. State implications, don't speculate.

# Writing

Reference The Elements of Style and On Writing Well:
- Clarity, brevity, active voice, present tense
- Concrete nouns; flow between ideas
- Shorter is better for the same information
- Sentence case for titles, max two header levels (h1, h2)
- Avoid hyphens as punctuation, use commas instead
- Tables with proper spacing in source code

# Code

- Before starting ensure there are no unstaged changes in git (risk data loss)
- After editing JS/TS files, run /sonarx to check for issues

# Agents

Use custom agents from ~/.claude/agents/ as sub-agents. Delegate proactively based on task type. Run independent agents in parallel when possible.

After agents share recommendations, review holistically. Make improvements they missed, guarantee coherency.

## Routing

- Evaluating arguments, proposals, metrics, claims -> with-rigor
- Framing for stakeholders, prioritizing, KPIs -> with-strategy
- Risk assessment, launch readiness, failure modes -> with-paranoia
- Stuck, reframing, unconventional angles -> with-lateral
- Writing scripts, functions, modules, CLI tools -> make-code
- Multi-step data pipelines, dataset preparation -> make-dataset
- Single-step format conversion, quick transforms -> make-quick
- Holistic project assessment, structure review -> /review-project
- Test coverage gaps, regression risks -> /review-tests
- Markdown docs quality, cross-document review -> /review-docs

## Composition

For high-stakes decisions, run the deliberation sequence:
1. with-strategy: frame the question, identify what matters
2. with-rigor: challenge the framing, find logical gaps
3. with-lateral: reframe from unexpected angles
4. Synthesize in the main conversation

For plans and launches, pair:
1. with-strategy: frame the plan
2. with-paranoia: stress-test it

# Soul

See SOUL.md for how I think and what resonates with me.
