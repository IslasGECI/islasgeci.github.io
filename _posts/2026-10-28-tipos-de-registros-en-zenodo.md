Ahora tenemos registros de Software en Zenodo, además de los registros de Reportes y Datos.
Los registros de Software siguen un flujo de trabajo distinto al de los otros.
Cada tipo de registro cuenta con su propio checklist.

## Reportes

Nuestros registros de reportes en Zenodo incluyen solo los artefactos PDF y PNG generados, nunca los archivos consignados ni los datos.
Para crear un nuevo registro de un reporte o publicar una nueva versión, realizamos el proceso en Zenodo.
Esto lo hacemos manualmente siguiendo el [checklist para reportes](https://islas.dev/guia_de_estilo/review_checklists#checklist-for-a-report-on-zenodo).

> NOTA: En el futuro me gustaría que esto lo hiciéramos de manera automática mediante nuestro canal de integración (Bitbucket Pipelines, GitHub Actions, Jenkins, etc.) usando la API de Zenodo.

## Datos

Nuestros registros de datos en Zenodo incluyen solo datos, nunca los archivos consignados ni los artefactos generados.
Para crear un nuevo registro de datos o publicar una nueva versión, realizamos el proceso en Zenodo. Esto lo hacemos manualmente siguiendo el [checklist para datos](https://islas.dev/guia_de_estilo/review_checklists#checklist-for-a-dataset-on-zenodo).

## Software

Nuestros registros de software en Zenodo incluyen solo los archivos consignados, nunca los artefactos generados ni los datos.
Para crear un nuevo registro de software o publicar una nueva versión, realizamos el proceso en GitHub.
Esto lo hacemos siguiendo el [checklist para software](https://islas.dev/guia_de_estilo/review_checklists#checklist-for-a-software-release-on-github).

La integración consta de tres etapas.
Primero, vinculamos nuestra cuenta de GitHub en la [configuración de GitHub en Zenodo](https://zenodo.org/account/settings/github/) y activamos el repositorio mediante el switch correspondiente.
Esta configuración necesitamos hacerla solo una vez por repositorio.

Luego, hacemos un lanzamiento (*release*) en GitHub.
Zenodo archivará automáticamente dicho lanzamiento y le asignará un DOI.
Las actualizaciones de nuestros registros de software en Zenodo siguen este flujo de trabajo en GitHub, y no el flujo de trabajo manual que usamos para los datos.

Por último, copiamos el badge del DOI desde Zenodo y lo incluimos en el README del repositorio y la URL del DOI en la descripción del repo en GitHub. Este último paso también necesitamos hacerlo solo una vez por repositorio.
