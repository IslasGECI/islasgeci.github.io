---
layout: post
title: "Reporte final PVVC"
author: Francisco Alejandro Padilla Gomez
tags: equipo
---

<!-- Introducción -->
La implementación de _Test-Driven Development_ (TDD) en el área de ciencia de datos ha sido un reto.
TDD es un reto aún mayor cuando se lleva a cabo en código en ruinas. 
El código en ruinas no es apto para la métodología actual de la organización.
Mi misión como practicante fue la implementaicón de dicha metología al [repositorio de Dimorfismo](https://github.com/IslasGECI/dimorfismo) en GitHub. 
Además, las pruebas dependendian mucho del código de producción. 
Igualmente otra misión fue hacer que las pruebas no dependieran del código de producción. 
En este reporte analizamos lo que realicé durante mi instancia en la organización.

---

<!-- Descripción del problema -->
Dentro del repositorio, el enfoque realizado fue hacia 3 carpetas `src/`, `tests/` y `R/`. 
Las pruebas se encuentran en la carpeta `tests/`.
En las pruebas no debe existir ninguna dependencia a la carpeta `src/`.
El problema principal fue que encontramos dicha dependencia.
Encontramos que tres archivos de prueba tienen dependencias hacia archivos en `src/`. 
La dependencia hacia `src/` hace el código mucho más lento a la hora de su ejecución. 
La dependencia no obedece las metodologías planteadas por el grupo.
La primera tarea que realizamos fue la eliminar dicha dependencia en las pruebas.

---

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

---

<!-- Desarrollo del problema -->
Las pruebas realizadas para las funciones resultantes de la refactorización se localizan en el archivo 
`/tests/testthat/tests_regretion_to_data_frame_coefficients_function.R` y las funciones en el archivo 
`/R/regretion_to_data_frame_coefficients_function.R`. 

Comenzamos entendiendo los procesos llevados acabo en la función "grande" para posteriormente, separar dichos procesos en funciones diferentes. 
La refactorización comenzó con unas funciones llamadas `fit_null_model()` `fit_complete_model()`  y `fit_stepwise` de las cuales las primeras dos no hubo problema en su separación.
La función `fit_stepwise()` tuvo un problema causado por _lazy_ _evaulation_, esto causado por los argumentos de entrada de la función. 

La función `fit_stepwise()` usaba como argumentos de entrada modelos realizados por las funciones `fit_null_model()` y `fit_complete_model()` los cuales, en lugar de usarlos de argumentos, copiamos y pegamos dichas funciones completas dentro de `fit_stepwise()`.

---

<!-- Desarrollo del problema -->
Debido al interés de publicar dicho repositorio, fue el cambio de nombres de español
a inglés, lo cual no esperaramos que causara problemas porque un buen código no debe de ser sensible 
a cambios de nombre, pero encontramos que este código si lo era. 

Al cambiar los nombres, se modificaron archivos de datos, y como funcionaban con el código, lo que nos dio una guía de que deberiamos hacer fueron las pruebas. 

Las pruebas son la guía numero uno para la solución de errores, causados por el cambio
de nombres, tuvimos que hacer varias modificaciones sobre como el código leia archivos `.csv`. 

Igualmente debido a esto se encontraron problemas _invisibles_ para nosotros (objetos sin pruebas). 

Esto fue de mucha utilidad debido a que nos dio una oportunidad de crear nuevas pruebas y asegurar el código de cualquier
otra instancia como estas.


---

<!-- Conclusión -->
Después del cambio de nombres, así como las pruebas comenzó la refactorización completa de la fución `get_best_json_for_logistic_model()` de arriba 
hacia abajo. 

En su gran mayoría fueron instrucciones sencillas las cuales fueron separables, aquí el 
reto se centró en ¿Cómo hago la mejor prueba? donde primero se discutió ¿Qué hace la función? ¿Qué se espera que devuelva? ¿Usa variables que utilizamos mas adelante?.

Estas preguntas fueron una guía para hacer las pruebas, así como pensar en objetos que no cambien
independientemente de la situación en la que se encuentre el código, la prueba va a pasar. 

---