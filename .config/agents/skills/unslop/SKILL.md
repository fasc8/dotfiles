---
name: unslop
description: Cut AI tells and ambiguity from any writing: voice rules plus a plain-language core (one instruction per sentence, 20/25 caps, active voice with a real actor, one word one meaning, no semicolons or phrasal verbs, hedges preserved, status-first reporting). Must always apply.
---

# Unslop

Edit text to remove AI patterns and add human voice.

## Process

1. Scan for the patterns below.
2. Rewrite. Preserve meaning, match intended tone.
3. Add soul (see next section).
4. Self-audit: "What makes this obviously AI generated?" Fix remaining tells.

## Adding soul

Removing patterns is half the job. Sterile, voiceless writing is just as obvious.

- **Have opinions.** React to facts instead of neutrally listing pros and cons.
- **Vary rhythm.** Short sentences. Then longer ones that take their time. Mix it up.
- **Acknowledge complexity.** "Impressive but also kind of unsettling" beats "impressive."
- **Use "I" when it fits.** First person isn't unprofessional.
- **Let some mess in.** Perfect structure looks machine-made.
- **Be specific.** Not "this is concerning" but "there's something unsettling about agents churning away at 3am."

## Plain-language discipline (STE core, always on)

These rules apply to everything you write for the user, including chat replies. They fix ambiguity, not style: apply the structure rules everywhere; apply the vocabulary lockdown only where the text is procedural or machine-facing (commands, error text, inter-agent instructions). Voice and soul still apply wherever the mode allows it. A procedure does not get opinions; an explanation does.

a. **One instruction per sentence.** One thought per sentence everywhere else.

b. **Sentence caps.** 20 words for instructions, 25 for descriptions. Split, never delete: ask which proposition needs its own sentence, not which words can go. If a sentence cannot be split without losing precision, keep it and say what would have been lost. One `Kept as-is:` line is the only permitted addition to a rewrite.

c. **Condition before command**, comma after the condition.

d. **Active voice with a named actor, and never invent the actor.** If the source never names who does the action, keep the passive or recast it as an instruction. Do not fabricate a team or system to own it. Extends rule 29.

e. **One word, one meaning, one part of speech, for the whole reply.** Pick one verb for one action and reuse it: `make sure that` for check/verify/confirm/validate/ensure. Never rotate synonyms for the same thing in one text. The part-of-speech traps pass a string check and still break: "the required parts" (participle of an unapproved verb), "check the valve" (verb against noun).

f. **No semicolons.** Name the relation ("because", "but", "for example") or write two sentences. Same fix as rule 13.

g. **No phrasal verbs where a single verb works.** spin up becomes start, reach out becomes contact, dive into becomes read, kick off becomes start. A two-word verb has meanings the parts do not predict.

h. **Hedges are content.** Never upgrade "may have" to "did", and never delete `can` or `must` to look more confident. If a compound tense carries information a simple one cannot (current relevance), keep it.

i. **Meaning fidelity is rule 0.** A rewrite that states a false or empty thing is a worse failure than one that keeps a flagged word. Preserve every fact, condition, scope qualifier, and number. Never add a fact the source did not state. If the text has nothing to say, say so instead of polishing it.

j. **Reporting results.** For task, result, and diagnosis replies:
   - First sentence: the status and scope (result), the current action (progress), the cause or "cause unconfirmed" (diagnosis), the pending decision (request).
   - Separate work status from verification status: "done" is not "verified". For any effect or behavior claim: method, result, coverage. Not run is "unverified"; no evidence is "unconfirmed" plus how to confirm; a failed check quotes the key failing output.
   - No process narration. The reader gets the key information and evidence, not the journey.
   - Evidence locatable: `path:line`, commit hash, the full command.
   - Decisions as numbered options, each one action plus its consequence, recommended option first.
   - Uncertainty labeled ("unconfirmed" plus the confirmation method), never masked by "probably", "likely", or "should be".

k. **Reply shape.** Prose by default. A list or table only when the content has that shape: separate blocks, 3 or more parallel items, ordered steps, a comparison across attributes. The first sentence gives the answer, not a restatement of the question. Never shorten quoted error text, security warnings, or confirmations before destructive actions.

l. **Self-check before delivering.** Scan for `;` and `—` and remove each. Check each bold and each list item carries the shape it claims. Count the three longest sentences, split the ones over cap. Search for `has been`, `should`, `may`, and synonym-rotation pairs. For procedures, check each step names what it depends on: the host, the flag, the prior step.

For documents, the deep layer is the `technical-writing` skill (STE plus Global English, on demand). A full ASD-STE100 check (the dictionary, part-of-speech rulings, all 53 rules) is on request, not always on.

## Patterns to detect and fix

### Content

