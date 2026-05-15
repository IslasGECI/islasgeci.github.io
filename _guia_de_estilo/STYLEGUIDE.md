---
layout: page
title: Style Guide
tagline: Guía de estilo
description: Style guide for Grupo de Ecología y Conservación de Islas
---

# Style Guide for Grupo de Ecología y Conservación de Islas

## Commit Messages

The following guidelines define how to write effective commit messages.

- Start with an emoji from the Gitmoji standard to indicate the type of change.
- Follow the emoji with an imperative verb (e.g., “Add”, “Fix”, “Refactor”).
- Describe **why** the change was made, not just **what** was changed.
- Prioritize explaining **why** over **what**.
- Limit each line to ≤ 80 characters.
- The first line must be a complete sentence and act as a summary.
- Separate the summary from the body with a blank line.
- The body should consist of well-formed paragraphs.
- The message length is unrestricted if needed for clarity.
- Prefer many small commits over few large ones.

---

## Repository Content Rules

- Only plain text files may be committed (`csv`, `json`, `svg`, `tex`, `txt`, etc.).
- Binary files are not allowed, except under strict conditions (see below).
- Files must not exceed 1 MB or ~10,000 lines of code.
- Prefer `svg` over any binary image format.
- Binary images are allowed only if:
  - They are required for application functionality, and
  - Their largest dimension is ≤ 256 pixels.
- Any exception must be explicitly agreed upon.

---

## Repository Structure (Class 3)

This structure is required for Class 3 repositories.
There is currently no defined standard for other repository classes.

The structure is inspired by Cookiecutter Data Science.
Changes must be validated against that reference to avoid contradictions.


```
├── Dockerfile         <- Required to build the repository image using
│                         `docker build`
├── Makefile           <- Instructions to create reports or results using Make
├── README.md          <- Contains an ordered list of the expected project outputs
│                         and is the only source that defines the required work
├── analyses.json      <- Describes the relationships between files (data, reports,
│                         results, scripts, etc.) of each analysis
├── bitbucket-pipelines.yml  <- Bitbucket Pipeline configuration file
├── data/
│   ├── external/      <- Third-party data
│   ├── processed/     <- Processed data shaped to meet the requirements of
│   │                     modules and packages for statistical analysis and modeling.
│   │                     Also includes intermediate results not directly included
│   │                     in the report, such as KML and SHP files.
│   └── raw/           <- Original, immutable raw data from GECI
│
├── docs/              <- Documentation for analysts
├── notebooks/         <- Jupyter notebooks
├── references/        <- Articles, books, and notes relevant to the project and
│   │                     to the results being produced. This includes the articles
│   │                     cited in the reports we generate
│   ├── references.bib <- Reference file for LaTeX in BibTeX format
│   └── references.md  <- List of references with descriptions and hyperlinks in
│                         Markdown
│
├── renv.lock          <- Record of installed R packages and their versions. This
│                         file is generated with the `renv` package and is equivalent
│                         to the `requirements.txt` file generated with `pip freeze`
├── reports/           <- Reports and presentations intended for the corresponding
│   │                     project director. Preferred source formats for reports are
│   │                     LaTeX and Markdown. Plain text formats are preferred to
│   │                     enable version control. Reports are delivered in PDF format
│   │                     or, if required by the Director, Pandoc is used to convert
│   │                     them to Word.
│   ├── figures/       <- Figures included in analysis reports
│   ├── non-tabular/   <- Non-tabular results included in analysis reports
│   └── tables/        <- Tables included in analysis reports
│
├── requirements.txt   <- Lists the requirements to set up the environment for
│                         analysis, for example it can be generated with:
│                         `pip freeze > requirements.txt`
├── src/               <- Scripts used in this project
└── tests/             <- Tests that verify the reproducibility of results

```

---

## Project Core Configuration

### Makefile
The `Makefile` must contain three sections:
1. **`all` phony target**: Lists all primary outputs defined in `analyses.json`.
2. **Per-result blocks**: Variable declarations, rules for main targets, rules for dependencies, and phony rules for dependencies.
3. **General-purpose phony rules**.

