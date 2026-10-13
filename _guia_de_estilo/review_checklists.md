---
layout: page
title: Review Checklists
tagline: Guía de estilo
description: Checklists for reviewing Class 1 and Class 3 pull requests
---

Two repository classes each have their own review checklist:

- **Class 1 repositories** contain general-purpose tools whose end users are analysts, such as packages, CLIs, and APIs. They do not produce concrete results and are usually hosted on GitHub.
- **Class 3 repositories** depend on Class 1 repositories and produce concrete results about the islands and their species for biologists. They are usually hosted on Bitbucket.

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
- [ ] **Artifacts**: Is there a strict one-to-one mapping between declared artifacts and produced outputs (no missing or extra outputs)?
- [ ] **Reproducibility**: Does the pipeline produce identical outputs for identical inputs and configuration?
- [ ] **Configuration**: Is configuration centralized rather than duplicated or fragmented across scripts?
- [ ] **README.md**: Is it accurate and clear for academic users?
- [ ] **AGENTS.md**: Is it accurate and clear for data analysts?
- [ ] **Style**: Does the code follow the [Style Guide](/guia_de_estilo/STYLEGUIDE)?
