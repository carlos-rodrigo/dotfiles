---
description: Commit, push, and create PR if needed
---

# Ship Command

Commit changes, push, and create a PR when appropriate.

## Workflow

### Step 1: Gather Context

Run these commands to understand current state:
- `git status` - see staged/unstaged changes
- `git branch --show-current` - get current branch name
- `git log -3 --oneline` - see recent commit style
- `git diff --staged` - see what will be committed (if anything staged)
- `git diff` - see unstaged changes

### Step 2: Validate Before Proceeding

**If no changes exist**: Stop and inform the user.

**If changes exist but context is unclear**: ASK the user:
- "What does this change do?" (WHAT)
- "Why is this change needed?" (WHY)

Do NOT guess. Do NOT proceed without understanding the purpose.

### Step 3: Stage and Commit

1. Stage relevant files (`git add`)
2. Create a commit with a **direct, short message** (imperative mood, no period)
   - Good: `fix auth token expiration check`
   - Good: `add user avatar upload endpoint`
   - Bad: `Fixed the bug with authentication`
   - Bad: `Updated files`

### Step 4: Determine Push Strategy

Check current branch:
- **If on `main` or `master`**: Try to push directly. If rejected (protected branch), inform user.
- **If on feature branch**: Push with `-u` flag if needed, then proceed to PR creation.

### Step 5: Create PR (when on branch)

**Before creating PR**, ensure you understand:
- WHAT: What does this change do?
- WHY: Why is this change needed? What problem does it solve?
- HOW: How does the implementation work? (derive from code diff)

**If WHAT or WHY is unclear**: ASK the user before creating PR.

Create PR using `gh pr create` with this format:

```
gh pr create --title "<short imperative title>" --body "$(cat <<'EOF'
## What
<1-2 sentences describing what changed>

## Why
<1-2 sentences explaining the motivation/problem being solved>

## How
<Brief technical summary of the approach>
EOF
)"
```

### Rules

1. **ASK questions** if you don't understand WHAT or WHY - never guess
2. Commit messages: short, imperative, lowercase start, no period
3. PR title: matches commit message style
4. PR body: always includes What/Why/How sections
5. Never force push unless explicitly requested
6. Never amend commits that have been pushed
7. Report the PR URL when done
