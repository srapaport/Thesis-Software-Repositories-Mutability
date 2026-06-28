# Thesis Drafting Plan

Master, agent-runnable plan for drafting the PhD thesis. Read [`/.cursor/rules/thesis-drafting-workflow.mdc`](.cursor/rules/thesis-drafting-workflow.mdc) before starting any task.

This file is gitignored. Agents update it after every run. Users may edit it freely.

---

## Structural update — 2026-06-01 (methods chapter dissolved + renumber)

Major restructure executed in one holistic pass (not the one-task-per-run convention), per explicit user request to redistribute the Methods chapter and achieve full paper coverage.

- **Methods chapter deleted.** Old `chapters/chapter03` (Methods) removed entirely. Its cross-cutting framing now lives in the Ch3 (Tags) methodology and the Ch2 "from background to the empirical chapters" bridge.
- **Chapters renumbered** (dirs + files renamed, `main.tex` imports updated): Tags `chapter04→chapter03`, Histories `chapter05→chapter04`, Secrets `chapter06→chapter05`, Conclusion `chapter07→chapter06`. `memoir` auto-renumbers displayed numbers; all `chap:*` labels are name-based and survive.
- **Tags (now Ch3)** carries the thesis' thorough, self-contained methodology and exhaustive coverage of `git_tag_alterations.pdf` (filter cascade, Tables 1/2/3/4 inlined, RQ3 popularity numbers, tj-actions case, Nixpkgs cross-analysis with Nix hash-mismatch transcript, GitHub immutable releases, full threats/related work/future work).
- **Histories (now Ch4)** methodology opens by citing `\Cref{sec:tags-methodology}` for the shared snapshot-pair stance and details only the differences (commit-reachability differencing, Merkle DAG, root-cause commits, 10-generation horizon). Exhaustive coverage of `altered_histories.pdf` (RQ1–4 numbers, branch unification, root-cause taxonomy table, top-20 filenames, secret + license case studies, GitHistorian, 5 discussion subsections, threats).
- **Secrets (now Ch5)** is no longer placeholder. Fully drafted from `contributions/secrets_removal` and rewritten shorter on 2026-06-22 around the implemented detection/provenance pipeline, current early counts, validation protocol, threats, and a long perspectives section. **Real detection numbers** now follow `RESULTS.md`: 365,591,843 input rows → 2,846,017 filename-filtered pairs → 2,187,481 resolved pairs → 281,728 downloaded blobs → 25,859 blobs with findings = 9.18%. **Tier A offline validation for private keys** added 2026-06-27 from `private_key_validation.ipynb` / `validate_private_keys.py`: 11,613 unique blobs validated; 10,038 parse as valid offline (86.4% of gitleaks-flagged blobs). Tier B/C active-credential validation remains pending (`\TODO{T-CH5-RESULTS}` partial); reproducibility metadata also remains pending (`\TODO{T-CH5-REPRO}`).
- **Bibliography**: merged 5 secrets refs from `protocol/bib.bib` into `this.bib` and resolved `yadmani2025` (El Yadmani et al., IEEE S&P 2025, DOI 10.1109/SP61157.2025.00009) from the web. Added `\usepackage{multirow}` to `main.tex` (needed by the Ch4 root-cause table). gitleaks/trufflehog/CWE-798 cited as footnote URLs; ScanCode flagged with `\NOTEside` in Ch4.
- **Figures**: Tags reuses existing assets (`workflow_pipeline`, `tag_alteration`, `temporal_evolution`, `popularity*`). Histories and Secrets pipeline figures remain boxed placeholders (no fabricated assets).
- **No commits** made; user reviews and commits.

The per-task tables below retain the *old* chapter numbering for history; statuses updated where the restructure changed them. Treat this section as authoritative for current structure.

## Locked decisions

