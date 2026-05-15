# DOCS — Technical Reference

## make start

Build and serve the Jekyll site in one step.

- Parameters: none
- Returns: site available at http://localhost:4000
- Notes: Equivalent to running `make build` then `make serve`

## make build

Build the static site without starting the development server.

- Parameters: none
- Returns: compiled site in `_site/`
- Notes: Uses `jekyll/builder` Docker image

## make serve

Start the Jekyll development server.

- Parameters: none
- Returns: running container `islasgeci.github.io` on port 4000
- Notes: Container runs detached. Use `make down` to stop.

## make down

Stop the running Jekyll development server.

- Parameters: none
- Returns: stops and removes container `islasgeci.github.io`
- Errors: no-op if no container is running

## make check

Run style and spellcheck validation inside a Docker container.

- Parameters: none
- Returns: exit code 0 if all checks pass, 1 otherwise
- Notes: Builds or uses the `islasgeci/islasgeci.github.io` image. Requires Docker. Equivalent to running `src/check_style.sh` followed by `src/check_spelling.sh`.

## src/check_style.sh

Validate that every Markdown file in `_posts/` ends each line with `.`, `:`, or `?` and that no line exceeds 25 words.

- Parameters: none
- Returns: exit code 0 if all checks pass, 1 otherwise
- Errors: non-zero exit when a line lacks proper punctuation or exceeds 25 words

## src/check_spelling.sh

Run aspell spellcheck in Spanish against every Markdown file in `_posts/` using the project wordlist.

- Parameters: none
- Returns: exit code 0 if no spelling errors found, 1 otherwise
- Errors: non-zero exit when aspell detects unrecognised words
- Notes: Uses `.config/wordlist-es.txt` for Spanish posts and `.config/wordlist-en.txt` for English (`*_en.md`) posts. Add new technical terms to the appropriate file.

## .pipelines/init.sh

Configure the local Git repository to use the project pre-push hook.

- Parameters: none
- Returns: sets `core.hooksPath` to `.githooks`
- Notes: Run once per clone. The pre-push hook calls `make check` and rejects the push if checks fail.

## Collections

### `_guia_de_estilo`

Registered Jekyll collection (see `_config.yml`). Each file in this directory
renders as a page at `/guia_de_estilo/<slug>/`.

### `_protocolo_avanzado`

Registered Jekyll collection (see `_config.yml`). Each file in this directory
renders as a page at `/protocolo_avanzado/<slug>/`.

## Data Files

### `_data/navigation.yml`

Defines the top-level navigation links rendered on the homepage.

- Format: list of `{name, link}` objects
- `name`: display text (Spanish)
- `link`: relative path or absolute URL

### `_data/tags.yml`

Defines the tag taxonomy for blog posts.

- Format: list of `{name, id}` objects
- `name`: display text (Spanish)
- `id`: tag identifier used in post front matter

## Front Matter

### Page layout (`layout: page`)

| Field         | Required | Description                       |
|---------------|----------|-----------------------------------|
| `layout`      | yes      | Must be `page`                    |
| `title`       | yes      | Page title                        |
| `tagline`     | yes      | Short subtitle                    |
| `description` | yes      | SEO description                   |

### Post layout (`layout: post`)

| Field    | Required | Description                                       |
|----------|----------|---------------------------------------------------|
| `layout` | yes      | Must be `post`                                    |
| `title`  | yes      | Post title                                        |
| `author` | yes      | Author name                                       |
| `tags`   | yes      | Space-separated tag ids from `_data/tags.yml`     |
