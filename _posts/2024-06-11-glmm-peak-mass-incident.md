---
layout: post
title: "Blameless Postmortem: Incidente con el pico de la masa"
author: Memo, Nepo y Mario
tags: equipo aprendizaje
---

## Resumen del incidente
En el reporte anterior al del 28 mayo no reportamos diferencias en el pico de la masa ni en el éxito de vuelo.
En el reporte del 28 de mayo sí reportamos diferencias.

## ¿Qué nos condujo al evento?
Los JSON que utilizamos para escribir el reporte los editábamos en diferentes pasos del `Makefile`.
Los reescribíamos.
En el JSON de la variable **pico de la masa** no calculamos la variable `is_there_difference` y se quedó con _null_.
Al pasar la variable `is_there_difference` por un condicional `if` el _null_ lo interpretó como falso.
Escribíamos la sección del reporte como si no hubiera diferencias en el **pico de la masa** ni en el **éxito de vuelo**.
Al asegurarnos que todas las variables biológicas pasaran el flujo completo notamos que sí había diferencias.

## Falla

Queremos saber si las variables climáticas explican las diferencias de las variables biológicas entre temporadas. Para esto seguimos los siguientes pasos:
1. Ajustar un modelo sin tomar en cuenta las variables climáticas.
1. Revisamos si hay diferencias significativas entre temporadas para cada variable biológica.
1. Para las variables biológicas en las que encontramos alguna diferencia significativa, ajustamos algunos modelos que sí incluyan el clima.
1. Comparamos cada modelo usando el _Akaike Information Criterion_ y decidimos cual es el mejor.

En el caso del **pico de la masa**, nos saltábamos el segundo paso.

Con el **Éxito de vuelo** ocurría que no usábamos `jinja_render` para escribir su sección.
Esta sección estaba escrita a mano en el reporte.
Nos faltó actualizar esa sección con su versión automática.

## Impacto
- Yuliana presentó los resultados incorrectos en un congreso (IAPC7).
- Era lento modificar el texto del reporte. Al hacer un cambio en el tex se volvían a hacer todos los resultados.

## Detección
- Después de automatizar las secciones apareció en el reporte que el **pico de la masa** sí tenía diferencias.
- Al revisar el tex del reporte notamos que la sección **Éxito de vuelo** estaba escrita a mano.

## Respuesta

![Imagen respuesta](/assets/images/respuesta_incidente_glmm.png)

En la figura de arriba vemos a la función `write_results()` (línea 46).
Esa es la que usamos para escribir la sección 8.1 del reporte.
En la sección 8.1 presentamos las diferencias entre temporadas de las variables biológicas.
En la línea 48 de la figura de arriba, vemos la función `CheckerDifferences()`.
Esta función nos asegura que la variable `is_there_difference` no está vacía.

El reporte ahora ya no se puede escribir si la variable `is_there_difference` está vacía.
Cada vez que le pasemos los datos a la función `write_results()` revisaremos que las variables del JSON sean las correctas.
Con esto nos aseguramos que los archivos con los que escribimos las secciones del reporte ya pasaron por todo el flujo de trabajo.
Si no fuera así, en lugar del reporte se generaría un error.
Eso lo notaríamos porque el [canal de integración continua](https://bitbucket.org/IslasGECI/glmm_petrel_san_benito/pipelines/results/page/1) estaría en rojo.

## Recuperación

### Reducción del tiempo de recuperación

## Línea de tiempo

- [2024-05-08](https://bitbucket.org/IslasGECI/glmm_petrel_san_benito/commits/a69028d55c6eae3b19c2e3c85985bf5a47ccd9ba) Retomamos esta tarea. Al hacer un cambio en el tex se volvían a calcular todos los resultados.
- [2024-05-23](https://bitbucket.org/IslasGECI/glmm_petrel_san_benito/commits/ce3e5da7f52fd632f49c86e8cc490ea176260b89) Trabajamos en arreglar las dependencias de los `*.json` en el Makefile `🔨⚡ fix report ingredients`.
- [2024-05-28](https://bitbucket.org/IslasGECI/glmm_petrel_san_benito/commits/5523fd1a7a846c93fdd03ef03e47398ff5fee657) Automatizamos la escritura de todas las secciones. Le escribimos a Yuliana Bedolla informándole que "Existen diferencias entre temporadas para el pico de la masa".
- [2024-05-29](https://mail.google.com/mail/u/0/#search/from%3A(braulio.rojas%40islas.org.mx)+to%3A(yuliana.bedolla%40islas.org.mx)+subject%3A(Diferencias+en+variables+biol%C3%B3gicas+y+de+alimentaci%C3%B3n+para+petrel+negro+en+Isla+San+Be)) Tuvimos la reunión con Yuliana Bedolla. Nos preguntó a qué se debía este nuevo resultado.
- [2024-05-29](https://bitbucket.org/IslasGECI/glmm_petrel_san_benito/commits/ea86ef107f16ba6cbcb22bccb5fb3fb04e834562). Implementamos una revisión para que no vuelva a suceder este error.

## Cinco "¿por qué?"
1. ¿Por qué antes del reporte del 28 de mayo no hay diferencias en el **pico de la masa**?
    - Porque la sección de las diferencias entre temporadas del **pico de la masa** no se genera correctamente.
1. ¿Por qué no se generaba correctamente la sección del **pico de la masa**?
    - Porque le pasábamos un JSON incompleto.
    No tenía información si había o no diferencias entre temporadas.
1. ¿Por qué el JSON estaba incompleto?
    - Porque no pasaba por el archivo de código que discernía si hay diferencias o no.
1. ¿Por qué no pasaba por el archivo de código que determinaba si había o no diferencias?
    - El reporte esperaba un ingrediente, pero ese ingrediente tenía que pasar por un flujo que no era obligatorio.
1. ¿Por qué ese flujo no era obligatorio?
    - La reescritura de este JSON complicaba saber en qué etapa del flujo estaba. 
    Como desde el inicio ya estaba generado el JSON la dependencia ya estaba cumplida. 
    Nadie aseguraba que se cumplía el flujo. Nadie aseguraba que el JSON tenía el valor correcto en la variable.
1. ¿Por qué era complicado saber en qué etapa del flujo estaba el JSON?
    - Porque había muchos pasos intermedios para generar la sección de resultados con información del JSON.
    El JSON se llamaba igual en todos los pasos intermedios.

## Causa raíz
- No manejamos bien las dependencias en los objetivos del `Makefile`.
- Es mala práctica reescribir los archivos, en este caso los JSON.

## Lecciones aprendidas y cosas ganadas
- Tal vez si generamos las recetas del `Makefile` a partir del TDD hubiéramos obtenido un error.

## Acciones correctivas
- Escribimos distintos JSON para cada etapa del flujo.
- [Nos aseguramos](https://bitbucket.org/IslasGECI/glmm_petrel_san_benito/commits/ea86ef107f16ba6cbcb22bccb5fb3fb04e834562) de que la variable `is_there_difference` tenga un valor booleano.
- Escribimos las secciones 8.1 y 8.2 de automáticamente.

