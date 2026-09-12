---
name: cost-efficient-agent-tree
description: "Route complex coding, multi-file implementation, codebase investigation, bug analysis, research-dependent work, and parallelizable tasks through the fewest useful Codex agents; stay direct for simple changes."
---

# Cost-efficient agent tree

Use this skill for work where delegation can reduce context pollution or improve independent verification. Do not spawn every role. Use the fewest agents necessary for verified completion.

## Operating contract

- The root agent is the only orchestrator. It owns the user goal, scope, decisions, integration, and final verification.
- Prefer deterministic tools (`rg`, targeted file reads, compiler, linter, tests, and `git diff`) over model calls when they answer the question.
- Send each child only the minimum sufficient context: goal, constraints, relevant files, known facts, precise question, and required output shape. Do not fork the full conversation by default.
- Preserve unrelated changes. Do not let concurrent write agents modify the same file unless the work is explicitly isolated and conflict-free.
- Stop when acceptance criteria and proportionate validation are complete. Do not add a reviewer for reassurance alone.

## Assess and route

1. **Direct execution**: one obvious file, known change, low risk, or a deterministic check. Do not spawn.
2. **Explorer**: use `explorer` when the relevant files, symbols, call path, tests, or configuration entry point are unknown. Give it one bounded investigation question. It is read-only.
3. **Researcher**: use `researcher` only when an external API, framework behavior, dependency version, release note, or configuration fact is necessary. Prefer official documentation and return source-backed facts. It is read-only.
4. **Worker**: use `worker` when implementation is bounded and the root has enough context. The work order must contain:

   ```text
   GOAL
   SCOPE
   RELEVANT_FILES
   CONSTRAINTS
   ACCEPTANCE_CRITERIA
   TEST_COMMANDS
   ```

   Require the structured return: `IMPLEMENTATION_SUMMARY`, `FILES_CHANGED`, `TESTS_RUN`, `RESULTS`, `OPEN_ISSUES`, `RISKS`.

5. **Reviewer**: use `reviewer` only once, after integration and targeted verification, when the change is high risk: cross-module or architectural, security-sensitive, data-loss prone, concurrency/transactional, protocol or file-format compatibility work, contradictory evidence, unresolved high uncertainty, explicit independent review, or release-critical. It is read-only and must inspect the original goal, acceptance criteria, actual diff, test results, and only necessary context. Require `VERDICT: PASS | PASS_WITH_NOTES | CHANGES_REQUIRED` plus evidence-based findings.

## Routing patterns

- Unknown code location: `root -> explorer -> root -> worker (if needed) -> root verify`.
- External fact plus independent code location: run `explorer` and `researcher` in parallel, wait for both, then integrate their compressed evidence.
- Known implementation: `root -> worker -> root verify`; skip explorer.
- Large task: split into bounded, non-overlapping tasks first. Parallelize read-only work freely when independent. Parallelize workers only when their write sets are isolated.
- Reviewer escalation: `root -> reviewer -> root`; if `CHANGES_REQUIRED`, create one bounded worker work order, run targeted tests, and verify again. Avoid reviewer-worker loops; normally allow at most one reviewer escalation.

When delegating in the current Codex client, use its native collaboration/subagent tools, state whether all requested agents must be awaited, and wait for their results before integration. Resolve disagreements by returning to source evidence, the actual diff, and deterministic checks; do not average guesses.

## Handoff formats

Explorer returns:

```text
SUMMARY
EVIDENCE
FILES
SYMBOLS
RISKS
RECOMMENDED_NEXT_STEP
```

Researcher returns:

```text
FACT
SOURCE
VERSION
CONFIDENCE
IMPLICATION_FOR_IMPLEMENTATION
```

Compress child output before carrying it into the root context. Never claim that a test, lookup, or review happened without current evidence.

## Cost and stopping rules

- Spawn only when parallelism, context isolation, external lookup, or independent review has a concrete benefit.
- Use Luna-style read/search/lookup work for bounded investigation, Sol-style work for implementation, Astra medium for routing/integration/verification, and Astra xhigh only for the reviewer escalation path.
- Do not repeat an investigation another agent already answered. Do not broaden tests after they pass unless a new failure, change, or unresolved risk justifies it.
- After every worker: inspect the real diff, compare it with acceptance criteria, inspect test output, run only missing targeted checks, and check scope creep.
- End with the root's verified result, remaining risks, and any unverified claim clearly separated.
