---
layout: post
title: "Desacoplamiento de análisis y visualización"
author: Evaristo
tags: programación visualización
---

En nuestro canal de integración, separamos explícitamente el cálculo de resultados del graficado.
Seguimos un flujo de trabajo que consta de los siguientes pasos:

1. Lectura y procesamiento de datos. (`read_*`, `import_*`)
1. Cálculo de resultados en memoria. (`compute_*`)
1. Escritura de resultados en disco. (`write_*`, `export_*`)
1. Lectura de resultados desde disco. (`read_*`)
1. Generación de visualizaciones. (`plot_*`)
1. Escritura de gráficas en disco. (`read_*`, `import_*`)

Así, definimos dos fases independientes.
En la primera fase calculamos el resultado (pasos 1-3; `create_*`).
En la segunda fase visualizamos el resultado (pasos 4-6; `render_*`).
Esto evita que acoplemos el cálculo y el graficado en un solo paso.

Como recomendación general, procuramos no graficar en el mismo lenguaje en el que calculamos los resultados.
Cuando es posible, graficamos en gnuplot.
Esto refuerza la separación de responsabilidades y reduce dependencias implícitas entre etapas.

En Make, esta separación puede reflejarse en la nomenclatura de funciones:

- `create_*`: generan resultados y los escriben en disco.
- `render_*`: leen resultados existentes (no los generan), producen la visualización y la guardan en disco.

Las funciones `render_*` no realizan cómputo desde cero; operan exclusivamente sobre resultados previamente generados.
Esta distinción hace que los pasos del canal de integración sean más explícitos, facilita su mantenimiento y permite reutilizar resultados intermedios sin recalcularlos.

Este diseño evita que la visualización dependa directamente del cómputo.
Con ello, mejoramos el desacoplamiento, facilitamos la reutilización de resultados y hacemos más claro el origen de cada resultado y los pasos seguidos para generarlo.

---

Además de separar cálculo y visualización, distinguimos explícitamente entre capas puras y capas de materialización.

La arquitectura se organiza en tres niveles:

1. **Capa pura:** operaciones en memoria.

   * `compute_*`
   * `plot_*`

2. **Capa de materialización:** operaciones de lectura y escritura en disco.

   * `create_*`
   * `render_*`

3. Capa de integración:

   * Make

Las funciones `compute_*` y `plot_*` operan exclusivamente en memoria y no tocan al disco.

Las funciones `create_*` y `render_*` son responsables exclusivamente de materializar artefactos persistentes.

* `create_*` siguen el patrón: `read_* -> compute_* -> write_*`
* `render_*` sigue el patrón: `read_* -> plot_* -> write_*`

Las capas de materialización no contienen lógica computacional propia; delegan toda transformación en las funciones puras correspondientes.

Los formatos forman parte explícita del contrato operacional del pipeline.

Pueden existir múltiples exports y renders para distintos formatos y representaciones derivadas de un mismo resultado.

* `create_temperature_to_geopackage`
* `render_temperature_from_geopackage_to_png`

Make constituye la capa más alta del sistema y el único orquestador global del pipeline.
Las funciones `create_*` y `render_*` no se llaman entre sí; únicamente Make puede invocarlas.
