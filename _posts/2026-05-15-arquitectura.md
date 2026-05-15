---
layout: post
title: "Arquitectura en niveles y capas"
author: Evaristo
tags: programación
---

En GECI, organizamos la arquitectura de nuestros proyectos en niveles de abstracción y capas funcionales:

![Arquitectura en niveles y capas](/assets/images/architecture.png)

## Niveles de abstracción

- Nivel 0: Datos
- Nivel 1: Funciones primitivas
- Nivel 2: Producción de artefactos
- Nivel 3: Orquestación
- Nivel 4: Composición de servicios
- Nivel 5: Canal de integración

Por lo general, las funciones de un nivel solo pueden llamar a funciones de niveles inferiores.
Por ejemplo, las funciones del nivel 2 pueden llamar a funciones del nivel 1, pero no pueden llamar a funciones del nivel 2 o 3.
Excepcionalmente, las funciones de un nivel pueden llamar a funciones de apoyo (_helper functions_ o producto de la refactorización) del mismo nivel.
Sin embargo, estas llamadas se permiten solo cuando las funciones sean privadas y pertenezcan a la misma capa funcional.

## Nivel 1: Funciones primitivas

El nivel 1 se compone de dos capas funcionales:

- **Capa pura:** operaciones en memoria sin efectos secundarios.
   - `compute_*`: cálculos en memoria.
   - `plot_*`: visualizaciones en memoria.
- **Capa I/O:** operaciones de lectura y escritura en disco.
   - `import_*`: lectura de datos interoperables en formato agnóstico del lenguaje.
   - `export_*`: escritura de datos interoperables en formato agnóstico del lenguaje.
   - `read_*`: lectura de datos en formato propio del lenguaje.
   - `write_*`: escritura de datos en formato propio del lenguaje.

Las funciones de la _capa pura_ (`compute_*` y `plot_*`) operan exclusivamente en memoria y no tocan el disco.
Las funciones de la _capa I/O_ (`import_*`, `export_*`, `read_*` y `write_*`) solo interactúan con el disco y no realizan ningún cálculo.

Las capas pura e I/O son completamente independientes entre sí.
Es decir, las funciones de la capa pura no llaman a las funciones de la capa I/O.
Además, las funciones de la capa I/O no llaman a las funciones de la capa pura.

Solo las funciones del nivel 2 pueden llamar a funciones del nivel 1.

## Nivel 2: Producción de artefactos

El nivel 2 contiene a la capa de materialización.
Esta capa es responsable de la creación de artefactos persistentes.
Las funciones de esta capa delegan todo el análisis a las funciones del nivel 1 y no contienen lógica computacional propia.

- **Capa de materialización:**
  - Las funciones `create_*` (nivel 2) siguen el patrón:
    1. `read/import`: nivel 1, capa I/O.
    1. `compute_*`: nivel 1, capa pura.
    1. `write/export`: nivel 1, capa I/O.
  - Las funciones `render_*` (nivel 2) siguen el patrón:
    1. `read/import`: nivel 1, capa I/O.
    1. `plot_*`: nivel 1, capa pura.
    1. `write/export`: nivel 1, capa I/O.

Las funciones `create_*` y `render_*` no se llaman entre sí; únicamente Make puede invocarlas.

## Nivel 3: Orquestación

El nivel 3 es la capa en la que Make orquesta la producción de resultados.
Make resuelve las dependencias entre los artefactos.
Por ejemplo, llamará a `create_*` antes que a `render_*` para garantizar que los insumos para la visualización estén disponibles antes de intentar renderizarla.

## Nivel 4: Composición de servicios

El nivel 4 es la capa en la que Docker Compose gestiona las imágenes y contenedores.

## Nivel 5: Canal de integración

El nivel 5 es la capa en la que Bitbucket Pipelines, GitHub Actions o Jenkins integran los reportes.
