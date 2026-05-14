# Changelog

All notable changes to this project are documented here.

The format follows [Keep a Changelog](https://keepachangelog.com/) and
[Semantic Versioning](https://semver.org/). For `0.y.z` releases, the MINOR
version is incremented for every release.

## [Unreleased]

### Added

- Complete section structure in STYLEGUIDE.md with Spanish markers
  (`CONFIGURACIÓN`, `ENTRADAS`, `PROCESAMIENTO / ANÁLISIS`, `SALIDA`) and
  imperative-form consistency rules for script headers
- Pull Request review checklist to style guide
- Dockerfile with `aspell` and `make` for isolated CI validation
- Style check script (`src/check_style.sh`) validating line endings and
  sentence length
- Spellcheck script (`src/check_spelling.sh`) using aspell with Spanish
  dictionary
- `make check` target to run both validation scripts
- Pre-push hook that rejects pushes on failed checks
- `.pipelines/init.sh` for local Git hooks configuration

### Changed

- CI workflow now builds a Docker image and runs `make check` instead of
  inline shell checks
- Style and spellcheck scripts scoped to `_posts/` only

### Removed

- `.github/config/.spellcheck.yml` (replaced by direct aspell integration)

### Fixed

- Line-ending compliance in `_posts/2026-05-13-texto-simple.md` to pass CI
- Spellcheck wordlist expanded with `CSV`, `RDS`, `XLSX`, `pickle`
- Missing `WORKDIR` in Dockerfile caused `make check` to fail in CI

## [v0.1.0] - 2026-05-13

### Added

- Comprehensive STYLEGUIDE.md covering commit messages, repository structure,
  coding standards, and naming conventions
- Blog post on decoupling analysis from visualization
- Blog post on why the team prefers plain text over binary files
- GitHub Actions workflow for automated spell-checking
- Volunteer catalog entries for new team members
- Docker-based Makefile for local development

### Changed

- Consolidated five redundant style guide pages into STYLEGUIDE.md
- Updated tag taxonomy (fixed spelling, added new tags)
- Modernized navigation structure
- Replaced MATLAB references with Python and R

### Removed

- Outdated GitFlow documentation (workflow no longer used)
- Obsolete Roxygen documentation guide (superseded by STYLEGUIDE.md)
- Redundant style guide pages for version control, directory structure,
  nomenclature, and plain-text rules

[Unreleased]: https://github.com/IslasGECI/islasgeci.github.io/compare/v0.1.0...HEAD
[v0.1.0]: https://github.com/IslasGECI/islasgeci.github.io/releases/tag/v0.1.0