- **Scope**: draft Chapters 1–6 fully (was 1–7 before the methods chapter was dissolved). **Drop social engineering everywhere** (RQs in Ch1, conclusion sub-thread, future-work item, etc.). **Ch5 (Secret Removal)** is drafted from `contributions/secrets_removal` as an unfinished-study chapter; Tier A private-key offline filtering is reported (2026-06-27); Tier B/C active validation and final reproducibility metadata remain pending (`\TODO`).
- **Granularity**: one task = one top-level section (e.g., "4.3 Chapter-Specific Methodology").
- **Bibliography**: agents merge needed entries from `literature_reviews/*.bib` into `this.bib` on demand, normalized to the long-form DBLP-style keys already used in `chap02.tex`. `\bibliography{this,swh}` in `main.tex` stays unchanged. See `REVIEW_QUEUE.md` § "Bibliography normalization map" for the resolved key map produced by `P4`.
- **Missing evidence**: agent inserts `\TODO{}` / `\NOTEside{}` inline, drafts what is supportable, logs the gap in `REVIEW_QUEUE.md`, marks task `done-with-gaps`.
- **Commits**: agents never commit. User reviews and commits manually.
- **Read-only**: `Thesis.md`, `models/`, frontmatter cover PDFs, dedication.

## Status legend

- `pending` — not started; agent may pick if dependencies cleared.
- `in-progress` — currently being worked on.
- `done` — completed cleanly, no `\TODO` markers introduced.
- `done-with-gaps` — completed, `\TODO`/`\NOTEside` markers present; review item logged.
- `blocked` — agent stopped because of missing input or unresolvable ambiguity. See review queue.
- `user-only` — task is reserved for the human user; agents must not pick it.

## Agent contract (one run = one task)

1. Read this file.
2. If user named a task ID, work that. Otherwise pick the topmost `pending` task with all dependencies `done`/`done-with-gaps`.
3. Mark `status: in-progress`, record `started: <ISO timestamp>`.
4. Read declared `inputs`.
5. Edit only the listed `target_file`. Bibliography edits in `this.bib` are permitted per the bibliography rule.
6. Append a review item to `REVIEW_QUEUE.md`.
7. Update `status` and `output_notes`. Record `finished: <ISO timestamp>`.
8. Stop.

## Task ID convention

- `P<N>` — prep task.
- `T-CH<N>-<NN>` — drafting task for Chapter N, section NN (e.g., `T-CH4-03` = Chapter 4, Section 3 from the outline).
- `T-FM-<NN>` — frontmatter task (abstract, dedication).

---

## Prep tasks

### P1 — Bootstrap workflow files

- **target_file**: `.gitignore`, `THESIS_PLAN.md`, `REVIEW_QUEUE.md`, `.cursor/rules/thesis-drafting-workflow.mdc`
- **status**: done
- **dependencies**: —
- **output_notes**: created plan + review queue + rule; `.gitignore` updated to ignore the two `.md` workflow files
- **started**: 2026-05-04
- **finished**: 2026-05-04

### P2 — Create chapter scaffolds and wire into main.tex

- **target_file**: `chapters/chapter03..07/chapXX.tex`, `main.tex`
- **status**: done
- **dependencies**: P1
- **output_notes**: created `chap03.tex`–`chap07.tex` with section/subsection skeletons matching `Thesis.md` (minus social engineering); wired all five into the `\import` block of `main.tex`. Each section is a single `\TODO{}` line tagged with the corresponding drafting task ID.
- **started**: 2026-05-04
- **finished**: 2026-05-04

### P3 — Drop social engineering from chap02.tex

- **target_file**: `chapters/chapter02/chap02.tex`
- **status**: done
- **dependencies**: P1
- **output_notes**: removed `\section{Social Engineering in Software Ecosystems}` block; verified no other file references `sec:bg-social-engineering`. Section ordering after this drop: 2.1–2.4 (existing), 2.5 Secrets, 2.6 Software Heritage, 2.7 Terminology.
- **started**: 2026-05-04
- **finished**: 2026-05-04