### README.md
- Acts as the authoritative description of required work.
- Must define expected outputs clearly and completely.
- Contains an ordered list of the expected project outputs.

### analyses.json
- Describes the relationships between files (data, reports, results, scripts, etc.) of each analysis.

---

## Project Components

### Data
- Follow the structure defined in `data/`.
- **Raw data** must remain immutable.
- **Processed data** is shaped for analysis and includes intermediate results.
- Intermediate results belong in `data/processed/` or `reports/`.
- Data acquisition procedures must be documented.

### Reports
- Target audience: project director.
- Source formats: LaTeX or Markdown (Plain text preferred for version control).
- Output format: PDF (Word only if explicitly required).

### References
- Store in `references/`.
- Include `references.bib` (BibTeX) and `references.md` (annotated list with links).
- All cited materials must be included here.

### Tests
- Located in `tests/`.
- Must verify reproducibility of results.
- Test file names must follow the naming rules of the framework. If allowed:
    - Start with prefix `test_` (e.g., `test_plot_island`).
    - Only letters and numbers allowed (no ñ or accented vowels).

---

## Coding Standards

### Language Requirements
- **Code Language**: R (Tidyverse style).
- **Commentary Language**: Spanish (Focus on **why** - logic/reasoning - rather than what).
- **Variable/Function Names**: English.

### Source Code Structure (`src/`)
- All scripts must reside in `src/`.
- Structure scripts into five specific sections: Header (comment block), Configuration, Inputs, Process/Analysis, and Output.
- The last four code sections below correspond to a `# ==== [SECTION] ====` marker in Spanish.

#### 1. Header Section (Comment Block)
Use EXACTLY this structure with the opening and closing separators.
Always include ALL sections (even if minimal) and never change section order:

```r
# ==========================================
# Título: (1 línea)
# 
# Contexto (Por qué): (2–4 líneas)
# 
# Descripción (Qué / Cómo): (3–6 líneas)
# 
# Entradas: (Sin bullets, uno por línea, incluir capa si aplica: `(capa: "nombre")`)
#   *Ejemplo*: data/processed/file.gpkg (capa: "layer_name")
# 
# Salidas: (Sin bullets, uno por línea)
# 
# Dependencias: (Un paquete por línea, sin comas)
#   *Ejemplo*: sf
#             tidyverse
# 
# Notas: (Opcional, máximo 4 bullets. Usar bullets SOLO en esta sección)
# ==========================================
```

**Consistency Rules for Header Section (Comment Block):**
- Use ONLY Spanish (keep technical function names in English, e.g., `st_bbox()`, `ggplot2`).
- Never mix English and Spanish section names.
- Always write in imperative form ("Carga...", "Calcula...").
- Do NOT use infinitive form (avoid: "Cargar").
- Keep sentences short and precise; avoid narrative or storytelling.

#### 2. Configuration
- Marker: `# ==== CONFIGURACIÓN ====`
- Place all `library()` calls here with a Spanish comment explaining each package.
- Extract all "magic numbers", strings, options, and filenames into named constants.

#### 3. Inputs
- Marker: `# ==== ENTRADAS ====`
- Import each input file using the appropriate read function (e.g., `read_csv()`, `st_read()`).
- Use the path variables defined in the Configuration section.
- Suppress verbose output with options like `quiet = TRUE` or `show_col_types = FALSE`.
- Add a Spanish comment before each import explaining the data being loaded.

#### 4. Process/Analysis
- Marker: `# ==== PROCESAMIENTO / ANÁLISIS ====`
- **Linear Code Rule**: Write strictly linear code using Tidyverse style; do not use functions, loops (for, while), or control structures (if, else).
- **File-based Modularity**: The script reads input files and writes exactly one output file (CSV, JSON, or GPKG).
- **Comment every single line of code in Spanish**.

