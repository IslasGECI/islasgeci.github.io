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

## Nivel 1: Funciones primitivas

El nivel 1 se compone de dos capas funcionales:

- **Capa pura:** operaciones en memoria sin efectos secundarios.
   - `compute_*`
   - `plot_*`
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

- **Capa de materialización:** responsable de la creación de artefactos persistentes.
   - `create_*`: sigue el patrón `read/import -> compute_* -> write/export`
   - `render_*`: sigue el patrón `read/import -> plot_* -> write/export`

La capa de materialización no contiene lógica computacional propia.
Delega todo el análisis a las funciones puras correspondientes.

Las funciones `create_*` y `render_*` no se llaman entre sí; únicamente Make puede invocarlas.

## Nivel 3: Orquestación

El nivel 3 es la capa en la que Make orquesta la producción de resultados.
Make resuelve las dependencias entre los artefactos.
Por ejemplo, llamará a `create_*` antes que a `render_*` para garantizar que los insumos para la visualización estén disponibles antes de intentar renderizarla.

## Nivel 4: Composición de servicios

El nivel 4 es la capa en la que Docker Compose gestiona las imágenes y contenedores.

## Nivel 5: Canal de integración

El nivel 5 es la capa en la que Bitbucket Pipelines, GitHub Actions o Jenkins integran los reportes.
