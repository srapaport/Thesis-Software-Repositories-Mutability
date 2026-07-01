---
name: thesis-chapter-deduplication
description: Reduces cross-chapter repetition in thesis LaTeX by comparing a target chapter with its immediate predecessor, keeping the first canonical exposition of each idea and trimming later repeats. Paraphrases overused thesis-wide phrasing when a brief recall is still needed. Use when the user asks to deduplicate, de-repeat, tighten, or reduce redundancy in a chapter, or mentions repetitive phrasing like "tension of this thesis".
disable-model-invocation: true
---

# Thesis chapter deduplication

## Goal

For a given chapter, parse it and the direct previous one if it exists, and try to remove as much of repetition as possible to make the reader less annoyed when reading the thesis.

In general it is ok to repeat some definitions but not a problem statement or context or idea.

It goes too for phrasing, for instance "tension of this thesis" is way too much present. Try paraphrasing when redundancy is unavoidable.

## What deduplication means

**Deduplication removes repetition after the first use — it does not remove all use.**

For each idea, phrase, incident, or argument:

1. **Identify the canonical home** — where it is first introduced or where it does its main rhetorical job (opening hook, problem section, background definition, chapter-specific contribution).
2. **Keep that exposition intact** unless the user asks to rewrite it.
3. **Trim, compress, or pointer-replace only later occurrences** that repeat the same rhetorical job without adding new detail.

Conceptual overlap is not duplication by itself. Two passages can mention the same underlying fact (e.g. mutable Git refs) while serving different jobs:

| Passage | Rhetorical job | Action |
|---------|----------------|--------|
| Opening incident walkthrough: how push access let attackers retarget tags | Close the vignette; explain *this attack* | **Keep** — canonical narrative home |
| `\Cref{sec:intro-problem}`: object store vs reference mutability | General Git model for the thesis | **Keep** — canonical technical home |
| Third `tj-actions` paragraph in the same chapter | Re-open the same incident story | **Cut or pointer** — duplicate job |
| Empirical chapter intro: full Git mutability lecture again | Re-teach background | **Cut → `\Cref{chap:background}`** |

When in doubt, ask: *Is this the first time the reader needs this, in this form, for this purpose?* If yes, keep it. If it only re-delivers what they already read, deduplicate.

## Chapter map

| Directory | File | Label | Previous chapter |
|-----------|------|-------|------------------|
| `chapters/chapter01/` | `chap01.tex` | `chap:intro` | *(none — compare against frontmatter only if user asks)* |
| `chapters/chapter02/` | `chap02.tex` | `chap:background` | `chap01.tex` |
| `chapters/chapter03/` | `chap03.tex` | `chap:tags` | `chap02.tex` |
| `chapters/chapter04/` | `chap04.tex` | `chap:histories` | `chap03.tex` |
| `chapters/chapter05/` | `chap05.tex` | `chap:secrets` | `chap04.tex` |
| `chapters/chapter06/` | `chap06.tex` | `chap:conclusion` | `chap05.tex` |

When the user names a chapter by number, label, or title, resolve to the row above. **Edit only the target chapter** unless the user explicitly asks to fix the predecessor too.

## What to cut, compress, or keep

| Category | Policy | Examples in this thesis |
|----------|--------|-------------------------|
| **Problem statement / motivation** | Keep the first full statement; cut or pointer-replace **later** re-statements | Re-opening the `tj-actions/changed-files` incident after Ch1's opening; a second full object-vs-ref essay in Ch3 |
| **Context / stakes** | Cut if the prior chapter already framed it; keep only what is **new to this chapter's angle** | Supply-chain stability, SWH observability, tag-as-release-anchor social contract |
| **Ideas / claims / thread** | One canonical exposition per thesis; later chapters **reference, don't re-argue** | Three-study arc, snowball effect, repository cleanup vs credential rotation |
| **Definitions / taxonomy labels** | OK to repeat briefly when the reader needs the term locally; prefer `\Cref{}` to the canonical `\label{}` | `mutable release`, `tag alteration`, `secret`, blob-level vs file-level |
| **Methodology shared across empirical chapters** | Ch3 owns the full pipeline; Ch4+ should **delta only** (already noted in file headers) | Snapshot-pair comparison, origin selection |
| **Roadmap / chapter outline** | Keep, but do not re-motivate with paragraphs already in Ch1 intro or prior chapter closings | "The remainder of this chapter…" is fine; repeating Git mutability lecture is not |
| **Thesis-wide boilerplate** | Paraphrase or delete; never stack identical framing | "central tension of this thesis", "at the core of this thesis", "studies reported in this thesis" |

## Workflow

### 1. Load context

1. Read the **target** `chapNN.tex` end to end.
2. Read the **previous** chapter's `.tex` if it exists (same pass: intro, section openings, discussion, closing paragraphs).
3. Skim `THESIS_PLAN.md` only if scope is ambiguous.
4. Follow [`chapter-writing-academic-style.mdc`](../../rules/chapter-writing-academic-style.mdc) for tone after edits.

Do **not** edit `contributions/**/` or `experiments/**/`.