### P4 — Bibliography pre-pass

- **target_file**: `REVIEW_QUEUE.md` (no edit to `this.bib`)
- **status**: done
- **dependencies**: P1
- **output_notes**: produced normalization map in `REVIEW_QUEUE.md` § "Bibliography normalization map". Identified 5 confirmed duplicates with existing `this.bib`/`swh.bib` entries, 1 likely duplicate to verify, 50+ entries to import on demand with proposed normalized keys, and 3 open user questions.
- **started**: 2026-05-04
- **finished**: 2026-05-04

### P5 — Frontmatter decision

- **target_file**: `REVIEW_QUEUE.md`
- **status**: done
- **dependencies**: P1
- **output_notes**: confirmed `abstract.tex` and `dedication.tex` are `\lipsum` placeholders. Added `T-FM-01` (abstract, agent-drafted) and `T-FM-02` (dedication, **user-only**) to this plan.
- **started**: 2026-05-04
- **finished**: 2026-05-04

### P6 — Replace chap01.tex placeholder with structured scaffold

- **target_file**: `chapters/chapter01/chap01.tex`
- **status**: done
- **dependencies**: P1
- **output_notes**: replaced the cats/lipsum placeholder with a section/subsection scaffold matching `Thesis.md` § 1, minus the dropped social-engineering items (1.3.4 and 1.4.4). Each section/subsection carries a single `\TODO{}` line tagged with the corresponding `T-CH1-NN` task. Chapter labels preserved (`chap:intro`); section/subsection labels follow the `sec:intro-*` / `subsec:intro-*` pattern. Pre-existing `\let\textcircled=\pgftextcircled` typography line preserved. Two LaTeX comments mark the omitted 1.3.4 / 1.4.4 subsections so future readers know the omission is deliberate.
- **started**: 2026-05-04
- **finished**: 2026-05-04

---

## Frontmatter tasks

### T-FM-01 — Abstract

- **target_file**: `frontmatter/abstract.tex`
- **status**: pending
- **dependencies**: T-CH1-05 (Thesis Contributions), T-CH4-10 (Ch4 Conclusion), T-CH5-10 (Ch5 Conclusion); soft dependency on T-CH6-09 once Ch6 is no longer in placeholder mode
- **inputs**: `chapters/chapter01/chap01.tex`, `chapters/chapter04/chap04.tex`, `chapters/chapter05/chap05.tex`, `contributions/altered_histories.pdf`, `contributions/git_tag_alterations.pdf`
- **scope**: replace `\lipsum[2]` with a single-page abstract following the IP Paris guidelines. Keep the `\initial{}` first-letter pattern intact. Reflect: dropped social-engineering scope, Ch6 placeholder limitation.

### T-FM-02 — Dedication and Acknowledgements

- **target_file**: `frontmatter/dedication.tex`
- **status**: user-only
- **dependencies**: —
- **inputs**: —
- **scope**: **agents must not edit this file.** The user writes their own dedication and acknowledgements.

---

## Chapter 1 — Introduction

Default inputs for all Ch1 tasks:
- `contributions/altered_histories.pdf` (intro and discussion)
- `contributions/git_tag_alterations.pdf` (intro and discussion)
- `literature_reviews/Git_mutability_and_supply_chain_integrity.md`
- `literature_reviews/Git_metadata_indicators_of_supply_chain_attacks.md`

Target file: `chapters/chapter01/chap01.tex` (scaffold prepared by `P6`; agents replace each `\TODO{}` line with prose for the corresponding section/subsection). All Ch1 tasks depend on `P2` and `P6`.

