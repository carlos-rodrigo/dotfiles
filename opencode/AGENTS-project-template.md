# AGENTS.md

> Project-specific context. Follows methodology from global AGENTS.md.

## Project Overview

- **Name**: [Project name]
- **Purpose**: [One-line description]
- **Primary Language**: [Language + version]

---

## Tech Stack

- [Framework + version]
- [Database + version]
- [Key dependencies]

---

## Commands

```bash
# Build
[your build command]

# Test (all)
[your test command]

# Test (single file) — prefer this for speed
[your single file test command]

# Lint
[your lint command]

# Type check
[your type check command]

# Dev server
[your dev command]
```

---

## Project Structure

```
src/
  core/       # Core business logic
  api/        # API endpoints
  utils/      # Shared utilities
tests/
  unit/       # Unit tests
  integration/# Integration tests
docs/         # Documentation
```

---

## Key Files

| File | Purpose | Sensitivity |
|------|---------|-------------|
| `src/core/auth.ts` | Authentication logic | HIGH — do not modify without approval |
| `src/config.ts` | App configuration | MEDIUM |
| `src/db/schema.ts` | Database schema | HIGH — migrations required |

---

## Architecture Decisions

- **[Pattern name]**: [Why we use it, where it applies]
- **[Pattern name]**: [Why we use it, where it applies]

---

## Domain Knowledge

- **[Business concept]**: [Explanation]
- **[Business rule]**: [Explanation]
- **[Important invariant]**: [What must always be true]

---

## Code Style

- **Naming**: [camelCase for functions, PascalCase for classes, etc.]
- **Imports**: [Ordering rules]
- **Error handling**: [Pattern used]
- **Comments**: [When to use, when not to]

---

## Project-Specific Constraints

**DO NOT**:
- [Thing to avoid in this project]
- [Another thing to avoid]

**ALWAYS**:
- [Required practice for this project]
- [Another required practice]

---

## Testing Requirements

- All new features require tests
- Minimum coverage: [X%]
- Test naming: `should [expected behavior] when [condition]`

---

## PR Guidelines

- Branch naming: `[type]/[short-description]` (e.g., `feat/user-auth`)
- Commit format: `[type]: [description]`
- Required checks: [list of CI checks that must pass]
