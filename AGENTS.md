# AGENTS — repo conventions

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
- `.github/config/.wordlist.txt` — aspell custom dictionary. Add new technical terms here.

## Development

- Docker only. No local Ruby needed.
- `make start` — build + serve. Visit http://localhost:4000.
- `make down` — stop the dev server.
- **Quirk**: `make serve` has a missing space in the volume mount (`jekyll\` -> `jekyll\ `). Run `make build` first if `make serve` fails.
## Checks

- `make check` runs style and spellcheck via Docker. Requires Docker.
- `src/check_style.sh` — validates line endings (`.`, `:`, `?`) and ≤25 words per line in `_posts/*.md`.
- `src/check_spelling.sh` — runs `aspell` (lang `es`) against `_posts/*.md` using `.github/config/.wordlist.txt`.
- `Dockerfile` — minimal Ubuntu image with `aspell` and `make`.

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

- `../bycatch_thesis/src/*.R` is the reference codebase for scripts conforming to
  the conventions in STYLEGUIDE.md. When creating new R scripts, consult these
  files for real-world examples of Spanish section markers, imperative comments,
  and Tidyverse style.

## Repo rules

- Only plain text committed (CSV, JSON, SVG, TEX, TXT). No binary files >256 px.
- No tests directory — this is a Jekyll site, not a library.
- No GitFlow.
- STYLEGUIDE.md at `_guia_de_estilo/STYLEGUIDE.md` is the single source of truth for conventions. When it subsumes other pages, preserve unique content as blog posts, delete redundants, remove cross-references.