| ID | Section | Status | Extra dependencies | Notes |
|---|---|---|---|---|
| T-CH1-01 | 1.1 Context and Motivation | pending | — | open-source as critical infrastructure; trust anchors; integrity assumptions |
| T-CH1-02 | 1.2 Problem Statement | pending | T-CH1-01 |
| T-CH1-03 | 1.3 Research Objectives | pending | T-CH1-02 | three sub-objectives only: 1.3.1 mutable releases, 1.3.2 altered histories, 1.3.3 secret removal. **Drop 1.3.4 (social engineering)**. |
| T-CH1-04 | 1.4 Research Questions | pending | T-CH1-03 | RQs for tag, history, secret threads only. **Drop 1.4.4 (social engineering RQs)**. Use `\begin{researchquestion}...\end{researchquestion}` from `main.tex`. |
| T-CH1-05 | 1.5 Thesis Contributions | pending | T-CH1-04 | empirical, methodological, practical. Cite `DBLP:conf/kbse/RapaportPTZ25` and `rapaport2026tagalterations`. |
| T-CH1-06 | 1.6 Thesis Structure | pending | T-CH1-01..05 | preview each subsequent chapter; reference `\Cref{chap:background,chap:methods,chap:tags,chap:histories,chap:secrets,chap:conclusion}`. |

## Chapter 2 — Background

Existing partial draft. Most subsections already drafted; tasks are **review/polish** unless flagged "full draft". Target file: `chapters/chapter02/chap02.tex`. All Ch2 tasks depend on `P3`. Section numbering in chap02.tex no longer aligns with `Thesis.md` for §2.5+ because of the social-engineering drop; **agents follow the chap02.tex numbering, not `Thesis.md` numbering**, for Ch2 only.

Default inputs for all Ch2 tasks: existing chap02.tex content, `literature_reviews/*.md` (especially the Git-mutability and Git-metadata packs).

| ID | Section | Status | Notes |
|---|---|---|---|
| T-CH2-01 | 2.1 Git Repositories as Versioned Software Artifacts | pending | review/polish; resolve the `\NOTEside{Add a foundational citation on Git's distributed model...}` |
| T-CH2-02 | 2.2 Mutability in Git | pending | review/polish; resolve `\NOTEside{Add citation for non-fast-forward rejection defaults...}` |
| T-CH2-03 | 2.3 Releases, Provenance, and Reproducibility | pending | review/polish; resolve the three `\NOTEside`s (release-tag conventions, package-manager Git refs, Nix fixed-output documentation) |
| T-CH2-04 | 2.4 Software Repositories in the Software Supply Chain | pending | review/polish; resolve `\NOTEside{Add citation(s) on repository-centric software supply chains...}` |
| T-CH2-05 | 2.5 Secrets in Source Code Repositories | done | **full draft** (2026-06-25): replaced `\TODO`/`\lipsum` with three subsections (detection/prevention, remediation hierarchy) and expanded `\subsec:bg-secret-removal` in Terminology; bridges to Ch4/Ch5. No new `\TODO` markers. |
| T-CH2-06 | 2.6 Software Heritage and Archival Observation | pending | review/polish; minor — already substantially drafted |
| T-CH2-07 | 2.7 Terminology and Conceptual Scope | pending | review/polish; uncomment and finish the `Supply-Chain Threats` subsection at the end of the file. **Remove the cross-reference to `\Cref{sec:bg-secrets}`** if §2.5 is in the same chapter and resolves the reference (preserve label). |

## Chapter 3 — Methods  [REMOVED 2026-06-01]

**This chapter has been deleted.** Its content was redistributed (see the 2026-06-01 structural update at the top). `chapters/chapter03` now holds the **Tags** chapter. The `T-CH3-*` tasks below are obsolete and retained only for history.

Original target file: `chapters/chapter03/chap03.tex` (Methods). All Ch3 tasks depend on `P2`.

Default inputs for all Ch3 tasks:
- Methods sections of `contributions/altered_histories.pdf` and `contributions/git_tag_alterations.pdf`
- `Thesis.md` § 3
- Both `literature_reviews/*.md` packs (for methodological references like Software Heritage as data source, time-based Git pitfalls, etc.)

