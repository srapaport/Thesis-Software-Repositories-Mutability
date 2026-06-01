---
name: thesis-citation-hunt
description: Finds peer-reviewed or authoritative sources for heavy thesis claims by decomposing sentences, searching scholarly indexes, expanding from seed papers, and requiring primary-source verification. Never recommends citing papers authored by Solal Rapaport. Use when the user needs citations for thesis or dissertation sentences, wants to verify a claim with literature, mentions Google Scholar, Semantic Scholar, Connected Papers, or says a sentence needs a reference.
disable-model-invocation: true
---

# Thesis citation hunt

## Goal

Turn a dense thesis sentence into **checkable sub-claims**, find **candidate papers**, expand from **seeds**, then **verify** support in the primary text before suggesting a citation. Do not cite a paper unless its text actually supports the scoped claim.

## Excluded citations (mandatory)

The thesis author is **Solal Rapaport**. For this workflow:

- **Never** list a Rapaport-authored publication as a **recommended citation** or BibTeX target (no self-citation via this skill).
- When reading `literature_reviews/` or other seeds, **skip** Rapaport papers for the recommendation list. If notes or catalogs only strongly support an atom via Rapaport’s work, **state that gap** and find **other** authors (e.g. related work cited there, same venue topic, Software Heritage / Git integrity literature without Rapaport).

Mentioning a Rapaport paper **only** as “excluded from cites; use for search direction” is allowed if it helps; do not present it as something to `\cite{}`.

## Tool stack (defaults)

1. **Google Scholar** — broad coverage; use quoted phrases and operators (`"..."`, `-term`, `author:`). Use **Cited by** from a strong seed.
2. **Semantic Scholar** — good for conceptual overlap; check influential citations and related work.
3. **Connected Papers** or **Litmaps** — after one good seed, map adjacent papers.
4. **The Lens** — optional when filters (year, OA, field) help.

AI literature assistants (Elicit, Consensus, etc.) are **query generators only** unless the user asks otherwise; still open the PDF or authoritative page and confirm wording.

## Workflow

### 1. Decompose

Split the user’s sentence into **2–4 atomic claims** (who assumes what; what mechanism exists; what tension follows). If one paper is unlikely to cover all atoms, say so and plan **multiple citations** or **narrow the sentence** in prose.

### 2. Search per atom

For each atom, run **Scholar and Semantic Scholar** (or the user’s preferred subset) with:

- One **quoted phrase** from the thesis (5–12 words) when possible
- **Domain terms** (e.g. Git: `force push`, `tag`, `ref`, `history rewrite`; supply chain: `integrity`, `reproducible build`, `package manager`, `provenance`)

Record: paper title, year, venue, **exact quote or section** that supports the atom, and URL or DOI.

### 3. Expand from seeds

Pick the **best 1–2 seeds** per atom. Use **Connected Papers** / **Litmaps** or Scholar **Cited by** to find follow-on work. Prefer recent surveys or standard references only when they **explicitly** state the atom.

### 4. Verify (mandatory)

- Open abstract minimum; for non-obvious claims, skim **introduction + related work** or the **cited section**.
- If the source only supports a **weaker** claim, cite the weaker claim or drop the atom from the sentence.

### 5. Deliver to the user

Output:

- **Sub-claims** numbered
- **Recommended citation(s)** per sub-claim (or one synthesis paragraph if one source covers several atoms)
- **Evidence**: short quoted or paraphrased line tied to the PDF/page
- **BibTeX keys** only if the user provides a `.bib` or asks for draft keys; otherwise give enough metadata to paste into Zotero

### 6. Project context

If this repository contains `literature_reviews/` or similar, **list relevant existing `.bib` / notes** first and treat them as seeds before broad web search. Apply **Excluded citations**: Rapaport-authored entries may inform *queries* but must not appear in the final recommended cite list.

**Local PDFs:** `literature_reviews/library/` holds full-text PDFs (often mirrored from Zotero; not committed to git). When verifying an atom or drafting evidence, **search that folder for a matching file** (title keywords, year, DOI slug in the name) and read the PDF for quotes and section-level support before recommending a cite. If no PDF is present, fall back to the web as in step 4.

## Checklist

```
- [ ] Sentence split into atomic claims
- [ ] Each atom searched (Scholar + Semantic Scholar minimum)
- [ ] Seed papers chosen; graph or “cited by” expansion done where useful
- [ ] Primary text checked for each recommended cite (local `literature_reviews/library/*.pdf` when available, else web/PDF)
- [ ] User told if claim needs multiple sources or prose split
- [ ] No recommended citation is authored by Solal Rapaport
```

## Anti-patterns

- Citing from title/abstract alone when the claim is interpretive or composite.
- One mega-citation for unrelated atoms bundled in one sentence.
- Treating blog posts or docs as peer-reviewed without the user agreeing to grey literature.
- Recommending **Solal Rapaport**–authored papers as thesis citations (forbidden for this skill).
