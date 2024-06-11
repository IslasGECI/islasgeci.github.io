---
layout: post
title: "Blameless Postmortem: Incidente con el pico de la masa"
author: Memo, Nepo y Mario
tags: equipo aprendizaje
---

## Resumen del incidente
En el reporte anterior al del 28 mayo no reportamos diferencias en el pico de la masa.
En el reporte del 28 de mayo sí reportamos diferencias.

## ¿Qué nos condujo al evento?
Los JSON que utilizamos para escribir el reporte los editábamos en diferentes pasos del `Makefile`.
Los reescribíamos.
El JSON de una variable no lo pasamos por un paso y la variable `is_there_difference` se quedó con _null_.
Al pasar esa variable por un condicional `if` el _null_ lo interpretó como falso.
No había diferencias.
Al asegurarnos que todas las variables biológicas pasaran por todos los pasos notamos que sí había diferencias.

## Falla
El orden que seguimos para calcular si las variables climáticas explican o no las diferencias de las variables biológicas entre temporadas es:

1. Ajustar un modelo sin tomar en cuenta las variables climáticas.
1. Revisamos si hay diferencias significativas entre temporadas para cada variable biológica.
1. Para las variables biológicas en las que encontramos alguna diferencia significativa, ajustamos algunos modelos que sí incluyan el clima.
1. Comparamos los AIC de cada modelo y decidimos cual es el mejor.

En el caso del pico de la masa, nos saltábamos el segundo paso.
Con el éxito de vuelo ocurría que no usábamos `jinja_render` para escribir su sección.
Esta sección estaba escrita a mano en el reporte.
Parecía que nos faltó actualizar esa sección con su versión automática.

## Impacto
- Yuliana presentó los resultados incorrectos en un congreso (IAPC7).
- Era lento modificar el texto del reporte. Al hacer un cambio en el tex se volvían a hacer todos los resultados.

## Detección
- Después de automatizar las secciones apareció en el reporte que el pico de la masa sí tenía diferencias.
- Al revisar el tex del reporte notamos que la sección **Éxito de vuelo** estaba escrita a mano.

## Respuesta

![Imagen Checker](/assets/images/respuesta_incidente_glmm.png)

En la figura de arriba vemos a la función `write_results()` (línea 46).
Esa es la que usamos para escribir la sección 8.1 del reporte.
En la sección 8.1 presentamos las diferencias entre temporadas de las variables biológicas.
En la línea 48 de la figura de arriba, vemos la función `CheckerDifferences()`.
Esta función nos asegura que no está vacía la variable que nos indica si hay o no diferencias.

El reporte ahora ya no se puede escribir si la variable está vacía.
Cada vez que le pasemos los datos a la función `write_results()` revisaremos que las variables sean las correctas.
Con esto nos aseguramos que los archivos con los que escribimos las secciones del reporte ya pasaron por todo el flujo de trabajo.
Si no fuera así, en lugar del reporte se generaría un error.
Eso lo notaríamos porque el canal de integración continua estaría en rojo.

## Recuperación

### Reducción del tiempo de recuperación

## Línea de tiempo

- [2024-05-08](https://bitbucket.org/IslasGECI/glmm_petrel_san_benito/commits/a69028d55c6eae3b19c2e3c85985bf5a47ccd9ba) Retomamos la tarea de glmm. Al hacer un cambio en el tex se volvían a calcular todos los resultados.
- [2024-05-23](https://bitbucket.org/IslasGECI/glmm_petrel_san_benito/commits/ce3e5da7f52fd632f49c86e8cc490ea176260b89) Trabajamos en 🔨⚡ fix report ingredients.
- [2024-05-28](https://bitbucket.org/IslasGECI/glmm_petrel_san_benito/commits/5523fd1a7a846c93fdd03ef03e47398ff5fee657) Automatizamos la escritura de todas las secciones. Le escribimos a YB informádole que "Existen diferencias entre temporadas para el pico de la masa".
- [2024-05-29](https://mail.google.com/mail/u/0/#search/from%3A(braulio.rojas%40islas.org.mx)+to%3A(yuliana.bedolla%40islas.org.mx)+subject%3A(Diferencias+en+variables+biol%C3%B3gicas+y+de+alimentaci%C3%B3n+para+petrel+negro+en+Isla+San+Be)) Tuvimos la reunión con YB.

## Cinco "¿por qué?"
1. ¿Por qué en el reporte del 28 de mayo si hay diferencias en el pico de la masa?
Porque la sección de las diferencias entre temporadas del pico de la masa se renderiza correctamente.

1. ¿Por qué no se renderizaba correctamente la subsección del pico de la masa?
Porque le pasabamos un JSON incompleto.
No tenía información si había o no diferencias entre temporadas.

1. ¿Por qué el JSON estaba incompleto?
Porque no pasaba por el archivo de código que discernia si hay diferencias o no.

1. ¿Por qué no pasaba por el archivo de código que determinaba si había o no diferencias?
El reporte esperaba un ingrediente, pero ese ingrediente tenía que pasar por un flujo que no era obligatorio.

1. ¿Por qué ese flujo no era obligatorio?
La reescritura de este JSON complicaba saber en qué etapa del flujo estaba.
Como desde el inicio ya estaba generado el JSON la dependencia ya estaba cumplida.
Nadie generaba un error.

1. ¿Por qué era complicado saber en qué etapa del flujo estaba el JSON?
Porque había muchos pasos intermedios para generar la sección de resultados que necesita el JSON.
El JSON se llamaba igual en todos los pasos intermedios.


## Causa raiz
No estamos manejamos bien las dependencias en los objetivos del `Makefile`.
Tal vez si generamos las recetas del `Makefile` a partir del TDD hubiéramos obtenido un error.

## Lecciones aprendidas y cosas ganadas
- Es malo reecribir los archivos JSON.

## Acciones correctivas
- Escribimos distintos JSON para cada etapa del flujo.
- Nos aseguramos de que la variable `is_there_difference` tenga un valor booleano.
- Escribimos el **Éxito de vuelo** de manera automática.