#### 5. Output
- Marker: `# ==== SALIDA ====`
- Write the single output file using the appropriate write function (e.g., `write_csv()`, `st_write()`, `ggsave()`).
- Use the output path variable defined in the Configuration section.
- Add a Spanish comment before the write explaining what is being written.


### Naming Conventions

#### R Packages
- All lowercase, no underscores, dots, or CamelCase (e.g., `seabirdtracking`, `cameradata`, `maritimeinformatics`).

#### Code Files (Scripts)

- The name must start with a verb.
- Only letters and numbers allowed (no ñ or accented vowels).
- The script name must match the `Makefile` target defining the set of produced artifacts.
- Examples: `render_density_maps_albatross_guadalupe`, `create_temperature_field`.

#### Commands, Functions and Methods

**Level 1:**

- **In-Memory layer.** No side effects:
    - `compute_*()`: Calculations in memory, returns result.
    - `plot_*()`: Generates visualization in memory.
    - `get_`: Use only if a complementary `set_` exists; otherwise, use `compute_`.
    - `input2output`: Format change (e.g., `csv2df`, `lbs2kg`).
    - `is_`: Returns logical values (e.g., `is_dog()`).

- **Disk I/O layer.** Persistence of preprocessed data and intermediate results:
    - `read_*()` / `write_*()`: Native formats (e.g., `.rds`).
    - `import_*()` / `export_*()`: Interoperable formats (e.g., `.csv`, `.gpkg`).
    - `get_`: Use only if a complementary `set_` exists; otherwise, use `read_` or `import_`.

**Level 2:**

- **Artifact layer.** Creation and rendering of persistent artifacts:
    - `create_*()`: Reads from disk (`read_*` or `import_*`), generates result (`compute_*`), and writes to disk (`write_*` or `export_*`).
    - `render_*()`: Reads from disk (`read_*` or `import_*`), generates visualization (`plot_*`), and writes to disk (`write_*` or `export_*`).

Only Level 2 functions (`create_*()` and `render_*()`) can call Level 1 functions.
Level 1 functions must not call each other; they should be independent and reusable.

#### Variables in the Makefile
Variable names that define sets of files consist of five elements:

```
format + variable/result + monitoring/result type + species/group + region
```

- Examples: `xlsx_nests_census_albatross_guadalupe`, `png_density_maps_albatross_guadalupe`.
- Redundant words already present in the repository name may be omitted.

#### Phony Targets
- Names must be nouns or adjectives.
- If the noun is omitted, the adjective is assumed to refer to the repository.

### Other Files and Directories
- Prefer [_snake_case_](https://en.wikipedia.org/wiki/Snake_case).
- Only letters and numbers are allowed (no ñ or accented vowels).
- Date formats. If a filename includes a date:
    - For internal use, use `YYYY-MM-DD` (e.g., `2026-01-15`). Place the date at the beginning of the filename.
    - For external use, in Spanish, use `DD-mmm-YYYY` (e.g., `15-ene-2026`). Place the date at the end of the filename.
    - For external use, in English, use `Mmm-DD-YYYY` (e.g., `Jan-15-2026`). Place the date at the end of the filename.

#### Variables

- Use English
- Use descriptive names
- Avoid abbreviations unless explicitly allowed
- **Prefixes**
    - `i_` (iteration)
    - `ind_` (index)
    - `is_` (boolean)
    - `n_` (counts)
- **Suffixes**. Indicate units separated by underscore:
    - `distance_m`
    - `time_s`
    - `weight_kg`

### Allowed Abbreviations

- `sst`: Sea Surface Temperature
- `eez`: Exclusive Economic Zone
- `x` / `y`: UTM zonal/meridional coordinate vector
- `X` / `Y`: UTM coordinate grid
- `lon` / `lat`: Geographic zonal/meridional coordinate vector
- `LON` / `LAT`: Geographic coordinate grid

---

## Consistency & Maintenance

- Ensure consistency between code, documentation, and outputs.
- Proactively remove dead code, unused scripts, and obsolete configurations.
- Keep terminology uniform across the entire project.