### 2. Build a repetition inventory

Scan the target chapter for overlap with the predecessor. For each hit, classify:

- **Duplicate** — same idea, same rhetorical job, **after canonical home** → cut or pointer; never cut the first/canonical use
- **Partial overlap** — same underlying concept, new detail or new register → keep the delta; do not delete the earlier passage just because topics align
- **Phrasing echo** — same sentence skeleton or stock phrase on repeat → paraphrase or cut the **later** instance
- **Legitimate recall** — reader needs a 5–10 word reminder → keep minimal

Useful greps on the target file:

```bash
rg -n 'this thesis|tension|Chapter~\\ref|\\Cref\{chap:|Software Heritage|mutable|content-addressed|supply.?chain|reproducib' chapters/chapterNN/chapNN.tex
```

Also compare **opening 3 paragraphs**, **each `\section{}` first paragraph**, and **discussion/conclusion** blocks — that is where re-motivation clusters.

### 3. Choose an edit strategy

Apply in this order of preference:

1. **Pointer** — Replace a paragraph with a cross-reference: `As \Cref{sec:intro-problem} established, …` or `Building on \Cref{chap:background}, this chapter …`
2. **Compress** — One sentence of stakes + forward motion instead of a full re-explanation.
3. **Cut** — Delete the redundant block when the prior chapter or a `\Cref{}` already suffices.
4. **Paraphrase** — When the reader still needs the concept but the exact wording already appeared upstream. Change structure, not just synonyms (`tension` → `gap`, `this thesis` → `the empirical chapters`, `central` → drop the intensifier).
5. **Move canonical home** — If both chapters explain the same thing fully at the same rhetorical level, keep the fuller version in the **earlier** chapter and thin the later one. Do not move content unless the user asks for a structural refactor. Never delete both copies — always leave one complete exposition.

**Intro pattern for empirical chapters (Ch3–Ch5):**

- Sentence 1: pointer to what the previous chapter established (not a full re-statement).
- Sentences 2–3: **what is new here** (scope shift, research question, method delta).
- Avoid re-pasting incidents, Git lectures, or SWH capability essays already in Ch1–Ch2.

### 4. Apply edits in LaTeX

Hard constraints:

- Preserve all `\label{}` keys and existing `\cite{}` keys unless removing a sentence makes a citation orphaned — then remove the cite too.
- Do not invent numbers, results, or citations.
- Keep `\input{}`, macros from `data.tex` / `numbers.tex`, and figure/table references intact.
- Do not introduce `\TODO{}` for repetition fixes; either fix or leave a short `\NOTEside{}` only when choosing between two valid cuts needs author judgement.
- Match the repo's hyphenation and participial-compound rules (see chapter-writing rule).

### 5. Verify

1. Re-read edited section openings: each should **advance** the argument, not restart it.
2. Grep the edited chapter for stock phrases (`this thesis`, `tension`, `established that`) — no two adjacent sections should open with the same framing.
3. Confirm cross-references still resolve (`\Cref{chap:…}`, `\Cref{sec:…}`).
4. Run `read_lints` on edited `.tex` if available.

## Deliverable to the user

After editing, report:

1. **Summary** — 2–4 sentences on what was de-duplicated and the overall effect.
2. **Change table** — compact list:

   | Location | Issue type | Action |
   |----------|------------|--------|
   | `\Cref{sec:…}` opening | Duplicate problem statement | Cut → pointer to `\Cref{chap:background}` |

3. **Phrasing swaps** — notable paraphrases (old phrase → new wording), especially thesis-wide boilerplate.
4. **Left intentionally** — definitions or brief recalls you kept, with one-line justification.
5. **Optional follow-up** — predecessor chapter passages that could be thinned in a future pass (only if glaring).

## Checklist

```
- [ ] Target chapter and direct predecessor both read
- [ ] Repetition inventory built (problem/context/idea vs definition)
- [ ] Edits applied only in target chapter (unless user said otherwise)
- [ ] Canonical first uses left intact; only later repeats trimmed
- [ ] Problem statements and context not re-opened without new angle (after their first full statement)
- [ ] Overused phrasing paraphrased ("tension of this thesis", "this thesis", etc.)
- [ ] Labels, cites, macros, and numbers preserved
- [ ] User report includes summary + change table
```

## Anti-patterns

- **Deleting the first/canonical exposition** because a later section covers the same concept at a different level (e.g. cutting an opening incident walkthrough because `\Cref{sec:intro-problem}` explains mutable refs).
- Treating conceptual overlap as duplication and removing **all** mentions instead of later repeats only.
- Stripping a definition the reader needs because the term appears 200 pages later without a `\Cref{}`.
- Replacing substance with vague pointers (`as discussed earlier`) with no `\label{}` target.
- Making Ch2 thinner by moving background into empirical chapters — background belongs in Ch2; empirical chapters should **point back**.
- Uniform synonym substitution that keeps the same sentence rhythm — restructure instead.
- Editing contribution papers or experiment clones to "fix" thesis repetition.

## Additional resources

- Stock phrase patterns and grep hints: [phrase-patterns.md](phrase-patterns.md)
