---
layout: post
title: "Tipos de registros en Zenodo"
author: Evaristo
tags: dataops equipo programación
---

Ahora tenemos registros de software en Zenodo, además de los registros de reportes y datos.
Los registros de software siguen un flujo de trabajo distinto al de los otros.
Cada tipo de registro cuenta con su propio checklist.

## Reportes

Nuestros registros de reportes en Zenodo incluyen solo los artefactos PDF y PNG generados, nunca los archivos consignados ni los datos.
Para crear un nuevo registro de un reporte o publicar una nueva versión, realizamos el proceso en Zenodo.
Esto lo hacemos manualmente siguiendo el [checklist para reportes](https://islas.dev/guia_de_estilo/review_checklists#checklist-for-a-report-on-zenodo).

> NOTA: Me gustaría que esto fuera automático mediante nuestro canal de integración (Bitbucket Pipelines, GitHub Actions, Jenkins, etc.) usando la API de Zenodo.

## Datos

Nuestros registros de datos en Zenodo incluyen solo datos, nunca los archivos consignados ni los artefactos generados.
Para crear un nuevo registro de datos o publicar una nueva versión, realizamos el proceso en Zenodo.
Esto lo hacemos manualmente siguiendo el [checklist para datos](https://islas.dev/guia_de_estilo/review_checklists#checklist-for-a-dataset-on-zenodo).

## Software

Nuestros registros de software en Zenodo incluyen solo los archivos consignados, nunca los artefactos generados ni los datos.
Para crear un nuevo registro de software o publicar una nueva versión, realizamos el proceso en GitHub.
Esto lo hacemos siguiendo el [checklist para software](https://islas.dev/guia_de_estilo/review_checklists#checklist-for-a-software-release-on-github).

La integración consta de tres etapas.
Primero, vinculamos nuestra cuenta de GitHub en la [configuración de GitHub en Zenodo](https://zenodo.org/account/settings/github/) y activamos el repositorio mediante el botón correspondiente.
Esta configuración necesitamos hacerla solo una vez por repositorio.

Luego, hacemos un lanzamiento en GitHub.
Zenodo archivará automáticamente dicho lanzamiento y le asignará un DOI.
Las actualizaciones de registros de software en Zenodo son un lanzamiento en GitHub, y no una actualización manual como la que hacemos para los datos.

Por último, copiamos el distintivo del DOI desde Zenodo y lo incluimos en el README del repositorio.
También incluimos la URL del DOI en la descripción del repositorio en GitHub.
Este último paso también necesitamos hacerlo solo una vez por repositorio.
