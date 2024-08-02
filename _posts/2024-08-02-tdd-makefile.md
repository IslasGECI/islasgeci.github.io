---
layout: post
title: Algunos ejemplos de TDD para desarrollar las recetas del Makefile 
author: Memo, Nepo y Mario
tags: equipo aprendizaje
---
## Descripción del problema
- El `Makefile` del repo `lambdas_aves_marinas` tenía un objetivo que se modificaba a sí mismo. Esto hace que el objetivo siempre se tenga que generar aunque los ingredientes no se modificaron. 

- Con esto identificamos otros problemas derivados del uso incorrecto del `Makefile` y que podríamos cambiar para mejorar su uso.

## Otros síntomas de uso incorrecto que detectamos
-  `Makefile`  muy largos vs. cortos. ¿Cómo podemos hacer el `Makefile` más cortos?
- Definiciones de variables en el `Makefile` ¿Cuáles son sus ventajas y desventajas?
- ¿Qué ventajas y desventajas nos da el uso de abreviaturas como `@`, `<`, `word`, `@F`, `@D`?
- Dos archivos de salida (objetivos) por una receta. Por ejemplo: `reports/figures/mean_lambdas_per_taxon.png reports/tables/mean_lambdas_per_taxon_interval.csv:`
- Reescritura de archivos, un ejemplo lo podemos ver en la nota [Blameless Postmortem: Incidente con el pico de la masa](https://islas.dev/2024/06/11/glmm-peak-mass-incident)

## Propuestas de solución
- Colocar un ingrediente por línea. Esto ayuda a la legibilidad para los humanos.
- Los _scripts_ que generemos tienen que tener una sola salida. Los futuros _scripts_ tienen que seguir esta idea y separar los que identifiquemos que tengan dos salidas.
- Sobre las abreviaturas, decidimos dejar algunas por convención `$<` y `$@` siempre  y cuando sea una receta corta con un solo ingrediente y objetivo. Evitamos el uso del resto de las abreviaturas.
- Si la variable representa un solo archivo, usamos el nombre del archivo y no la variable. 
- Usamos variables solo cuando representan a más de un archivo.
- Hay ocasiones que los archivos en una solo variable tiene diferente procesamiento. En estos casos preferimos dividir en dos variables. Por ejemplo, datos de islas que pasan por diferente flujo de análisis.
- En las funciones "enlatadas" nos permiten obtener resultados que no irán en el reporte y solo definir los resultados que sí irán. Esto nos ayuda a no repetir código y hacer más corto el `Makefile`.

Abajo podemos ver algunos ejemplo de nuestros intentos.

## `vocalizacion-pardela`
### Ventajas
- Desarrollamos las funciones "enlatadas" sin necesidad de correr todo el reporte.
-  [Aquí](https://bitbucket.org/IslasGECI/vocalizacion-pardela/commits/aa68bf297e024ec4701c723aa60e03441faad714) podremos encontrar un ejemplo del desarrollo de las funciones con TDD

### Desventajas:
- Tuvimos que agregar un nuevo archivo: [`Makefile.test`](https://bitbucket.org/IslasGECI/vocalizacion-pardela/src/84b2475a07f6b172553cfccf36cf03b289b7f58d/spec/filter_by_island_spec.sh#lines-9)

## `maya_k9`
### Ventajas
- Construímos solo lo que necesita la receta.

### Desventajas:
- Cada prueba corre todo el reporte. Consume mucho tiempo y recursos para reportes grandes (por ejemplo: lambdas_aves_marinas)

### Acciones:
- Seguir mejorando los Makefile que ya existen con las propuestas de solución.
- Implementar TDD al Makefile para seguir explorando ventajas y desventajas.

## Referencias
- [`vocalizacion-pardela`](https://bitbucket.org/IslasGECI/vocalizacion-pardela/)
- [`maya_k9`](https://bitbucket.org/IslasGECI/maya_k9)
- [Blameless Postmortem: Incidente con el pico de la masa](https://islas.dev/2024/06/11/glmm-peak-mass-incident)