**Bulk draft (2026-05-05):** Sections 3.1--3.7 drafted in one pass. Thesis-level only: operational detail remains in Chapters 4 and 5 (chapter-specific methodology sections). End-of-chapter transition points to Chapter 4. Chapter 2 gains a short unnumbered ``From background to methods'' bridge before the commented-out supply-chain subsection.

| ID | Section | Status | Notes |
|---|---|---|---|
| T-CH3-01 | 3.1 Research Design | done | points forward to Ch.4--6 |
| T-CH3-02 | 3.2 Data Sources | done | SWH + supplementary (Nixpkgs, GitHistorian) at high level |
| T-CH3-03 | 3.3 Common Analytical Principles | done | snapshot pairs; detect vs characterise |
| T-CH3-04 | 3.4 Sampling and Inclusion Criteria | done | defers numeric filters to empirical chapters |
| T-CH3-05 | 3.5 Validation Strategies | done | |
| T-CH3-06 | 3.6 Ethical, Legal, and Responsible Research Considerations | done | Ch6 placeholder flagged |
| T-CH3-07 | 3.7 Threats to Validity at the Thesis Level | done | |

## Chapter 4→3 — Mutable Tags and Release Integrity  [now Ch3]

Primary input: `contributions/git_tag_alterations.pdf`. Target file: **`chapters/chapter03/chap03.tex`** (renamed from `chapter04/chap04.tex` on 2026-06-01). Reuse figures: `figures/tag_alteration.drawio.*` (with `.pdf_tex`), `figures/popularity.png`, `figures/popularity_proportion.png`, `figures/temporal_evolution.*`.

**Rewrite (2026-06-01):** Chapter fully rewritten to (a) carry the thesis' thorough, self-contained methodology (research design, observational stance, data collection with full filter cascade, detection, classification, popularity method, case-study/Nixpkgs design, scope) and (b) exhaustively cover `git_tag_alterations.pdf`: Tables 1–4 inlined as LaTeX tables, RQ3 popularity volume + proportion numbers, the `tj-actions`/`zendesk` attack case, the Nixpkgs cross-analysis with the `libv3270` hash-mismatch transcript, GitHub immutable releases, and construct/internal/external/conclusion validity. Remaining gap: one `\NOTEside` on a build-file breakdown.

| ID | Section | Status | Source in PDF |
|---|---|---|---|
| T-CH4-01 | 4.1 Introduction | done-with-gaps | §1 of `git_tag_alterations.pdf` |
| T-CH4-02 | 4.2 Related Work | done-with-gaps | §2 of `git_tag_alterations.pdf` + `Git_mutability_and_supply_chain_integrity.md` |
| T-CH4-03 | 4.3 Chapter-Specific Methodology | done-with-gaps | §3 of `git_tag_alterations.pdf` |
| T-CH4-04 | 4.4 Taxonomy of Tag Alterations | done-with-gaps | §4 of `git_tag_alterations.pdf`; reuse `figures/tag_alteration.drawio.svg` |
| T-CH4-05 | 4.5 Prevalence and Distribution of Tag Alterations | done-with-gaps | §5 of `git_tag_alterations.pdf`; reuse `figures/popularity*.png`, `figures/temporal_evolution.*` |
| T-CH4-06 | 4.6 Characterization of Altered Releases | done-with-gaps | §6 of `git_tag_alterations.pdf` |
| T-CH4-07 | 4.7 Implications for Release Integrity | done-with-gaps | §7/Discussion of `git_tag_alterations.pdf` (Nixpkgs cross-analysis) |
| T-CH4-08 | 4.8 Discussion | done-with-gaps | Discussion of `git_tag_alterations.pdf` |
| T-CH4-09 | 4.9 Threats to Validity | done-with-gaps | Threats section of `git_tag_alterations.pdf` |
| T-CH4-10 | 4.10 Conclusion | done-with-gaps | bridge to `\Cref{chap:histories}` |

## Chapter 5→4 — History Alterations in Public Git Repositories  [now Ch4]

