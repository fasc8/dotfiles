---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets.

If the user passes a ticket reference, fetch it from the issue tracker and state its title before starting. If the reference is ambiguous, ask.

Where possible, call the Skill tool with "tdd", at pre-agreed seams.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

When the work is bulk — a sweep, a migration, a run of similar edits — build the lever instead of working by hand: the tool that does it or proves it (a codemod, script, generator, or a recipe a subagent follows). Do the first unit by hand, then build the tool and prove it by rerunning it on that unit. Make it safe to rerun. No script, codemod, or generator in the diff means the lever was not built.

Once done, call the Skill tool with "code-review" to review the work.

Commit your work to the current branch.
