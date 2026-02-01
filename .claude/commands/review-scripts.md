---
description: Critical review of scripts for simplicity and minimalism
allowed-tools: Read, Edit, Write, Glob, Grep, Bash
---

Step back and do a critical review of the scripts in this project. Focus on both Bash and JavaScript files.

Understand how the scripts work together, then assess:
- Opportunities to make things more straightforward and simpler
- Unnecessary code that can be removed
- Logic that can be consolidated without sacrificing clarity
- Over-engineering (abstractions, utilities, helpers that don't pay off)
- Unnecessary dependencies or complexity

Guidelines:
- Prefer plain and minimal implementations
- Accept some duplication over premature abstraction (DRY-ness vs decoupling tradeoff)
- Keep things decoupled and extensible
- Each script should be understandable on its own when reasonable
- Built-in solutions over external dependencies

Use parallel agents to review different scripts concurrently.
Don't make the changes directly, let's review the options together.

$ARGUMENTS
