---
layout: post
title: "Refactorización de código de predicción de sexo de albatros de laysan en isla Guadalupe"
author: Francisco Alejandro Padilla Gomez
tags: equipo
---

<!-- Introducción -->
La implementación de _Test-Driven Development_ (TDD) en el área de ciencia de datos ha sido un reto.
TDD es un reto aún mayor cuando se lleva a cabo en código reliquia.
El código reliquia es un código fuente relacionado a una tecnología sin soporte técnico.
El código reliquia no es apto para la metodología actual de la organización.
Mi misión como practicante fue la implementación de dicha metodología al [repositorio de Dimorfismo](https://github.com/IslasGECI/dimorfismo) en GitHub. 
Además, las pruebas dependían mucho del código de producción. 
Igualmente otra misión fue hacer que las pruebas no dependieran del código de producción. 
En este reporte analizamos lo que realicé durante mi instancia en la organización.

<!-- Descripción del problema -->
Dentro del repositorio, el enfoque realizado fue hacia 3 carpetas `src/`, `tests/` y `R/`. 
Las pruebas se encuentran en la carpeta `tests/`.
En las pruebas no debe existir ninguna dependencia a la carpeta `src/`.
El problema principal fue que encontramos dicha dependencia.
Encontramos que tres archivos de prueba tienen dependencias hacia archivos en `src/`. 
La dependencia hacia `src/` hace el código mucho más lento a la hora de su ejecución. 
La dependencia no obedece las metodologías planteadas por el grupo.
La primera tarea que realizamos fue la eliminar dicha dependencia en las pruebas.

<!-- Desarrollo del problema -->
El primer archivo analizado fue `/tests/testthat/tests_01_create_parameter_logistic_model_LAAL.R`.
El archivo contiene la instrucción:
```R
source("src/01_create_parameter_logistic_model_LAAL.R")
```
la cual crea la dependencia con la carpeta `src/`.
Revisamos el archivo encontrando que era de una longitud mayor a la esperada.
Creamos una función en la carpeta `R/` que hiciera lo mismo (Copiar y pegar el código). 
Debido a la longitud de la función, se agregó como objetivo su refactorización.
Debido a la refactorización, fue necesario crear nuevas pruebas para las funciones hechas.

<!-- Pruebas -->
Las pruebas realizadas para las funciones resultantes de la refactorización se localizan en el archivo 
`/tests/testthat/tests_regretion_to_data_frame_coefficients_function.R` y las funciones en el archivo 
`/R/regretion_to_data_frame_coefficients_function.R`. 
Comenzamos entendiendo los procesos llevados acabo en la función "grande" para posteriormente, separar dichos procesos en funciones diferentes. 
La refactorización comenzó con las funciones `fit_null_model()` `fit_complete_model()`  y `fit_stepwise`.
Las funciones `fit_null_model()` `fit_complete_model()` no tuvieron problemas.
La función `fit_stepwise()` tuvo un problema causado por _lazy evaulation_.
La función `fit_stepwise()` usaba como argumentos de entrada modelos. 
Los modelos fueron realizados por las funciones `fit_null_model()` y `fit_complete_model()`. 
La solución obtenida fue poner las funciones anteriores dentro de `fit_stepwise()`.

<!-- Nuevos objetivos -->
Debido al interés de publicar dicho repositorio fue el cambio de nombres de español a inglés. 
El cambio de nombres resultó en un problema, dado que fue sensible al nombre de los datos. 
Al cambiar los nombres se modificaron archivos de datos y como funcionaban con el código.
Las pruebas fueron la guía de que problemas teníamos que resolver. 
Las pruebas son la guía numero uno para la solución de errores.
Tuvimos que hacer varias modificaciones sobre cómo el código leía archivos `.csv` y `json`. 
Igualmente debido a esto se encontraron problemas _invisibles_ para nosotros (objetos sin pruebas). 
Esto nos dio una oportunidad de crear nuevas pruebas y asegurar el código de cualquier otra instancia como estas.

<!-- Conclusión -->
Después del cambio de nombres comenzó la refactorización completa de la función `get_best_json_for_logistic_model()`.
En su gran mayoría fueron instrucciones sencillas las cuales fueron separables.
El eje se centró en ¿Cómo hago la mejor prueba?
De esta pregunta anterior se derivaron ¿Qué hace la función? ¿Qué se espera que devuelva? ¿Usa variables que utilizamos mas adelante?.
El trabajo realizado durante mi periodo en GECI fue muy interesante y me integré a una nueva cultura.
DevOps es una cultura interesante, la implementación de esta en equipos diferentes será diferente.
Sin duda, nuestro equipo tuvo una gran guía en la adaptación cultural y en la práctica creando pruebas. 