Primary input: `contributions/altered_histories.pdf`. Target file: **`chapters/chapter04/chap04.tex`** (renamed from `chapter05/chap05.tex` on 2026-06-01).

**Rewrite (2026-06-01):** Methodology now opens by citing `\Cref{sec:tags-methodology}` for the shared snapshot-pair stance and details only the differences (commit-reachability differencing, Merkle DAG/snowball, root-cause commits, branch unification, 10-generation horizon, case-study design). Exhaustive coverage of `altered_histories.pdf`: RQ1 (12,542,848,352 alterations / 8,720,085 root-cause / 1,218,547 repos), branch unification + category tables, root-cause taxonomy table (META/DIR counts), category distribution (all vs 1000+), top-20 altered filenames, secret + license case studies, full GitHistorian (design/CLI/transcript), 4 discussion subsections, construct/external threats. Gaps: boxed pipeline-figure placeholder (do **not** reuse the Tags figure) and one `\NOTEside` each for related-work tool citations and ScanCode.

| ID | Section | Status | Source in PDF |
|---|---|---|---|
| T-CH5-01 | 5.1 Introduction | done-with-gaps | §1 of `altered_histories.pdf` |
| T-CH5-02 | 5.2 Related Work | done-with-gaps | §2 of `altered_histories.pdf` + `Git_metadata_indicators_of_supply_chain_attacks.md` |
| T-CH5-03 | 5.3 Chapter-Specific Methodology | done-with-gaps | §3 of `altered_histories.pdf` |
| T-CH5-04 | 5.4 Taxonomy of History Alterations | done-with-gaps | §4 of `altered_histories.pdf` |
| T-CH5-05 | 5.5 Prevalence and Distribution of History Alterations | done-with-gaps | §5 (RQ1) of `altered_histories.pdf` |
| T-CH5-06 | 5.6 Security-Relevant Characteristics of Altered Histories | done-with-gaps | §6 (RQ2) of `altered_histories.pdf` (license + secrets case studies — for Ch5, lift the license study; defer secrets to Ch6) |
| T-CH5-07 | 5.7 GitHistorian: An Operationalization of History Alteration Detection | done-with-gaps | GitHistorian section of `altered_histories.pdf`; reuse `figures/workflow_pipeline.drawio.svg` |
| T-CH5-08 | 5.8 Discussion | done-with-gaps | Discussion of `altered_histories.pdf` |
| T-CH5-09 | 5.9 Threats to Validity | done-with-gaps | Threats section of `altered_histories.pdf` |
| T-CH5-10 | 5.10 Conclusion | done-with-gaps | bridge to `\Cref{chap:secrets}` |

## Chapter 6→5 — Active Secrets in Version Control Archives  [now Ch5; no longer placeholder]

**Fully drafted 2026-06-01** (was placeholder) and **rewritten shorter 2026-06-22** per user request. Current sources are restricted to `contributions/secrets_removal`: `METHODOLOGY.md`, `RESULTS.md`, `protocol/main.tex`, `protocol/provider_outreach_template.md`, and the implemented scripts/notebooks as evidence. Target file: **`chapters/chapter05/chap05.tex`** (renamed from `chapter06/chap06.tex`).

