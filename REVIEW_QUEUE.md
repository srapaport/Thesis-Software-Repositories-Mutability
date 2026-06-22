# Review Queue

User-facing review backlog populated by drafting agents. This file is gitignored. Newest items appear at the top of each chapter section.

For the workflow contract, see [`/.cursor/rules/thesis-drafting-workflow.mdc`](.cursor/rules/thesis-drafting-workflow.mdc) and [`THESIS_PLAN.md`](THESIS_PLAN.md).

## Item template

```markdown
### <task_id> — <section title> — <YYYY-MM-DD>

- **Target file**: `<path>`
- **Status**: done | done-with-gaps | blocked
- **What was produced**: <1-3 sentence summary>
- **Verify**:
  - [ ] <thing the user must double-check>
- **TODO markers introduced**:
  - `\TODO{...}` near line X — <why>
- **Follow-ups**: <suggested next actions>
```

---

## Restructure — Methods chapter dissolved + full paper coverage — 2026-06-01

### RESTRUCTURE-01 — Delete Methods chapter, renumber, redistribute methodology — 2026-06-01

- **Target files**: `main.tex`, `this.bib`, `chapters/chapter01/chap01.tex`, `chapters/chapter02/chap02.tex`, `chapters/chapter03/chap03.tex` (Tags), `chapters/chapter04/chap04.tex` (Histories), `chapters/chapter05/chap05.tex` (Secrets); deleted old `chapters/chapter03` (Methods); renamed `chapter04→03 … chapter07→06`.
- **Status**: done-with-gaps
- **What was produced**: Dissolved the shared Methods chapter; Tags (Ch3) now carries the thorough self-contained methodology, Histories (Ch4) cites it and details only differences, Secrets (Ch5) was fully drafted from the protocol + notebooks with a distinct methodology. All three empirical chapters exhaustively expanded to cover their source papers. 5 secrets refs + `yadmani2025` merged into `this.bib`; `\usepackage{multirow}` added.
- **Verify**:
  - [ ] **Build the document** (agents do not run LaTeX): confirm chapters renumber to 1–6, all tables/figures compile, and no undefined references/citations. Cross-ref and citation key checks passed statically (no dangling `\ref`/`\Cref`, all `\cite` keys resolve in `this.bib`/`swh.bib`).
  - [ ] siunitx 3.4.14 is installed; `\SI{}{\percent}` is used (deprecated-but-supported alias). If a future siunitx drops `\SI`, switch to `\qty`.
  - [ ] Confirm the Tags figures (`workflow_pipeline` = pipeline, `tag_alteration` = move schematic) are assigned as intended.
  - [ ] Confirm the verbatim Nix transcript (Ch3) and GitHistorian transcript (Ch4) are acceptable as typeset listings (reproduced from the papers, not fabricated).
  - [ ] Decide whether `THESIS_PLAN.md` Ch7 conclusion tasks should be re-pointed now that Methods (`T-CH3-07`) is gone.
- **TODO/NOTE markers introduced**:
  - `\TODO{T-CH5-RESULTS}` in `chapter05/chap05.tex` (§5.5, two markers) — Tier-C/Tier-B active-credential validation campaign not yet run; RQ3 (lag), RQ4 (type↔rotation), RQ5 (active rate) pending provider authorization.
  - `\NOTEside{...}` in `chapter03/chap03.tex` (§ build/packaging files) — optional dedicated build-file breakdown if the paper provides one.
  - `\NOTEside{...}` in `chapter04/chap04.tex` — (a) optional related-work citations (Githru, Cortés Ríos, rebase/merge-conflict studies) to match the ASE paper depth; (b) ScanCode (Ombredanne) bib entry if explicit tool citation is wanted.
  - Boxed figure placeholders: Histories pipeline figure (`fig:hist-methodology-placeholder`) and Secrets pipeline figure (`fig:sec-pipeline`) — need drawn assets; do **not** reuse the Tags pipeline figure.
- **Tool references**: gitleaks, trufflehog, and CWE-798 are cited as footnote URLs (not bib entries). If a uniform citation style is required, add proper bib entries.
- **Follow-ups**: run the secret-validation campaign to fill RQ3/4/5; draw the two pipeline figures; optionally add ScanCode + the extra history related-work citations.

---

## Bibliography normalization map

Populated by task `P4` on 2026-05-04. Reconciles keys from `literature_reviews/Git_metadata_indicators_of_supply_chain_attacks.bib` and `literature_reviews/Git_mutability_and_supply_chain_integrity.bib` against `this.bib` and `swh.bib`.

