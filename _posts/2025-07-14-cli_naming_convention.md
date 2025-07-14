---
layout: post
title: Command-Line Interface (CLI) Naming Convention
author: Evaristo
tags: progra
---

This document defines the naming convention for the ecological data analysis CLI developed by the GECI Data Science team. Use this convention to ensure consistency, predictability, and clarity across all CLI commands.

---

## 1. Overview

Follow this naming pattern for all command names:

```
<verb>_<method|modifier*>_<variable|object>_<taxon?>_<region?>_<season?>_<format?>
```

* Components in angle brackets `<>` are positional. Maintain this order consistently.
* Components with an asterisk `*` are optional and may be embedded in the command name.
* Components with a question mark `?` are optional and must be passed as CLI arguments rather than embedded.
* Use underscores to separate components.

### Example

```bash
write_mean_mass \
    --input-path data/mass.csv \
    --output-path out/mean_mass.json \
    --taxon LAAL \
    --region san_benedicto \
    --season 2020 \
    --format json
```

---

## 2. Standard Verbs

Use one of the following **standard verbs** as the first component of the command name:

| Verb        | Description                     |
| ----------- | ------------------------------- |
| `write`     | Output data to files            |
| `plot`      | Create visualizations           |
| `filter`    | Subset or filter data           |
| `export`    | Convert and output data         |
| `import`    | Load data from external sources |
| `validate`  | Check data integrity            |
| `calculate` | Perform computations            |
| `merge`     | Combine datasets                |
| `transform` | Modify data structure           |

Use only these verbs unless a new, general-purpose action is required.

---

## 3. Method or Modifier (Optional Second Component)

Include a method or modifier **only** if it adds meaningful distinction or disambiguates the command. Use lowercase with underscores to combine multiple words.

### Examples

* `aerial`
* `bootstrap`
* `by_flight`
* `by_method`
* `comparative`
* `custom`
* `mean`
* `mixed_methods`

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

This list is an incomplete (and possibly outdated) subset of standard names. Refer to the current list at:

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
| -------------------------------------------- | ----------------------------------------------- | -------------------------------------------------------------------------------- |
| `write_bootstrap_progress_intervals`         | `write_bootstrap_interval_progress_probability` | Verb (write), method (bootstrap\_interval), and variable (progress\_probability) |
| `filter_by_method`                           | `filter_by_method_data`                         | Verb (filter), modifier (by\_method), and object (data)                          |
| `write_monitoring_aerial`                    | `write_aerial_monitoring`                       | Verb (write), method (aerial), and object (monitoring)                           |
| `write_population_status_from_mixed_methods` | `write_mixed_methods_population_status`         | Verb (write), method (mixed\_methods), and variable (population\_status)         |
| `write_csv_probability`                      | `write_progress_probability --format csv`       | Verb (write), variable (progress\_probability); format passed as argument        |
| `write_progress_probability_figure`          | `plot_progress_probability`                     | Verb (plot), variable (progress\_probability)                                    |
| `plot_comparative_catch_curves`              | `plot_comparative_catch`                        | Verb (plot), method (comparative), variable (catch); "curves" is redundant       |
| `plot_custom_cpue_vs_cum_captures`           | `plot_custom_cpue_vs_cumulative_captures`       | Verb (plot), method (custom), variable (cpue\_vs\_cumulative\_captures)          |
| `plot_cpue_vs_cum_captures`                  | `plot_cpue_vs_cumulative_captures`              | Verb (plot), variable (cpue\_vs\_cumulative\_captures)                           |

---

## 7. CLI Subcommand Structure

Organize commands logically using a CLI framework like Typer:

```bash
geci write bootstrap_progress_probability --taxon LAAL ...
geci plot cpue_vs_cumulative_captures --region clarion ...
```

This structure supports modularity and improves discoverability.

---

## 8. Guidelines for Adding New Commands

1. **Start with a standard verb.**
2. **Add a method or modifier only when it improves clarity or resolves ambiguity.**
3. **Use a documented, standard variable.**
4. **Pass `taxon`, `region`, `season`, and `format` as CLI arguments.**
5. **Avoid unnecessary duplication or verbosity.**
6. **Ensure the command name communicates the main action and data scope.**
7. **Test the command for consistency with naming and execution patterns.**
