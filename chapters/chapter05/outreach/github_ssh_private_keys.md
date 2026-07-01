## Subject

Security research coordination — archived SSH private keys probeable against GitHub

---

## Body

Dear GitHub Security Team,

I am a doctoral researcher at Télécom Paris (Institut Polytechnique de Paris)
studying credentials that remain exposed in public version-control archives after
history-altering events (e.g., force-pushes, rebases, branch rewrites). Our
dataset is drawn from the Software Heritage archive: we detect candidate secret
files with standard secret scanners, then validate them using a pre-registered,
non-intrusive protocol.

We have identified **10,038 distinct SSH private keys** in archived public
repository content that pass offline structural validation. For each
key, `ssh-keygen -y -f <keyfile>` completes successfully, confirming that the
material is a syntactically valid private key rather than a placeholder or
truncated file. These keys were found in blob content associated with
history-altering removals or rewrites — not from live scraping of your services.

We have **not** tested any of these keys against `git@github.com` or any other
GitHub endpoint. Our research question is how many archived exposures of this
kind still correspond to **active** credentials. This is distinct from
repository remediation: we are measuring persistence of valid credentials in
archival copies after history rewrite, not asking you to notify individual
repository owners.

Before any network contact, we are requesting your guidance on the safest way
to confirm how many of these keys may still be registered and usable on GitHub,
and to support revocation where your policy allows.

We can transmit the full list of key identifiers (fingerprints, filenames, and
the keys themselves) through a channel you designate. We ask that you:

1. Check on your side how many appear still registered and active for GitHub
   authentication.
2. Revoke or invalidate them per GitHub policy.
3. Return an **aggregate count** of keys that were still active at the time of
   your check (no need to share per-key details with us).

This is our preferred path. It avoids us making any live SSH connection with
third-party private keys.

If your team prefers that we perform the check ourselves, we would run **only**
the following read-only probe, once per key, under your **explicit written
authorization** for this study:

```bash
ssh -i ./key -o IdentitiesOnly=yes -T git@github.com
```

We would treat a key as active iff the response banner contains `Hi <user>!`.
We would not run this command (or any variant) unless you explicitly authorize
it in writing. **Lack of response is not authorization.**

If you choose this option, we can report back the list of still-active key
fingerprints through a secure channel you designate, so you can revoke them
directly.

Please reply within **30 days** (we will send one follow-up at day 14) and let
us know:

1. Your preferred secure channel for key transfer, **or**
2. Written authorization for the SSH probe above, **or**
3. That you do not want us to perform live validation — in that case we will
   limit our analysis to offline checks and report active status as
   **unknown** for GitHub-targetable SSH keys in our publication.

We will not publish raw private keys. Any publication will report only aggregate
statistics (counts and fractions of syntactically valid keys that appeared
active, conditional on provider authorization).

Thank you for helping us measure archival exposure risk responsibly.

Best regards,  
Solal Rapaport
Télécom Paris — Institut Polytechnique de Paris