### Confirmed duplicates (use existing key, do not import lit-review entry)

| Lit-review key | Title (short) | Existing key (location) |
|---|---|---|
| `Rap25` | Rapaport 2025 ASE — Altered Histories | `DBLP:conf/kbse/RapaportPTZ25` (`this.bib`) |
| `Pie19` | Pietri 2019 MSR — SWH Graph Dataset | `swh-msr2019-dataset` (`swh.bib`) |
| `Pie20` | Pietri 2020 MSR — SWH Graph Dataset (large-scale) | `swh-msr-2020-challenge` (`swh.bib`) |
| `Rou20` | Rousseau 2020 EMSE — Provenance | `swh-provenance-emse` (`swh.bib`) |
| `Cou22` | Courtès 2022 — Guix secure supply chain | `DBLP:journals/programming/Courtes23` (`this.bib`) — verify it is the same publication; existing entry is the journal version (programming/2023). |

### Likely duplicates — verify before deciding

| Lit-review key | Title (short) | Suspected existing key |
|---|---|---|
| `Rou19` | Rousseau 2019 ArXiv — Provenance Tracking at Scale | `swh-provenance-tr` (`swh.bib`) — confirm if the TR is the same as the ArXiv preprint; otherwise import the ArXiv version separately. |

### Entries to import on demand (proposed normalized keys)

