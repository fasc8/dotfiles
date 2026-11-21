---
name: ask-how
description: Explains the best route to a stated goal through the skills in this directory: which skills, in what order, and why.
disable-model-invocation: true
---

# Ask How

You don't remember every skill, so ask. Given a **goal** — the outcome you want to reach — this map explains the best route through the skills in this directory: where to start, the order, what each step hands to the next, and where the work crosses a context boundary. It explains the route; you run it.

Before stating what a skill does or recommending a step be skipped, read that skill's SKILL.md: the summaries here are for orientation only.

The map is a tree: one **main flow**, **on-ramps** that merge onto it, **standalone** skills, and a **vocabulary layer** underneath. A new skill joins one of those, or a new section — see [Extending this map](#extending-this-map) at the end.

## Shape of the answer

A goal earns an explanation, not a pointer. A complete answer has five parts:

1. **The goal, read back** — the outcome, and what *done* looks like. If the goal is fuzzy enough to route two ways, ask the two or three questions that pick the destination first; the route follows the destination, never the other way around.
2. **The inventory** — this skill's directory is the source of truth, not this map. List the sibling skill folders and read each frontmatter (name, description): that is the live list, so a skill added to the directory is picked up with no edit here. The map below is a cache of how the skills **chain** — the order, the branches, the handoffs — which no frontmatter carries. A skill missing from the map is read from its own SKILL.md and routed by its description.
3. **The route** — the skills in order, each with a line: what it takes, what it hands to the next step, and why it is that one here.
4. **The branches** — where the route splits on a condition not yet known (the size of the build, whether a question needs a runnable answer, whether a human has to be in the loop), and what decides which way.
5. **The boundaries and the first read** — where the context stays, gets compacted, or is handed off ([Phase boundaries](#phase-boundaries)); and the SKILL.md of the first skill on the route, which the user reads before running it.

A route may shorten the map, never silently: if a load-bearing step (the spec, the review, the retro) is out of the route, say so, and what skipping it costs.

## The main flow: idea → ship

The route most work travels. You have an idea and want it built.

1. **`/grill-with-docs`** sharpens the idea by interview. Start here whenever you are **working in a working directory**: it's stateful, retaining what it learns in `GLOSSARY.md` and ADRs. (No working directory? Use `/grill-me` instead, covered under Standalone. Both run the same `/grilling` primitive; `grill-with-docs` is the one that leaves a paper trail, which makes it the better of the two whenever a repo is there to leave it in.)
2. **Branch: can you settle every question in conversation?** If a question needs a runnable answer (state, business logic, a UI you have to see), detour through a prototype, bridged by **`/handoff`** in both directions (a prototype lives in its own directory, which is exactly what `/handoff` is for; see Phase boundaries):
   - **`/handoff`** out, then open a fresh session against that file,
   - **`/prototype`** to answer the question with throwaway code,
   - **`/handoff`** back what you learned, and reference it from the original idea thread.
3. **Branch: how big is the build?**
   - **One session** → **`/implement`** right here, in the same context window.
   - **Several sessions, well understood** → **`/to-spec`** (turn the thread into a spec), then **`/to-tickets`** to split it into tracer-bullet tickets, each declaring its **blocking edges**. Then work the tickets one of two ways:
     - **`/implement`** per ticket, **clearing** context between each one. On a local tracker that's one file per ticket under `.scratch/<feature>/issues/`, worked blockers-first by hand; on a real tracker the edges become native blocking links, so any ticket whose blockers are done can be grabbed. Each ticket is self-contained, so the last one's context is disposable.
     - **`/implement-spec`** for the whole spec in one run. It reads the tickets as a **task graph**, runs implementer subagents across the ready **frontier** in parallel, and lands everything on one **integration branch**. Reach for it when you'd rather orchestrate the build than drive each ticket yourself.
   - **Several sessions, gnarly or uncertain** — a large migration, an ambitious multi-part change, a build whose shape you can't fully predict until you've made part of it → **`/figure-it-out`**. It designs an **auditable playbook** — hypothesis loop, decision log, rigor scaled to the task — and works it across sessions while a human reviews after stepping away. The decision trail goes to **`/show-me-your-work`** (one row per decision: what, why, evidence, result), and when the user returns, **`/ketchup`** (or `/ketchup-video`) catches them up in plain words and small visuals, with every item waiting on them listed with what's needed to decide.

   Either way, the code gets built by driving **`/tdd`** (one red-green slice at a time) and closes out with a review: **`/code-review`**, a two-axis review (Standards + Spec) of the diff, or — when the diff or design needs to be attacked rather than graded — **`/interrogate`**, the adversarial multi-model review where the adversaries try to break it and only findings proven by a run survive. `/implement` runs the former per ticket; `/implement-spec`'s implementers each drive `/tdd`, and it runs one review over the integration branch. When a single **non-trivial decision** (not a diff) needs to stand, **`/doubt-driven-development`** cross-examines it with a fresh-context reviewer before it does. Reach for **`/tdd`** on its own when you just want to build a concrete behaviour test-first without a full spec, and **`/code-review`** on its own whenever you want to review a branch or PR against a fixed point.

   When the work goes up as a pull request, **`/pr`** shapes the body: the smallest visual that shows the change, before/after evidence that it works, and a one-way or two-way door call. It's model-invoked, so the agent reaches for it whenever it writes a PR.

4. **`/retro`** closes the loop. After a build, and especially one that went sideways, it looks back over the session and suggests changes to the agent's **environment**, not the code: navigation pointers, automated checks, the coding standards `/code-review` enforces, steering files, tooling. Mechanical mistakes become deterministic checks; judgement calls become coding standards. The next build then starts from a better environment.

### Context hygiene

Keep steps 1–3 in **one unbroken context window** (don't compact or start fresh until after `/to-tickets`) so the grilling, spec, and tickets all build on the same thinking. Each `/implement` then starts fresh, working from the ticket. Run `/retro` in the session it's looking back on, before you clear; after clearing, point it at that session's log instead.

The limit on this is the **[smart zone](https://www.aihero.dev/ai-coding-dictionary/smart-zone)**: the window (~150k tokens on state-of-the-art models) within which the model still reasons sharply. If a session approaches it before `/to-tickets`, don't push on degraded; `/compact` at the nearest phase boundary and carry on (see Phase boundaries). When a session is dead and the work isn't done, **`/recall`** reconstructs the recent working context from the chat history, live state, and the shared record — the inverse of `/handoff`.

## On-ramps

A starting situation that generates work, then merges onto the main flow.

- **Bugs and requests piling up** → **`/triage`**. It moves issues through triage roles and produces agent-ready issues, which **`/implement`** later picks up. If the repo has no tracker config, it asks which tracker and which labels to use — it doesn't invent one.

  Triage is only for issues **you didn't create**: bug reports, incoming feature requests, anything that arrives raw. Tickets that `/to-tickets` produced are already agent-ready, so **don't triage them**.

- **Something's broken** → **`/diagnosing-bugs`**. For the hard ones: the bug that resists a first glance, the intermittent flake, the regression that crept in between two known-good states. It refuses to theorise until it has a **tight feedback loop** (one command that already goes red on *this* bug), then fixes with a regression test. Once the fix is in, run **`/retro`** in the same session to ask what would have prevented the bug; where the real finding is that there's no good seam to lock it down, that's a job for **`/improve-codebase-architecture`**.

- **A huge, foggy effort: a greenfield project or a huge feature build, too big for one session** → **`/wayfinder`**, the most cognitively demanding flow here. When the way from here to the destination isn't visible yet, it charts a **shared map** of **decision tickets** on the issue tracker and resolves them one at a time, producing **decisions, not deliverables**, until the fog is pushed back and the way is clear. Where **`/grill-with-docs`** sharpens an idea you can hold in one session, wayfinder is for the idea you can't, and it's slower and denser, so save it for exactly that, never a well-scoped feature.

  When the map clears, **it hands off, it doesn't build**: merge onto the main flow at **`/to-spec`**, which collapses the map's linked decisions into a buildable plan, then `/to-tickets` and `/implement` as usual. Looping the map straight into `/implement` skips that collapse and throws the linked detail away, so go straight to `/implement` only when the effort turned out genuinely small.

## Codebase health

Not feature work, just upkeep. Run whenever you have a spare moment, or right after a `/retro` has surfaced the patterns:

- **`/improve-codebase-architecture`** scans for **deepening opportunities** and presents them as a visual HTML report, then grills through whichever one you pick. It's the survey that finds the candidates; **`/codebase-design`** (below) is the bench you design the chosen one on. Picking one _generates an idea_ you can take into the main flow at `/grill-with-docs`.
- **`/correct`** finds the mistakes agents keep repeating in this repo and makes each one impossible, in this order: architecture → types → a lint whose error names the fix → a test → docs last. It proves each check fails on a real past mistake.
- **`/reflect`** is the library's own upkeep: it mines the active transcript for durable learnings and routes each to a concrete edit on an existing skill.

## Disciplines

Cross-cutting disciplines that shape how work gets done, each reached for when its situation appears:

- **`/constraint-driven-development`** — the project's quality bar as a written contract (`CONSTRAINTS.md`) with a gate that watches the diff for a weakened bar. Set up once, at the start of a repo you want to keep honest.
- **`/context-engineering`** — session context as a budget: the rules files, what to load per task, when to compact. Reach for it at a new session start, when agent output quality degrades, or when setting up a project for AI-assisted work.
- **`/incremental-implementation`** — changes in thin, verifiable slices: one thing at a time, the build green after every step, feature flags for work that isn't ready for users. The discipline under any multi-file build.
- **`/shipping-and-launch`** — the destination after the PR: the pre-launch checklist, staged rollout with decision thresholds, monitoring, and the rollback plan. When the target is production, not a merge.

## Adversarial layer

Where the work has to be attacked, not graded:

- **`/interrogate`** — the review step of the main flow, for when a diff or design is worth attacking: multi-model adversaries try to break it, and only findings proven by a run survive.
- **`/doubt-driven-development`** — the per-decision version: every non-trivial decision gets a fresh-context adversarial review before it stands; a cross-model second opinion is offered each cycle.
- **`/blast-radius`** — the pre-change version: before a change touches shared territory, it finds what that change could break somewhere else, beyond the diff, and proves the one fact it's safe because of by running real code.

## Visuals and media

When the answer should be seen, not read. The light path is one focused HTML; the rest are the heavier forms:

- **`/show-me-visually`** — one focused, self-contained HTML visual of the current conversation: a flow, timeline, relationship map, or comparison. The light path for anything that needs a picture.
- **`/architecture-diagram`** — dark-themed standalone HTML with inline SVG for system architecture, cloud topology, microservice, and infrastructure diagrams. The structure-diagram form.
- **`/statechart`** — for the thing that moves between states: a product flow, a protocol, a service, a bug that lives in state. It models the behaviour in TLA+, checks the rules, and draws a Mermaid statechart with the shortest path to each rule-breaking state.
- **`/ketchup-video`** — the video form of `/ketchup`: a short subtitled slide video of what happened, with the waiting calls as text under it.
- **`/manim-video`** — 3Blue1Brown-style explainer videos, algorithm walkthroughs, and equation derivations (needs Manim CE installed).
- **`/ascii-video`** — video, audio, or images rendered as coloured terminal-style MP4/GIF (needs ffmpeg).
- **`/baoyu-infographic`** — static infographics: 21 layouts × 21 styles, freely combined. The "make it into an infographic" path.

## Standalone

Off the main flow entirely.

- **`/grill-me`**: the same relentless interview as `/grill-with-docs`, but **stateless**: it saves nothing locally and builds no `GLOSSARY.md`. Reach for it when you are **not working in a working directory** (sharpening a plan, a design, a piece of writing, anything with no repo under it). If you are in a working directory, use `/grill-with-docs` instead: it runs the same interview and leaves a paper trail, so it is strictly the better one.
- **`/grilling`** is the interview primitive itself: rounds, the frontier, facts are the agent's job and decisions are yours. `/grill-me` and `/grill-with-docs` are the two named ways in, and `/triage`, `/wayfinder` and `/improve-codebase-architecture` all run it internally. Reach for it directly only when you want the interview with no wrapper around it.
- **`/prototype`** is a small, throwaway program that answers one design question: does this state model feel right, or what should this UI look like. Throwaway is a constraint on how the code is written, not a promise to destroy it: the answer folds into the real code, and the prototype itself is kept as a **primary source** on a `prototype/<name>` branch out of main, pointed at from the implementation issue. It's the detour in step 2 of the main flow, but reach for it any time a design question is hard to settle on paper.
- **`/research`**: delegate reading legwork to a **background agent**: it investigates a question against **primary sources**, then leaves a cited Markdown file in the repo. Keep working while it reads. The file it produces is something to take *into* the main flow at `/grill-with-docs`, since research feeds the thinking rather than replacing it.
- **`/wizard`** is for the steps only a **human** can take: provisioning infrastructure, setting up credentials or CI secrets, clicking through an unfamiliar third-party dashboard, running a one-off migration or cutover. It generates an interactive bash script that opens each URL, captures each value, and writes it into `.env` and GitHub secrets, so the procedure stops being something you re-explain to an agent every time. Model-invoked, so the agent reaches for it the moment it hits a wall only you can pass. If the agent could just do it itself, it should; this is for where a human is genuinely in the loop.
- **`/wait-what`** is the corrective for a message that didn't land. Use it mid-conversation, inside any other skill, and the agent re-pitches what it just said with the context you were missing, in plain English, using the `GLOSSARY.md` vocabulary. It works after the fact; `/grill-with-docs` is the upfront cure, because a shared language agreed early is what stops the jargon arriving at all.
- **`/teach`**: learn a concept over multiple sessions, using the current directory as a stateful workspace.
- **`/how`** and **`/why`** are the explainer pair. `how` answers "how does X work" — runtime flow, placement and ownership, onboarding mental models; it can also critique the architecture. `why` answers "why does X work this way" — the decision, the trade-offs, and the evidence behind them, as a cited read. Both are model-invoked: the question is the trigger.

## Writing standards

The layers of the written word, from reply to document:

- **`/unslop`** — always applied, never invoked: it cuts AI tells and ambiguity from any writing, including chat replies. The plain-language core (one instruction per sentence, 20/25 caps, active voice with a real actor, one word one meaning, status-first reporting) runs underneath every other skill.
- **`/caveman`** — the reply-level layer: ultra-compressed communication mode (lite / full / ultra, with wenyan variants) that cuts output tokens while keeping technical accuracy.
- **`/technical-writing`** — the document-level layer: Diátaxis structure, Google developer style sentences, STE instruction rules, Global English syntax. For documents that get published, not replies.
- **`/writing-for-agents`** — the reference for writing documents agents consume: skills, AGENTS.md, pointed-at docs.

## Vocabulary underneath

Two model-invoked references that run *beneath* the other skills, each the single source of truth for its vocabulary. Reach for them directly when the **words**, not the process, are the problem; or let the skills above pull them in.

- **`/domain-modeling`**: sharpen the project's *domain* language: challenge a fuzzy term, resolve an overloaded word ("account" doing three jobs), record a hard-to-reverse decision as an ADR. It's the active discipline `/grill-with-docs` drives to keep `GLOSSARY.md` a clean glossary.
- **`/codebase-design`** is the deep-module vocabulary (module, interface, depth, seam, adapter, leverage, locality) for designing a module's *shape*: a lot of behaviour behind a small interface at a clean seam. `/tdd` and `/improve-codebase-architecture` both speak it.

## Phase boundaries

A **phase** is a chunk of work inside a session: the grilling, the implementation, the QA. At the **boundary** between two of them you have five options, and picking between them is the fuzziest decision in this whole map:

- **Continue**: stay put. Costs nothing, loses nothing.
- **`/new`**: start a new session, from nothing.
- **`/handoff`** writes a portable markdown file. Narrow: only for a **new harness**, a **new directory**, a **colleague**, or forking a side task **mid-phase**. What it buys is portability.
- **Subagent**: send a tightly-scoped task to its own window and get a report back.
- **`/compact`** compresses this context and seeds a fresh session with it. The **default**, at the bottom of the tree rather than the first reach.

Read [PHASE-BOUNDARIES.md](PHASE-BOUNDARIES.md) for the ordered tree: the five questions, the reasoning behind each branch, and why the primary-source cost makes **Continue** the one to rule out first. Make the decision **at** a boundary; mid-phase, continue or split the rest into subagents.

## Setup

There is no automatic setup skill on this machine. The flows assume a repo-local issue-tracker config (tracker + triage label vocabulary); if one is missing, **`/triage`** asks which tracker to use and which labels mark the triage states rather than inventing a config file.

## Extending this map

The directory is the territory; this file is the map. A new skill in the directory is **already in scope**: the inventory step reads the live list, so a skill that stands alone costs no edit here.

A line in the map is earned when the skill **chains**: when it sits in a flow, hands off to another skill, or decides a branch. Adding such a skill adds one line:

- The line names the skill in backticks, in the voice of its section, with one or two sentences: when you reach for it, and what it hands to the next step.
- It goes in the section that fits — the main flow, an on-ramp, codebase health, disciplines, the adversarial layer, visuals, standalone, writing, or vocabulary. A skill that fits none of them starts a new section; the sections are the only structure, and the tree survives as long as the sections stay coarse.
- If the new skill changes how work gets built or reviewed, edit the main-flow step, not just the section — the flow is the load-bearing part of the map.

Keep lines at orientation level: each skill's own SKILL.md is the source of truth, and the line decides which one to read and where it sits in the route.
