---
layout: page
title: Review Checklists
tagline: Guía de estilo
description: Checklists for reviewing Class 1 and Class 3 pull requests, and for publishing reports and software releases in Zenodo
---

Two repository classes each have their own review checklist:

- **Class 1 repositories** contain general-purpose tools whose end users are analysts, such as packages, CLIs, and APIs. They do not produce concrete results and are usually hosted on GitHub.
- **Class 3 repositories** depend on Class 1 repositories and produce concrete results about the islands and their species for biologists. They are usually hosted on Bitbucket.

A report published to Zenodo and a software release archived on Zenodo each follow their own checklist.

The conventions these checklists reference are defined in the [Style Guide](/guia_de_estilo/STYLEGUIDE).

## Checklist for a Class 1 Pull Request on GitHub

- [ ] **Small**: Does the pull request have fewer than 100 lines?
- [ ] **Passing**: Is the CI pipeline passing?
- [ ] **Technical Debt Reduction**: Did we reduce any form of technical debt? Are we confident that this change did not introduce or increase technical debt?
- [ ] **Complexity**: Could the code be made simpler? Would another developer be able to easily understand and use this code when they come across it in the future? Is this code adding functionality that isn't presently needed?
- [ ] **Design**: Is the code well-designed and appropriate for your system?
- [ ] **Tests**: Does the code have correct and well-designed automated tests? Does the code behave as the author likely intended?
- [ ] **Interface**: Are the interface changes sensible and do they look good? Is the way the code behaves good for its users?
- [ ] **CHANGELOG.md**: Are the changes recorded in this file following the [Keep a Changelog](https://keepachangelog.com/) standard?
- [ ] **Versioning**: Are version numbers updated according to [semantic versioning](https://semver.org/) guidelines (e.g., MAJOR.MINOR.PATCH)?
- [ ] **Documentation**: Did the developer also update relevant documentation? Does the exposed functions have docstrings?
- [ ] **CITATION.cff**: Is the citation file included and updated following [GitHub's citation file guidance](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files)? _See examples in [seabird_tracking](https://github.com/IslasGECI/seabird_tracking/blob/develop/CITATION.cff) and [nerd](https://github.com/IslasGECI/nerd/blob/develop/CITATION.cff)._
- [ ] **Naming**: Did the developer choose clear names for variables, classes, methods, etc.? Did we replace unnecessary comments with clear variable names, well-named functions, and small cohesive blocks?
- [ ] **Style**: Does the code follow our [Style Guide](/guia_de_estilo/STYLEGUIDE)?
- [ ] **YAGNI**: Is the developer avoiding implementing things they might need in the future but don't know they need now?
- [ ] **Good Things**: If you see something nice in the pull request, tell the developer, especially when they addressed one of your comments in a great way.

## Checklist for a Class 3 Pull Request on Bitbucket

- [ ] **analyses.json**: Does every `Makefile` target have a matching `analyses.json` entry, and vice versa?
- [ ] **Reproducibility**: Does the pipeline produce identical outputs for identical inputs and configuration?
- [ ] **Configuration**: Is configuration centralized rather than duplicated or fragmented across scripts?
- [ ] **README.md**: Is it accurate and clear for academic users?
- [ ] **AGENTS.md**: Is it accurate and clear for data analysts?
- [ ] **Style**: Does the code follow the [Style Guide](/guia_de_estilo/STYLEGUIDE)?

## Checklist for a Report on Zenodo

- [ ] **Community**: Add the community "Grupo de Ecología y Conservación de Islas".
- [ ] **Access**: Set restricted access, not public.
- [ ] **Duplicates**: Verify that there are no duplicate records in Zenodo.
- [ ] **Preview**: Add the most important file to the preview.
- [ ] **Resource type**: `Publication>Report`.
- [ ] **Delivery date**: `{YYYY-MM-DD}`.
- [ ] **Creator**: Grupo de Ecología y Conservación de Islas, `05w2bye72`.
- [ ] **Title**: Species, island, season, and measure.
- [ ] **Concise title**: Remove superfluous words from the title.
- [ ] **Abstract**: Write the abstract with the results.
- [ ] **Notes**: Write the description of changes in the notes.
- [ ] **Delivery email**: Link the delivery email.
- [ ] **Versioning reason**: Verify that the versioning reason is included.
- [ ] **Version**: `{X.Y.Z}`.
- [ ] **Repository**: Link the repository.

### Report versioning

- `X` — We retract something, remove something, or change the meaning.
- `Y` — We add a section or a result without modifying what came before.
- `Z` — We update the data, or fix the wording without changing the meaning.

## Checklist for a Software Release on GitHub

A software record is permanent once its release is published, because Zenodo archives the release automatically.
Every box must be ticked before publishing; an unticked box means the repository is not ready to be archived.
Zenodo reads `.zenodo.json` and ignores `CITATION.cff` when both exist.

- [ ] **Contents**: the tree you are about to tag holds no credential, key, or token; no data the organization archives only as a restricted record; no third-party file it may not redistribute; and no file over 100 MB — outside `tests/data/`.
  Test: `git ls-files | xargs du -b | sort -n | tail` lists the largest files, and a review of `git ls-files` finds none of those four.
- [ ] **Test data**: no file in `tests/data/` holds sensitive, personal, or confidential information — `tests/data/`.
  Test: A reviewer of `git ls-files tests/data/` finds every file anonymized; a sample of a restricted dataset is acceptable.
- [ ] **Zenodo enabled**: the repository is toggled on in Zenodo's GitHub settings.
  Test: The repository appears in the enabled-repositories list at `zenodo.org/account/settings/github/`.
- [ ] **License**: the repository declares AGPL-3.0 at its root — `LICENSE`.
  Test: `gh api repos/{owner}/{repo}/license` reports `AGPL-3.0`.
- [ ] **README**: what it does and how to run it, in plain language — `README.md`.
  Test: A reader who has never seen the repository can name its purpose and the command that runs it.
- [ ] **Interface**: `AGENTS.md` defines the public interface without listing its elements — `AGENTS.md`.
  Test: A reader learns what the interface is from `AGENTS.md` and cannot enumerate it without opening `DOCS.md`.
- [ ] **Documentation**: `DOCS.md` lists every public-interface element and nothing else — `DOCS.md`.
  Test: Every `###` heading names a symbol or route the tests exercise, and every symbol the tests import has a heading.
- [ ] **History**: `CHANGELOG.md` records changes to the elements `DOCS.md` lists, and nothing else — `CHANGELOG.md`.
  Test: Every entry under the newest version header names a `###` heading in `DOCS.md`, and the diff from the previous tag shows no user-visible change without one.
- [ ] **Zenodo metadata**: `.zenodo.json` carries the title, a bare `X.Y.Z` version, `upload_type` `software`, `access_right` `open`, license `AGPL-3.0-only`, every creator with an ORCID, a description, keywords, `communities` `islasgeci`, and a `related_identifiers` entry for every paper or report that uses the code — `.zenodo.json`.
  Test: Every field holds a value and each `related_identifiers` DOI resolves.
- [ ] **Citation file**: `CITATION.cff` names the same title, version, and creators as `.zenodo.json` — `CITATION.cff`.
  Test: The three values are identical in both files.
- [ ] **Version**: the newest `CHANGELOG.md` header, the two metadata files, and the release tag name the same number; the tag carries `v` and the files do not — `CHANGELOG.md`, `.zenodo.json`, `CITATION.cff`.
  Test: `grep` the number in the three files and compare it with the tag in the release form.
- [ ] **Tag**: the version is tagged on the remote before the release is created — `vX.Y.Z`.
  Test: `gh api repos/{owner}/{repo}/git/ref/tags/vX.Y.Z --jq .ref` reports `refs/tags/vX.Y.Z`.
- [ ] **Passing**: the release tags the remote `develop` HEAD, and that commit passed CI.
  Test: `gh api repos/{owner}/{repo}/commits/develop --jq .sha` equals `gh api repos/{owner}/{repo}/commits/vX.Y.Z --jq .sha`, and `gh run list --repo {owner}/{repo} --commit <sha>` lists at least one run with every conclusion `success`.