Agents must verify each DBLP key against [https://dblp.org](https://dblp.org) before inserting. The proposed keys below follow the DBLP convention `DBLP:<type>/<venue>/<authorsYY>`; if the official DBLP key differs, **use the official DBLP key**, not the proposed one. For non-DBLP venues, use the descriptive `<lastauthor><year><shorttitle>` pattern already in `this.bib` (e.g., `ladisa2023supplychain`).

| Lit-review key | First author + year + venue | Proposed normalized key |
|---|---|---|
| `Tor16` | Torres-Arias 2016 USENIX Security — Omitting Commits | `DBLP:conf/uss/TorresAriasACC16` |
| `Yel25` | Yelgundhalli 2025 NDSS — gittuf | `DBLP:conf/ndss/YelgundhalliZCC25` |
| `Hol25` | Holtgrave 2025 NDSS — Attribution | `DBLP:conf/ndss/HoltgraveFFHBKFWWF25` (long author list — verify) |
| `Gon21` | Gonzalez 2021 ICSE-SEIP — Anomalicious | `DBLP:conf/icse/GonzalezZGS21` |
| `Gan23` | Ganz 2023 CODASPY — Backdoors in Collaboration Graphs | `DBLP:conf/codaspy/GanzAHR23` |
| `Prz25` | Przymus 2025 MSR — Wolves in the Repository (XZ) | `DBLP:conf/msr/PrzymusD25` |
| `Sha25` | Sharma 2025 EASE — Commit Signing on GitHub | `DBLP:conf/ease/SharmaKKB25` |
| `Zha25` | Zhang 2025 ICSE — GitHub Impersonation | `DBLP:conf/icse/ZhangLWWZLH25` |
| `Afz18` | Afzali 2018 AsiaCCS — le-git-imate | `DBLP:conf/asiaccs/AfzaliACC18` |
| `Afz20` | Afzali 2020 JCS — verifiable web Git | `DBLP:journals/jcs/AfzaliACC20` |
| `Afz22` | Afzali 2022 JCS — verifiable code review | `DBLP:journals/jcs/AfzaliACC22` |
| `Che14` | Chen Curtmola 2014 NDSS — AVCS | `DBLP:conf/ndss/ChenC14` |
| `Xu22` | Xu 2022 ICCCN — LiTIV | `DBLP:conf/icccn/XuWLYFW22` |
| `Sov25` | Soveizi 2025 SSE — Anomalous Commits | `DBLP:conf/sse/SoveiziCZZ25` |
| `Goy18` | Goyal 2018 — Unusual Commits on GitHub | `DBLP:journals/smr/GoyalFKH18` |
| `Tre17` | Treude 2017 ArXiv — Unusual Events | `DBLP:journals/corr/abs-1710-01943` |
| `Lei15` | Leite 2015 — UEDashboard | `leite2015uedashboard` (descriptive — short paper) |
| `Far23` | Farhi 2023 ArXiv — Security Patches | `DBLP:journals/corr/abs-2302-02112` |
| `He24` | He 2024 — Fake Stars on GitHub | `DBLP:journals/corr/abs-2412-XXXXX` (resolve ArXiv ID) |
| `Fry20` | Fry 2020 MSR — Identity Resolution | `DBLP:conf/msr/FryDKM20` |
| `Vai19` | Vaidya 2019 IFIP SEC — Commit Signatures | `DBLP:conf/sec/VaidyaTCC19` |
| `Zhu19` | Zhu Wei 2019 — Multiple names/emails | `zhu2019multiplenames` (descriptive) |
| `Yam16` | Yamak 2016 WWW — Multiple identity manipulation | `DBLP:conf/www/YamakSV16` |
| `Amr19` | Amreen 2019 ArXiv — ALFAA | `DBLP:journals/corr/abs-1901-03363` |
| `Amr19b` | Amreen 2019 — Dissertation | `amreen2019dissertation` (descriptive) |
| `Dey20` | Dey 2020 — Detecting bots | `DBLP:conf/msr/DeyMPFVFM20` |
| `Fli21` | Flint 2021 MSR — Time Pit | `DBLP:conf/msr/FlintCD21` |
| `Fli22` | Flint 2022 EMSE — Time-based Git data | `DBLP:journals/ese/FlintCD22` |
| `Bia14` | Biazzini 2014 ICSME — Topology of commit histories | `DBLP:conf/icsm/BiazziniMB14` |
| `Mic15` | Michaud 2015 — Branch origin detection | `michaud2015branchorigin` (descriptive — misc/thesis) |
| `Hav25` | Havryliak 2025 — LFS protocol security | `havryliak2025lfs` (descriptive — non-DBLP venue) |
| `Che25` | Chen 2025 S&P — Git LFS | `DBLP:conf/sp/ChenWYCLJ25` |
| `Vu21` | Vu 2021 ESEC/FSE — LastPyMile | `DBLP:conf/sigsoft/VuMPPS21` |
| `Lav23` | Lavoie 2023 ArXiv — 2P-BFT-Log | `DBLP:journals/corr/abs-2307-08381` |
| `Tow15` | Hayashi/Saeki 2015 — Towards analyzing rewriting | `hayashi2015rewriting` (descriptive — Japanese venue) |
| `Pai19` | Paixão Maia 2019 SCAM — Rebasing harmful | `DBLP:conf/scam/PaixaoM19` |
| `Neg12` | Negara 2012 ECOOP — Dangerous to use VCS histories | `DBLP:conf/ecoop/NegaraVCJD12` |
| `Gos20` | Goswami 2020 ICSME — NPM reproducibility | `DBLP:conf/icsm/GoswamiGLMY20` |
| `Gao24` | Gao 2024 PACMSE — PyRadar | `DBLP:journals/pacmse/GaoXYZ24` |
| `Imt22b` | Imtiaz Williams 2022 TSE — Code review coverage | `DBLP:journals/tse/ImtiazW22` |
| `Shi26` | Shittu 2026 — Analysis of Commit Signing | `shittu2026commitsigning` (descriptive — preprint) |
| `Zel13` | Zeller 2013 — Trust software repositories | `zeller2013trustrepos` (descriptive — book chapter) |
| `Cro09` | Crosby Wallach 2009 USENIX Sec — Tamper-evident logging | `DBLP:conf/uss/CrosbyW09` |
| `Sha02` | Shapiro Vanderburgh 2002 USENIX Sec — High-assurance CMS | `shapiro2002access` (descriptive — old, may not be on DBLP) |
| `Shi15` | Shirey 2015 HICSS — Encrypted Git | `DBLP:conf/hicss/ShireyHSHB15` |
| `Li25` | Li 2025 CCS — E2E Encrypted Git | `DBLP:conf/ccs/LiSTY25` |
| `Sca22` | Scalco 2022 ARES — Detecting injections in npm | `DBLP:conf/IEEEares/ScalcoPVM22` |
| `Kim23` | Kim 2023 ICTC — RepoJacking | `DBLP:conf/ictc/KimJLKK23` |
| `Hem18` | Hemel Coughlan 2018 IFOSSLR — Git in legal context | `hemel2018gitlegal` (descriptive — niche journal) |

### Open questions for the user

- **Q1**: For papers where I propose a DBLP key but cannot fetch DBLP, agents must look up the canonical key online before insertion. Confirm this is acceptable, or supply preferred keys yourself for the entries you want imported first.
- **Q2**: `Cou22` (lit review, ArXiv 2022) vs. `DBLP:journals/programming/Courtes23` (this.bib, journal 2023). They are likely the same paper but published in different venues. Confirm: should I cite the journal version everywhere?
- **Q3**: Does the `He24` (fake stars on GitHub) entry need a citation in the thesis? If yes, please supply the canonical ArXiv ID/DBLP key.

### Process

When an agent drafts a section that requires one of the unresolved entries:
1. Verify the proposed key against DBLP (or use the descriptive key if the venue is non-DBLP).
2. Insert the BibTeX entry into `this.bib` alphabetically by key, copying the lit-review entry's contents but rewriting the key.
3. Cite using the normalized key in the `.tex`.
4. If the key cannot be confirmed, fall back to a `\NOTEside{}` and log the gap as a chapter-specific item (do not silently use the lit-review's three-letter key).

---

## Frontmatter

### P5 — Frontmatter check — 2026-05-04

- **Target file**: `frontmatter/abstract.tex`, `frontmatter/dedication.tex`
- **Status**: done
- **What was produced**: confirmed both files are `\lipsum` placeholders.
  - `abstract.tex` is a placeholder. Added `T-FM-01` to `THESIS_PLAN.md`. **Agent-drafted task**, depending on Ch1 + Ch4 + Ch5 being substantially drafted.
  - `dedication.tex` is a placeholder. Added `T-FM-02` to `THESIS_PLAN.md` but marked it as **user-only** (a dedication is personal; no agent should draft it).
- **Verify**:
  - [ ] Confirm dedication is left to you (the user) and `T-FM-02` is not run by any agent.
  - [ ] Confirm the abstract should reflect the final scope (drop social engineering, mark Ch6 placeholder limits) — `T-FM-01` will follow this.
- **TODO markers introduced**: none.
- **Follow-ups**: write the dedication yourself when ready; trigger `T-FM-01` after Ch1, Ch4, Ch5 are at least `done-with-gaps`.

---

## Chapter 1 — Introduction

### P6 — Replace chap01.tex placeholder with scaffold — 2026-05-04

- **Target file**: `chapters/chapter01/chap01.tex`
- **Status**: done
- **What was produced**: replaced the cats/lipsum placeholder with a section/subsection scaffold matching `Thesis.md` § 1, minus the dropped social-engineering items (1.3.4 and 1.4.4). Each section/subsection contains a single `\TODO{}` line tagged with the corresponding `T-CH1-NN` task ID. Two explicit LaTeX comments mark the omitted 1.3.4 and 1.4.4 subsections.
- **Verify**:
  - [ ] Confirm the chapter labels (`chap:intro`, `sec:intro-*`, `subsec:intro-*`) are acceptable.
  - [ ] Confirm 1.3.4 ("Situating repository mutability within broader supply-chain threats") is dropped along with 1.4.4 (its companion social-engineering RQ subsection). If you want 1.3.4 reframed and kept (without the social-engineering subthread), tell an agent and I'll add it back.
  - [ ] The `\let\textcircled=\pgftextcircled` line at the top of the file was preserved from the previous placeholder; remove it later if unused in the actual prose.
- **TODO markers introduced**: 22 `\TODO{}` lines, one per section / subsection / chapter opening, all tagged with their drafting task ID for traceability.
- **Follow-ups**: drafting tasks `T-CH1-01` through `T-CH1-06` are now ready to run.

## Chapter 2 — Background

### SYNC-CH2-paper-reviews — Port background re-tagging additions from REP review — 2026-06-08

- **Target file**: `chapters/chapter02/chap02.tex`
- **Status**: done
- **What was produced**: ported the two background-level additions from the paper's post-review commit (`29a8174`) that were deferred during the Ch.3 sync:
  1. `subsec:bg-branches-tags-references`: added the distributed-design rationale for tag mutability (CVS/Subversion central revision IDs vs. independently-created refs reconciled at sync; name-uniqueness argument), with a forward `\Cref{subsec:tags-disc-practical}` to platform-level mitigations.
  2. `subsec:bg-force-pushes-reference-updates`: added the documented caution against re-tagging (`git-tag` manual "issue X.1 rather than force-update X" + Torvalds 2007 security argument), cites `git_tag_retagging_docs`, `torvalds_retagging_2007` (already in `this.bib`).
- **Verify**:
  - [ ] `latexmk` resolves the cross-chapter `\Cref{subsec:tags-disc-practical}` and the 2 cites.
  - [ ] Check the distributed-design paragraph does not overlap with `subsec:bg-local-remote-synchronization`.
- **Follow-ups**: optional `composer_retagging_issue` example was left out (not imported to `this.bib`); add if you want a second ecosystem anecdote here.

### P3 — Drop social-engineering section — 2026-05-04

- **Target file**: `chapters/chapter02/chap02.tex`
- **Status**: done
- **What was produced**: removed `\section{Social Engineering in Software Ecosystems}` (with its `\label{sec:bg-social-engineering}`) and its `\TODO{perhaps later} \lipsum[1]` body. Section ordering after this drop: 2.1–2.4 (existing), 2.5 Secrets, 2.6 Software Heritage, 2.7 Terminology.
- **Verify**:
  - [x] Confirm no other `.tex` file references `sec:bg-social-engineering`.
  - [x] Confirm `Thesis.md` outline drift is acceptable (`Thesis.md` is read-only; numbering in chap02 will not match `Thesis.md` §2.6 onwards).
- **TODO markers introduced**: none.
- **Follow-ups**: when drafting Chapter 1 (Research Questions, Research Objectives) and Chapter 7, ensure the social-engineering thread is also dropped (already noted in `THESIS_PLAN.md`).

### Bridge Ch2→Ch3 — 2026-05-05

- **Target file**: `chapters/chapter02/chap02.tex` (new `\section*{From background to methods}`, `\label{sec:bg-to-methods}`)
- **Status**: done
- **What was produced**: short unnumbered roadmap after the terminology block, pointing readers to Chapter~\ref{chap:methods} then Chapters~\ref{chap:tags} and~\ref{chap:histories}.
- **Verify**:
  - [ ] If your thesis style forbids `\section*` before `\mainmatter` or requires all sections numbered, switch to a closing `\paragraph` inside §2.7 instead.
- **TODO markers introduced**: none.

## Chapter 3 — Methods

### T-CH3-01..07 — Full chapter draft (thesis-level methods) — 2026-05-05

- **Target file**: `chapters/chapter03/chap03.tex`
- **Status**: done
- **What was produced**: drafted §3.1--3.7 as thesis-level methodology only; defers pipeline detail to `sec:tags-methodology` / `sec:hist-methodology` (Ch.5). Ends with `\section*{Transition to the empirical chapters}` (`\label{sec:meth-transition-empirical}`) leading into Chapter~\ref{chap:tags}. Cross-references Chapters~\ref{chap:background}, \ref{chap:tags}, \ref{chap:histories}, \ref{chap:secrets}.
- **Verify**:
  - [x] Compile once: confirm all `\ref`/`\Cref` to Ch.4--5 labels resolve (Chapter~5 is now drafted in `chap05.tex`).
  - [x] Chapter~5 `sec:hist-methodology` opens with a mirror paragraph pointing back to Chapter~\ref{chap:methods} (same pattern as Chapter~\ref{chap:tags}).
- **TODO markers introduced**: none.
- **Follow-ups**: keep Ch.3 stable; if Ch.4/5 methodology text grows, delete duplicated prose there rather than expanding Ch.3.

## Chapter 4 — Mutable Tags and Release Integrity

### CH3-paper-alignment — Paper alignment and `\NOTEside{new}` tagging — 2026-06-09

- **Target file**: `chapters/chapter03/chap03.tex`
- **Status**: done-with-gaps
- **What was produced**: From `\section{Related Work}` through `\section{Conclusion}`, aligned body text against `contributions/tag-alterations-paper/{related,methodology,results,discussion,conclusion}.tex`. Restored missing paper content (positioning paragraph, Rapaport et al.\ altered-histories comparison, supply-chain attack framing). Reverted unnecessary paraphrase to track paper wording. Added **113** `\NOTEside{new}` margin tags on every passage that differs from the paper (including allowed thesis edits: cross-refs, voice, section labels). Introduction (lines 12–69) unchanged.
- **Verify**:
  - [ ] Compile and scan margin notes: green `\NOTEside{new}` blocks mark deliberate departures; untagged paragraphs should be verbatim paper text.
  - [ ] Spot-check Related Work: restored Rapaport/\Cref{chap:histories} positioning vs. thesis-only citations (`torresarias2016gitmetadata`, mining-history refs).
  - [ ] Spot-check Methodology: thesis-only blocks (`subsec:tags-research-design`, `subsec:tags-scope-limits`, figure placeholders) still read correctly with tags.
  - [ ] Spot-check Results sections: paper order preserved inside thesis section boundaries (Prevalence / Taxonomy / Popularity / Implications).
  - [ ] Spot-check Discussion + Threats: expanded validity paragraphs match paper; subsection splits still navigable.
  - [ ] Spot-check Conclusion: paper conclusion restored; final bridge to `\Cref{chap:histories}` tagged as new.
  - [ ] Confirm `borges-2016-github-stars` cite resolves in `this.bib` (added to `this.bib` from paper bib).
- **TODO / NOTE markers introduced**:
  - `\NOTEside{new}` — 113 instances from Related Work through Conclusion (audit trail for paper vs. thesis text).
  - `\NOTEside{If the paper provides...}` — unchanged at `subsec:tags-build-packaging` (evidence gap, not alignment tag).
- **Follow-ups**: after review, remove `\NOTEside{new}` tags from passages you accept as final; optionally restore popularity bucket breakdown numbers removed when aligning RQ3 prose to paper.

### DEDUP-CH2-CH4 — Remove Background/Chapter-3 redundancy, cross-reference instead — 2026-06-08

- **Target files**: `chapters/chapter03/chap03.tex`, `chapters/chapter02/chap02.tex`
- **Status**: done
- **Principle applied**: Background (Ch.2) owns the general Git / Software Heritage concepts; Chapter 3 references them rather than re-explaining. Conversely, where Background previewed a Chapter 3 empirical result in detail, that was converted to a forward pointer.
- **Chapter 3 edits** (concept re-explanations trimmed + back-references added):
  - Intro: removed the re-definition of lightweight/annotated tag kinds; now points to `subsec:bg-branches-tags-references`.
  - Methodology (research design): removed the re-explanation of how Software Heritage visits origins / assigns SWHIDs; now points to `sec:bg-software-heritage` (kept the SWHID acronym intro).
  - Methodology (three-layer model): cross-referenced `subsec:bg-apparent-immutability`.
  - Methodology (detection): replaced the tag-kind re-definition with a pointer to `subsec:bg-branches-tags-references`; move/deletion detection now points to the conceptual definition in `subsec:bg-force-pushes-reference-updates`.
  - Methodology (Nix case study): trimmed the re-explanation of Nix fixed-output + binary-cache mechanism; now points to `subsec:bg-stable-references-dependency-resolution`.
- **Chapter 2 edits**:
  - `subsec:bg-stable-references-dependency-resolution`: the detailed Nixpkgs-result preview replaced with a forward pointer to `subsec:tags-reproducibility`.
  - `subsec:bg-tags-release-identifiers`: structural-mismatch framing now points forward to `subsec:tags-stability-assumptions`.
- **Left intentionally (not redundant)**: Chapter 3 Related Work's Nix/reproducibility discussion (prior-literature positioning, distinct from Background's mechanism explanation); the repeated "lower-bound" caveat (chapter's own methodological discipline); the operational move/deletion definition (needed for the algorithm).
- **Verify**:
  - [ ] `latexmk`: confirm all new cross-chapter `\Cref`s resolve and no concept is now used before introduction.
- **Follow-ups**: none blocking.

### RESTRUCT-CH4-rq-order — Reorder empirical sections to RQ1→RQ4, merge taxonomy+characterization — 2026-06-08

- **Target file**: `chapters/chapter03/chap03.tex`
- **Status**: done
- **What was produced**: fixed three structural defects relative to the paper:
  1. **RQ answering order**: empirical sections now follow RQ1→RQ2→RQ3→RQ4. New order: §Prevalence and Evolution (RQ1, `sec:tags-prevalence`) → §Taxonomy and Characterization (RQ2, `sec:tags-taxonomy`) → §Popularity and Tag Alterations (RQ3, new `sec:tags-popularity`) → §Implications for Release Integrity (RQ4, `sec:tags-implications`). Previously the body answered RQ1, RQ3, RQ2, RQ4.
  2. **De-duplication**: merged the standalone Taxonomy section with the old Characterization (RQ2) section. Dropped the redundant `subsec:tags-changes-nature` (it restated the deletion-dominance and content-majority numbers already in RQ1/taxonomy); folded its one unique nuance into a new RQ2 section intro. `Build and Packaging Files` and `Implications for Released Artifacts` subsections moved under the merged RQ2 section.
  3. **Ordering inversion**: prevalence (headline magnitude) now precedes the move taxonomy, instead of following it.
- **Label changes**: dropped `sec:tags-characterization` and `subsec:tags-changes-nature` (confirmed unreferenced anywhere in the thesis). Added `sec:tags-popularity`. RQ3 content promoted from `subsec:tags-project-eco` to its own section. All other labels (figures, tables, subsections) preserved. Intro roadmap rewritten + explicit RQ-to-section mapping sentence added.
- **Verify**:
  - [ ] `latexmk` once: confirm no undefined references and that figure/table floats still place sensibly under the new order.
  - [ ] Read the new RQ2 section intro for overlap with the subsection bodies.
- **Follow-ups**: none blocking. Related Work remains at the front (kept deliberately; paper moved it to the end, but front placement is fine for a thesis chapter with a separate Background chapter).

### SYNC-CH4-paper-reviews — Resync with REP camera-ready review changes — 2026-06-08

- **Target file**: `chapters/chapter03/chap03.tex` (+ `this.bib`)
- **Status**: done
- **What was produced**: brought the chapter in sync with the paper's post-review commit (`29a8174`). Three additions, paraphrased rather than pasted, with light "this thesis" voice:
  1. §attack case (`subsec:tags-attack-case`): added the `tj-actions/changed-files` payload (CI-runner memory dump leaking env vars/secrets), the fact that pinning a specific tag (`v39`/`v47`) did not protect consumers, and the operational remediation (audit logs, rotate credentials, repin to commit hashes).
  2. §practical implications (`subsec:tags-disc-practical`): added the record-both (tag name + resolved hash) compromise and the 2025 Go modules `google/go-containerregistry` re-tagging incident (`v0.20.4` deleted/recreated → `go.sum` checksum mismatch → `v0.20.5`).
  3. §related work (`subsec:tags-rw-refs-integrity`): added the `git-tag` manual "insane" re-tagging warning and the 2007 Torvalds security argument.
- **Bib**: added `git_tag_retagging_docs`, `torvalds_retagging_2007`, `go_containerregistry_retagging_issue` to `this.bib` (copied from paper's `tag_alteration.bib`, keys unchanged to match existing `github_*`/`paloalto_unit42_2025` style).
- **Scope note**: the paper's background.tex changes (CVS/SVN-vs-Git re-tagging framing, `composer_retagging_issue`) were intentionally skipped per request; they belong to the thesis background chapter (`chap02`) if wanted later.
- **Verify**:
  - [ ] Read the three new passages for voice overlap with the paper; trim if any reads like a paste.
  - [ ] Confirm `latexmk` resolves the 3 new `\cite` keys.
  - [ ] Optional: port the git-tag/Torvalds re-tagging guidance into `chap02` background if you want it there too.
- **Follow-ups**: none blocking.

### T-CH4-01..10 — Full chapter draft (mutable tags) — 2026-05-05

- **Target file**: `chapters/chapter04/chap04.tex`
- **Status**: done-with-gaps
- **What was produced**: drafted all sections 4.1--4.10 in one pass. Introduction foregrounds mutability, integrity, provenance, and supply-chain trust; reproducibility is treated as a downstream consequence where hash-disciplined builds surface drift. Conclusion opens explicitly toward Chapter~\ref{chap:histories} (commit-graph / history alteration). Empirical numbers and methodology are aligned with~\cite{rapaport2026tagalterations} (same underlying study). **Update 2026-05-05:** opening of `sec:tags-methodology` now points to Chapter~\ref{chap:methods} for shared sampling/validity and keeps tag-specific operational detail local.
- **Verify**:
  - [ ] Read for voice overlap with the REP paper; trim if any paragraph still reads like a paste.
  - [ ] Confirm all cited keys resolve in `this.bib` + `swh.bib` (`ProGit2014`, `swhcacm2018`, `cise-2020-doi` live in `swh.bib`).
  - [ ] Decide whether to add `figures/popularity_star_count.png` as a third popularity figure (not yet included).
  - [ ] Replace the boxed placeholder at `fig:tags-nix-hash-mismatch-placeholder` with a real transcript screenshot or a `minted`/`listings` environment once you are happy with redaction.
- **TODO / NOTE markers introduced**:
  - `\NOTEside{...}` in §4.6 (build-file breakdown): asks for path-specific counts from the paper or an extended miner.
  - `\NOTEside{...}` in §4.8 (attack case): asks for an external advisory URL if your graduate school requires non-self citations for incidents.
- **Figures included**:
  - `fig:tags-workflow-pipeline` — `\input{figures/workflow_pipeline.drawio.pdf_tex}` (vector).
  - `fig:tags-move-schematic` — `\input{figures/tag_alteration.drawio.pdf_tex}` (vector).
  - `fig:tags-temporal-evolution` — `temporal_evolution.png` (raster; `.svg` exists if you switch to vector build).
  - `fig:tags-popularity-volume` / `fig:tags-popularity-proportion` — `popularity.png`, `popularity_proportion.png`.
  - `fig:tags-nix-hash-mismatch-placeholder` — **placeholder**: described content for a terminal transcript; no image file yet.
- **Follow-ups**: harmonise axis labels on temporal/popularity plots with final thesis style; add optional `popularity_star_count.png`; run `latexmk` once to confirm `pdf_tex` paths from `main.tex` root.

## Chapter 5 — History Alterations

### T-CH5-01..10 — Full chapter draft (altered histories) — 2026-05-05

- **Target file**: `chapters/chapter05/chap05.tex`
- **Status**: done-with-gaps
- **What was produced**: drafted all sections 5.1--5.10 in one pass. Introduction bridges from Chapter~\ref{chap:tags} to commit-graph mutability; `sec:hist-methodology` mirrors Chapter~\ref{chap:tags} by pointing to Chapter~\ref{chap:methods} for shared sampling/validity. Empirical numbers and branch excerpts follow~\cite{DBLP:conf/kbse/RapaportPTZ25}; GitHistorian and replication materials cite~\cite{replication-package}. Section~5.6 foregrounds the license case study and only previews secret suppression toward Chapter~\ref{chap:secrets}, per plan.
- **Verify**:
  - [ ] Cross-check Table~I row values in `tab:hist-branch-categories` against your camera-ready ASE PDF (only selected rows are typeset; caption says so).
  - [ ] Confirm ``\num{13000000}'' / ``\num{75000}'' secret-removal aggregates match the final paper wording (million-scale rounding vs exact integers).
  - [ ] Replace `fig:hist-methodology-placeholder` with the real methodology figure export or a redrawn equivalent (avoid reusing the tag pipeline figure without relabelling).
- **TODO / NOTE markers introduced**:
  - `\NOTEside{...}` in §5.6 (license tooling): asks for an explicit ScanCode / tool bib entry if required.
  - `\NOTEside{...}` in §5.7 (GitHistorian): asks for an optional verbatim CLI transcript from replication materials.
- **Figures included**:
  - `fig:hist-methodology-placeholder` — **placeholder** boxed minipage (pipeline figure deferred; distinct from Chapter~4 tag workflow).
- **Follow-ups**: optional `Git_metadata_indicators_of_supply_chain_attacks.md` cross-cites if you want stronger positioning vs metadata attacks; regenerate methodology figure asset for thesis branding.

## Chapter 6 — Secret Removal

### T-CH6-REWRITE — Short unfinished-study rewrite — 2026-06-22

- **Target file**: `chapters/chapter05/chap05.tex`
- **Status**: done-with-gaps
- **What was produced**: Rewrote Chapter 5 as a shorter secret-removal chapter grounded in `contributions/secrets_removal`. The chapter now separates implemented detection/provenance results from the planned active-credential validation campaign, adds three boxed figure placeholders, and expands the conclusion into a perspectives section for the unfinished work.
- **Verify**:
  - [ ] Confirm the new title, `Secret Removal in Version Control Archives`, is preferred over the previous `Active Secrets in Version Control Archives`.
  - [ ] Confirm that the three `\NOTEside{interpretation}` markers identify the passages you want to review.
  - [ ] Build the document after drawing or accepting the boxed placeholders.
- **TODO markers introduced**:
  - `\TODO{T-CH5-RESULTS: run or document the Tier A/B/C validation campaign before claiming active, revoked, or rotated credential counts.}` in §5.5 — active-credential validation has not been executed in `contributions/secrets_removal`.
  - `\TODO{T-CH5-REPRO: record run date, scanner versions, PostgreSQL export count, and resolve the downloaded-vs-scanned blob-count discrepancy before final submission.}` in §5.6 — `RESULTS.md` still marks run metadata and one funnel count as pending.
  - `\NOTEside{interpretation}` in the introduction — interprets repository rewriting as acting on the wrong security object.
  - `\NOTEside{interpretation}` in early results — interprets the 9.18% hit rate as conditional on the filtered/downloaded blob population.
  - `\NOTEside{interpretation}` in perspectives — interprets the current evidence as showing repository-level removal without credential-level remediation.
- **Follow-ups**: Fill validation results only after the Tier A/B/C campaign exists; stabilise run metadata; draw the pipeline, attrition funnel, and validation-flow figures.

## Chapter 7 — Conclusion and Future Work

_(empty)_

---

## Cross-cutting / global notes

_(use this section for items that span multiple chapters: terminology drift, figure regeneration, a contribution paper revision, etc.)_
