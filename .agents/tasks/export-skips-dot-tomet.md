# `tomet export .` skips `.tomet/`, so a readme kept there goes stale silently

`readme.tmt` moved from `tmtroot/` to `.tomet/`. `tomet export .` (and `tomet export --check .`) then no longer sees it:
`vault.config.tmt` is the only `.tmt` it finds, `--check` says "All exports are up to date." while `README.md` still
differs from its source (2026-11-07, tomet 0.5.0 from the sisho pin of that day).

Naming the file works: `tomet export .tomet/readme.tmt -o README.md` (without `-o` it prints to stdout instead of
writing the `path` the file's own `::config` declares).

## Steps

- [ ] Find out whether the directory sweep skips dot directories on purpose (same file discovery as `check`), and whether
      a named file ignoring `::config(export: { path })` is intended. Read the code first; do not guess.
- [ ] If the sweep is meant to skip `.tomet/`, decide where the readme source lives (back to `tmtroot/`, or elsewhere),
      so that `tomet export --check .` can guard `README.md`.
- [ ] Stopgap in place (2026-11-07): the `generated_by` macro in `vault.config.tmt` now says
      `tomet export .tomet/readme.tmt -o README.md`, the command that works today. When the above is settled, put it
      back to `tomet export .` (and drop the hard-coded `-o README.md`).
