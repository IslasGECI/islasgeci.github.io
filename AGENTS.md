# AGENTS — repo conventions

## Public interface

- The public interface is what can be seen published from islas.dev.
- If it cannot be seen from islas.dev, it is not part of the public interface.

## Commits

- gitmoji + imperative verb, ≤72 chars first line. Why-over-what in body.
- Examples from this repo: `♻️ Consolidate style guide pages`, `📝 Add naming conventions for functions and methods`.

## Jekyll front matter

| Layout | Required |
|--------|----------|
| `page` | `layout`, `title`, `tagline`, `description` |
| `post` | `layout`, `title`, `author`, `tags` |

Post filenames: `YYYY-MM-DD-slug.md` in `_posts/`. Tags are space-separated ids from `_data/tags.yml`.

## Key files

- `_data/navigation.yml` — top-level nav links. Add new pages here.
- `_data/tags.yml` — tag taxonomy. New tags must be added here before use.
- `_config.yml` — Jekyll config. Collections enabled: `guia_de_estilo`, `protocolo_avanzado`.
- `.config/wordlist-es.txt` — Spanish aspell custom dictionary. Add new technical terms here.
  **Encoding**: The first line must contain `utf-8` (`personal_ws-1.1 es N utf-8`).
  `aspell-es` defaults to `iso8859-1`; the suffix overrides it.
- `.config/wordlist-en.txt` — English aspell custom dictionary. Add new English terms here.
  **Format**: First line: `personal_ws-1.1 en N utf-8` where `N` is the word count.

## Development

- Docker only. No local Ruby needed.
- `make start` — build + serve. Visit http://localhost:4000.
- `make down` — stop the dev server.
- **Quirk**: `make serve` has a missing space in the volume mount (`jekyll\` -> `jekyll\ `). Run `make build` first if `make serve` fails.

## Checks

- `make check` runs style and spellcheck via Docker. Requires Docker.
  The host has `aspell` but not the Spanish dictionary, so run checks through Docker, not local `aspell`.
- `make check` stops at the first failing script; run `src/check_spelling.sh` alone once style is red.
- `src/check_style.sh` — validates line endings (`.`, `:`, `?`) and ≤25 words per line in `_posts/*.md`.
  **Quirk**: does not skip fenced code blocks — lines inside ``` blocks are also checked.
- `src/check_spelling.sh` — runs `aspell` against `_posts/*.md` using `.config/wordlist-es.txt` (Spanish) or `.config/wordlist-en.txt` (English, for `*_en.md` posts).
- `Dockerfile` — minimal Ubuntu image with `aspell`, `aspell-en`, `aspell-es`, and `make`.

## Wordlists

- Every entry in `.config/wordlist-*.txt` must be a term aspell still flags; delete dead entries.
- Rebuild by listing the flags with an empty personal dictionary, then diffing the result against the wordlist.
- Compare sorted word lists with `LC_ALL=C sort -u`; plain `sort` order is locale-dependent.
- The integer in the header counts entries, excluding the header line.

## Style fixes

When fixing legacy posts that exceed the 25-word line limit:

- **One sentence per line**. No hard-wrapping mid-sentence.
- **≤30 words**: try shortening first (trim filler words, redundant phrases).
- **31+ words**: split at a conjunction or natural clause boundary.
- **Both split parts must be complete sentences**. Prepositional phrases alone ("Para los nombres...") are not sentences.
- **Do not split paired structures**: `no sólo...sino también`, `tan...como`. Shorten instead.
- The punctuation rule ignores lines that start with a non-word character (headings, list markers, indented code) and post front-matter keys; the ≤25-word rule still counts those lines.
- **Pre-push hook** rejects pushes with violations. Use `git push --no-verify` for legacy content that is being fixed incrementally.

## Setup

- `.pipelines/init.sh` — configures `core.hooksPath .githooks` to activate the pre-push hook.
- `.githooks/pre-push` — runs `make check` before every push; rejects if checks fail. Activate with `bash .pipelines/init.sh`.

## CI

`.github/workflows/actions.yml` builds the Docker image and runs `make check` on every push.

## Language

- Posts and docs: Spanish. Code and filenames: English (snake_case).
- Prefer Python and R. Do not reference MATLAB.
- Allowed abbreviations: `sst`, `eez`, `lon`, `lat`, `x`, `y`, `X`, `Y`.

## Reference scripts

- `../albatross-bycatch-mexico/src/*.R` is the reference codebase for scripts conforming to
  the conventions in STYLEGUIDE.md. When creating new R scripts, consult these
  files for real-world examples of Spanish section markers, imperative comments,
  and Tidyverse style.

## Repo rules

- Only plain text committed (CSV, JSON, SVG, TEX, TXT). No binary files >256 px.
- Text files use LF endings; `.gitattributes` enforces this (`* text=auto eol=lf`).
- No tests directory — this is a Jekyll site, not a library.
- No GitFlow.
- STYLEGUIDE.md at `_guia_de_estilo/STYLEGUIDE.md` is the single source of truth for conventions. When it subsumes other pages, preserve unique content as blog posts, delete redundants, remove cross-references.