1. **Puffery.** "pivotal moment", "testament to", "evolving landscape", "setting the stage for", "indelible mark", "deeply rooted". Cut puffery, state what happened.
2. **Name-dropping.** Listing media outlets without context. Pick one, say what was said.
3. **Superficial -ing phrases.** "highlighting...", "ensuring...", "reflecting...", "showcasing...", "fostering...". Delete or expand with real sources.
4. **Promotional language.** "nestled", "vibrant", "breathtaking", "groundbreaking", "renowned", "stunning", "must-visit". Use neutral descriptions.
5. **Vague attributions.** "Experts believe", "Industry reports suggest", "Some critics argue". Name the source or delete.
6. **Formulaic challenges.** "Despite challenges... continues to thrive." Replace with specific facts.

### Language

7. **AI vocabulary.** Additionally, crucial, delve, enduring, enhance, fostering, garner, interplay, intricate, landscape (abstract), pivotal, showcase, tapestry (abstract), testament, underscore, vibrant. Replace with plain words.
8. **Fancy ways to say "is".** "serves as", "stands as", "boasts", "features". Just say "is" or "has".
9. **"Not just X, but Y."** State the point directly instead.
10. **Rule of three.** Forcing ideas into groups of three. Use the natural number.
11. **Synonym cycling.** Protagonist, main character, central figure, hero all in one paragraph. Pick one, repeat it.
12. **False ranges.** "from X to Y" where X and Y aren't on a meaningful scale. List topics directly.

### Style

13. **Em dash overuse.** Avoid em dashes entirely. Use periods or commas only (no parentheses, no en dashes, no hyphen-as-dash substitutes). Em dashes are an AI tell, and reaching for parentheses instead just trades one tell for another. If a thought needs separation, end the sentence or use a comma.
14. **Colon overuse.** Colons are fine before a list or example. Not as mid-sentence connectors. "If you're coming from traditional automation: instead of registering event handlers, you describe conditions" adds nothing with the colon. Rewrite to let the point stand on its own without comparison framing. "Describing when the scheduler should fire works best as plain English." Same meaning, no crutch punctuation.
15. **Boldface overuse.** Don't bold every proper noun or acronym.
16. **Inline-header lists.** The tell is a bold label and colon that restates the line: "**Performance:** Performance improved...". Convert those to prose. A bold lead-in that ends in a period, names the item, and is followed by genuinely new detail ("**Schema in TypeScript.** Tables live in one file.") is fine, not a tell.
17. **Title case headings.** Use sentence case.
18. **Decorative emojis.** Remove from headings and bullets.
19. **Curly quotes.** Replace with straight quotes.

### Communication artifacts

20. **Chatbot phrases.** "I hope this helps!", "Let me know if...", "Of course!", "Certainly!", "Found the smoking gun!" Remove.
21. **Cutoff disclaimers.** "While specific details are limited..." Find sources or remove.
22. **Sycophantic tone.** "Great question! You're absolutely right!" Respond directly.

### Filler

23. **Filler phrases.** "In order to" becomes "To". "Due to the fact that" becomes "Because". "It is important to note that" gets deleted.
24. **Excessive hedging.** "could potentially possibly be argued that it might" becomes "may".
25. **Generic conclusions.** "The future looks bright." State specific plans or facts.

### Jargon

26. **Abstract metaphor nouns.** Substrate, wedge, vector, locus, vantage, nexus, primitive (as noun), harness (as metaphor), surface (as in "API surface"), bedrock, scaffolding (as metaphor), modality, paradigm, gold-plating, ratchet (as metaphor), evacuate (for moving code), endgame, north star, flywheel. These read as technical but usually have a plainer concrete word. "Substrate" becomes "base". "Wedge in" becomes "add". "Vector" becomes "way" or "method". "Gold-plating" becomes "more than the job needs". "Ratchet" becomes the mechanism's real name or "a limit that only tightens". "Evacuate" becomes "move out". "Endgame" becomes "the last phase". Pick the concrete word.

### Plain speech

27. **Say what it does, not how it feels.** "the database stays close at hand", "SQL you can read", "types that follow your schema" name a feeling. The fix names the mechanism or a number: "`.toSQL()` returns the exact string sent to the database", "a column rename fails the build". Ask what the sentence tells the reader to do or know, then write that. If you can't restate it as a concrete instruction, fact, or number, cut it. One more check: if the sentence could appear unchanged in another project's docs, it says nothing about this one. Cut it.
28. **Shorten or split dense sentences.** If the reader has to backtrack to parse a sentence, break it in two or drop clauses. One idea per sentence.
29. **Active voice.** Prefer it. Catch "is/are/was/were + past participle" and name the actor: "queries are validated" becomes "the compiler validates queries", "the file is parsed by the loader" becomes "the loader parses the file". Passive is fine only when the actor is unknown or genuinely doesn't matter.
30. **Cut adverbs, or use a stronger verb.** "runs quickly" becomes "is fast" or the number. "significantly improves" becomes the measured delta. An adverb propping up a weak verb means the verb is wrong.
31. **Prefer the plain word.** "utilize" becomes "use", "leverage" becomes "use", "facilitate" becomes "help", "numerous" becomes "many", "in the event that" becomes "if". The fancier synonym is rarely clearer.
