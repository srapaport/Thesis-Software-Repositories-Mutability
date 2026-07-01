# Repetition phrase patterns (this thesis)

Use as a scan aid, not a mandatory delete list. Context decides whether a hit is duplicate or legitimate.

## Thesis-wide framing (paraphrase or cut on repeat)

```
this thesis
the studies (in|reported in|that constitute) this thesis
at the core of this thesis
central to .* this thesis
the .* thread of this thesis
what (follows|remains) .* this thesis
measurements reported in this thesis
```

## Conceptual stock phrases (often duplicated across Ch1–Ch3)

```
central tension
tension (between|that)
object identity and reference identity
content-addressed object
mutable (namespace|references|release)
social contract
immutable release anchor
snowball effect
repository-level .* credential-level
cleanup .* rotation
Software Heritage .* (makes|provides|enables)
tj-actions/changed-files
```

## Structural echoes to compare section-by-section

- **Incident openers** — Ch1 and Ch3 both narrate `changed-files`; keep one full narrative (Ch1 or Ch3 intro), shorten the other to a pointer.
- **Git mutability lecture** — object store vs refs, force-push, tag move/delete: canonical in Ch2 `\Cref{chap:background}`; Ch3+ should `\Cref{}` subsections.
- **Downstream dependency stakes** — npm/Cargo/Actions pinning: Ch2 `\Cref{sec:bg-releases-provenance-reproducibility}` vs Ch3 `\Cref{sec:tags-downstream-assumptions}` — merge rhetorical job, not both full essays.
- **SWH as witness** — Ch1, Ch2, Ch3, Ch4 intros; one full treatment early, later one-liners.
- **Three-study arc** — Ch1 `\Cref{sec:intro-problem}` owns the map; Ch6 synthesises; middle chapters mention only their slot.

## Paraphrase bank (when recall is needed)

| Overused | Alternatives |
|----------|--------------|
| central tension of this thesis | the object–reference gap (\Cref{…}); the mutability studied here |
| at the core of this thesis | for the empirical chapters; for the measurements below |
| this thesis asks | the following chapter asks; the study below asks |
| studies reported in this thesis | the three empirical chapters; the tag, history, and secret studies |
| the measurements in this thesis | archive-scale measurements; the SWH-based estimates below |

Prefer dropping the meta-frame entirely when a `\Cref{}` already orients the reader.