| ID | Section | Status | Notes |
|---|---|---|---|
| T-CH6-01 | 5.1 Introduction | done-with-gaps | connects directly to Ch4's recoverable-vs-usable question; marks interpretation with `\NOTEside{interpretation}` |
| T-CH6-02 | 5.2 Study Design | done-with-gaps | compact six-stage pipeline from external `secrets.pkl` through filename filtering, SWH content resolution, S3 download, scanner run, and provenance join |
| T-CH6-03 | 5.3 Early Detection Results | done-with-gaps | **real current-run numbers**: 9.18% hit rate over 281,728 downloaded blobs; gitleaks/trufflehog expanded row counts; attrition figure placeholder |
| T-CH6-04 | 5.4 Validation Protocol | done-with-gaps | Tier A private-key offline results (`tab:sec-pk-tier-a`); Tier B/C protocol and outreach; no active-rate result claimed |
| T-CH6-05 | 5.5 Threats to Validity | done-with-gaps | external input provenance, selection/coverage, scanner limits; Tier A done for private keys; Tier B/C active validation pending (`\TODO{T-CH5-RESULTS}` partial) |
| T-CH6-06 | 5.6 Conclusion and Perspectives | done-with-gaps | long perspectives section for unfinished work; reproducibility metadata pending (`\TODO{T-CH5-REPRO}`) |
| T-CH6-07 | 5.7 Discussion | done | merged into compact conclusion/perspectives |
| T-CH6-08 | 5.8 Threats to Validity | done | merged into current §5.5 |
| T-CH6-09 | 5.9 Conclusion | done-with-gaps | merged into current §5.6; bridge to final conclusion removed in favor of unfinished-study perspectives |

## Chapter 7→6 — Conclusion and Future Work  [now Ch6]

Target file: **`chapters/chapter06/chap06.tex`** (renamed from `chapter07/chap07.tex` on 2026-06-01). Each task lists its specific dependencies. **Omit social engineering everywhere.** Note: the previous `T-CH7-*` dependencies on `T-CH3-07` (Methods threats) are void — fold thesis-level limitations from the per-chapter threats sections of Ch3/Ch4/Ch5 instead.

**Full draft 2026-06-27:** All sections drafted in one pass. Chapter restructured vs original scaffold:
- `§6.2 Answers to the Research Questions` replaced by `§6.2 What the Three Studies Establish About Repository Integrity` (3 subsections: mutability-norm, archive-instrument, remediation-gap) — user requested removal of formal RQ-by-RQ answers in favour of a synthesis section.
- `§6.6.3` retitled to `Developer Behavior and Remediation Practices` (was `Broader Socio-Technical Studies`).
- Ch5 incompleteness (no active-rate result) explicitly acknowledged in §6.1.3 and §6.5, and placed in future work §6.6.3.
- No `\TODO` markers introduced; no fabricated numbers (all macros from Ch3/Ch4 or explicit \num{} from Ch5).

| ID | Section | Status | Depends on | Notes |
|---|---|---|---|---|
| T-CH7-01 | 6.1 Summary of the Thesis | done-with-gaps | T-CH4-10, T-CH5-10, T-CH6-09 | Ch5 section marked honest-partial; no active-rate result claimed |
| T-CH7-02 | 6.2 What the Three Studies Establish (replaces RQ answers) | done | — | Restructured per user decision 2026-06-27 |
| T-CH7-03 | 6.3 Main Contributions | done | T-CH1-05, T-CH4-08, T-CH5-08 | Mirrors §1.5 structure |
| T-CH7-04 | 6.4 Implications for Software Supply-Chain Security | done | T-CH4-08, T-CH5-08 | 3 audience subsections |
| T-CH7-05 | 6.5 Limitations of the Thesis | done-with-gaps | T-CH4-09, T-CH5-09, T-CH6-08 | Study 3 incompleteness flagged as main open limitation |
| T-CH7-06 | 6.6 Directions for Future Work | done | T-CH4-08, T-CH5-08, T-CH6-07 | Third subsection retitled; social engineering dropped |
| T-CH7-07 | 6.7 Final Remarks | done | T-CH7-01..06 | Closes the tj-actions narrative arc |
- **started**: 2026-06-27
- **finished**: 2026-06-27

---

## Notes for the user

- This is a living plan. Cross out, retitle, or reprioritize tasks freely.
- The corresponding review queue lives in `REVIEW_QUEUE.md`.
- To run a specific task: tell an agent "run T-CH4-03" and reference this file.
- To run sequentially: tell an agent "run the next pending task" — it will pick the first eligible one.
- `T-FM-02` is `user-only` — no agent picks it.
