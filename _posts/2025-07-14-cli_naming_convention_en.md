---
layout: post
title: Command-Line Interface (CLI) Naming Convention
author: Evaristo
tags: programación
---

This document defines the naming convention for the ecological data analysis CLI developed by the GECI Data Science team.
Use this convention to ensure consistency, predictability, and clarity across all CLI commands.

---

## 1. Overview

Follow this naming pattern for all command names:

```
create[_<method>]_<variable> [--taxon <TAXON>] [--region <REGION>] [--season <SEASON>] [--format <FORMAT>]

render[_<method>]_<variable> [--taxon <TAXON>] [--region <REGION>] [--season <SEASON>] [--format <FORMAT>]
```

* `<>` denotes required components.
* `[]` denotes optional components.
* Underscores separate segments within the command name.

### Example

```bash
geci create bootstrap_progress_probability --taxon LAAL ...
geci render cpue_vs_cumulative_captures --region clarion ...
```

---

## 2. Standard Verbs

Use one of the following **standard verbs** as the first component of the command name:

| Verb        | Description                     |
| ----------- | ------------------------------- |
| `create`    | Create data artifacts           |
| `render`    | Render visualizations           |

Use only these verbs unless a new, general-purpose action is required.

---

## 3. Method or Modifier (Optional Second Component)

Include a method or modifier **only** if it adds meaningful distinction or disambiguates the command.
Use lowercase with underscores to combine multiple words.

### Examples

* `bootstrap`
* `filtered`
* `mean`
* `merged`
* `transformed`
* `valid`

Avoid encoding values that are better expressed as arguments (e.g., `taxon`, `region`, or `format`).

---

## 4. Standard Variables

Use standardized variable names to ensure semantic consistency across commands.

| Variable Name             | Description                             |
| ------------------------- | --------------------------------------- |
| `air_temperature`         | Ambient air temperature                 |
| `altitude`                | Altitude above the geoid                |
| `cpue`                    | Catch per unit effort                   |
| `effort`                  | Survey or sampling effort               |
| `height`                  | Vertical elevation                      |
| `mass`                    | Mass of the observed subject            |
| `nest_count`              | Number of nests observed                |
| `number_of_captures`      | Number of individuals captured          |
| `progress`                | Monitoring progress                     |
| `projection_x_coordinate` | Easting in projected coordinate system  |
| `projection_y_coordinate` | Northing in projected coordinate system |
| `status`                  | Status of species or population         |
| `time`                    | Time of observation                     |
| `utm_zone`                | UTM projection zone                     |

This list is an incomplete (and possibly outdated) subset of standard names.
Refer to the current list at:

- [Nombre estándar](https://islas.dev/protocolo_basico/standard_name.html)

---

## 5. Optional Components: Taxon, Region, Season, Format

Do **not** embed `taxon`, `region`, `season`, or `format` in the command name. Instead, require these as CLI arguments:

```bash
--taxon <TAXON>
--region <REGION>
--season <SEASON>
--format <FORMAT>
```

---

## 6. Naming Examples

| ❌ Bad Name                                   | ✅ Good Name                                     | Notes                                                                            |
| --------------------------------------------- | ------------------------------------------------ | -------------------------------------------------------------------------------- |
| `create_bootstrap_progress_intervals`         | `create_bootstrap_interval_progress_probability` | Verb (create), method (bootstrap\_interval), and variable (progress\_probability) |
| `create_monitoring_aerial`                    | `create_aerial_monitoring`                       | Verb (create), method (aerial), and object (monitoring)                           |
| `create_population_status_from_mixed_methods` | `create_mixed_methods_population_status`         | Verb (create), method (mixed\_methods), and variable (population\_status)         |
| `create_csv_probability`                      | `create_progress_probability --format csv`       | Verb (create), variable (progress\_probability); format passed as argument        |
| `create_progress_probability_figure`          | `render_progress_probability`                    | Verb (render), variable (progress\_probability)                                    |
| `render_comparative_catch_curves`             | `render_comparative_catch`                       | Verb (render), method (comparative), variable (catch); "curves" is redundant       |
| `render_custom_cpue_vs_cum_captures`          | `render_custom_cpue_vs_cumulative_captures`      | Verb (render), method (custom), variable (cpue\_vs\_cumulative\_captures)          |
| `render_cpue_vs_cum_captures`                 | `render_cpue_vs_cumulative_captures`             | Verb (render), variable (cpue\_vs\_cumulative\_captures)                           |

---

## 7. Guidelines for Adding New Commands

1. **Start with a standard verb**: `create` for data artifacts, `render` for visualizations.
2. **Add a method or modifier only when it improves clarity or resolves ambiguity.**.
3. **Use a documented, standard variable.**.
4. **Pass `taxon`, `region`, `season`, and `format` as CLI arguments.**.
5. **Avoid unnecessary duplication or verbosity.**.
6. **Ensure the command name communicates the main action and data scope.**.
7. **Test the command for consistency with naming and execution patterns.**.
