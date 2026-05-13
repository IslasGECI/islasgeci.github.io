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
