# PhD defense rehearsal

Good presentation overall, very clear.

## Slide-specific remarks

- Slide 2: doctoral committee: not mandatory, nobody will have time to read names
- Slide 3: I'd present this in a more structured way, rather than an outline. "After a general introduction to the domain of my thesis, I'll explain the various topics I've worked on, and the results I've obtained. I'll start with …, then …, etc. I'll end by summarizing how those topics are related and complement each other, and draw a general conclusion."
- Slide 6: "role" looks a bit weird here, especially in "can those two roles collaborate". They are not persons.
- Slide 7: introduce very briefly what a "github action" is.
- Slide 7: replace "->" by "→" or, better, "⇒"
- Slide 9: why talk about "SWHID" here when you are clearly talking about git? You don't even mention it orally.
- Slide 16: use items for the questions, or we don't know if there are 3 or 6 questions.
- Slide 17: have you introduced SWHID?
- Slide 18: "tagged origins"?
- Slide 20: It is not clear to me what "Lightweight <-> Annotated" means in the figure.
- Slide 25: "We find 1.22M repositories": where? GitHub? Any git repository on SWH? You are talking about popularity, so maybe GitHub only?
- Slide 27: "all repositories" vs. "≥ 1000 stars". Why chose "all" rather than (or in addition to) "< 1000 stars"?

## General remarks

- Why use this template? It takes a lot of room at the top and on the left.
- "Defense" in the footer should be "PhD defense"
- You should be more explicit on what we see in a git repository (the latest full state of the repository history, including all branches and tags) vs. what we see in SWH (any full state of the repository history that has been visited by a snapshot, as a time traveler would see it) — noticed on slide 17
- Up to slide 22 at least (the point where I'm writing this, ~25 minutes into the presentation, so more than half), it is not clear what you have done, and what is new in what you are presenting. Make sure you keep enough time to present your PhD thesis work.

## Potential questions

- Slide 28: "copyright change"? How common is it to change copyright, rather than add another copyright for recent modifications? GPL 2.0 to GPL 3.0 for example is explicitly allowed by GPL 2.0, what would be interesting is the reverse direction. GPL to MIT would be problematic as well, while MIT to GPL is not.
- Slide 29: queries are precomputed, but how often are they updated? For example, what has the last update been done?
- Slide 34: "a key is only proven active by using it". Is that true even for SSH, where a server could indicate it would accept a given public key without ever using the private key?