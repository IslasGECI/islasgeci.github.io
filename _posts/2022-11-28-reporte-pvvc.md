La implementación de Test Driven Development en el área de ciencia de datos ha sido un reto. 
Mayor aún cuando se lleva a cabo en código de legado, éste siendo no apto para la métodología actual
de la organización, por lo que mi misión como practicante, fue la implementaicón de dicha metología
al [repositorio de Dimorfismo](https://github.com/IslasGECI/dimorfismo) en GitHub. Además, dicho código
muchas dependencias del código de producción en las pruebas, por lo que igualmente como misión secundaria
se me asignó la tarea de hacer que las pruebas no dependieran de este. Por ello se analizará lo realizado
durante mi instancia en la organización.

Dentro del repositorio, el enfoque realizado fue hacia 3 carpetas `src/`, `tests/` y `R/`. El problema
principal es que dentro de las pruebas, encontradas en la carpeta `tests/` no debe existir ninguna dependencia
a la carpeta `src/`. En las pruebas encontramos que tres, de estos archivos tienen dependencias hacia 
`src/` respectivamente su número de archivo. Esto hace el código mucho más lento a la hora de su ejecución
y no obedece las metodologías planteadas por el grupo, por lo que la primera instrucción que realizamos
fue la eliminación de dicha dependencia en las pruebas.

El primer archivo analizado fue `/tests/testthat/tests_01_create_parameter_logistic_model_LAAL.R` el 
cual realiza
```R
source("src/01_create_parameter_logistic_model_LAAL.R")
```
la cual es la dependencia con la carpeta `src/` mencionada con anterioridad. Para eliminar dicha
dependencia revisamos dicho archivo, con el que nos topamos no era una funcion, si no todo un _script_
el cual hacia llamar todas las veces cuando se queria verificar una prueba. Por ello comanzamos creando
una función en la carpeta `R/` que hiciera lo mismo (Copiar y pegar el código), con ello nos encontramos
con otro problema, era una función _muy grande_ por lo cual ya el objetivo no era solo eliminar la dependencia
de las pruebas, sino, igualmente _refactorizar_ la función y crear nuevas pruebas para las funciones
creadas en el proceso de refactorizar la función previa.

Las pruebas realizadas para las funciones que salieran de la refactorización se localizan en el archivo 
`/tests/testthat/tests_regretion_to_data_frame_coefficients_function.R` y las funciones en el archivo 
`/R/regretion_to_data_frame_coefficients_function.R`. Comenzamos entendiendo los procesos llevados acabo
en la función para posteriormente, separar dichos procesos en funciones diferentes, la refactorización no comenzó
con de arriba hacia abajo, sino con unas funciones llamadas `fit_null_model()` `fit_complete_model()` 
y `fit_stepwise` de las cuales las primeras dos no hubo problema en su separación, pero la que si tuvo
problemas fue la función `fit_stepwise()` debido a un problema causado por _lazy_ _evaulation_, esto
causado por los argumentos de entrada de la función. La función `fit_stepwise()` usaba como argumentos de entrada modelos, realizados por las funciones `fit_null_model()` y `fit_complete_model()` los cuales, en lugar de usarlos de argumentos, copiamos y pegamos dichas funciones completas dentro de `fit_stepwise()`.

Un paso intermedio, debido al interés de publicar dicho repositorio, fue el cambio de nombres de español
a inglés, lo cual no esperaramos que causara problemas porque un buen código no debe de ser sensible 
a cambios de nombre, pero encontramos que este código si lo era. Al cambiar los nombres, se modificaron
archivos de datos, y como funcionaban con los códigos lo que nos dio una guía de que deberiamos hacer
fueron las pruebas. Las pruebas la guía numero uno para la solución de errores, causados por el cambio
de nombres, tuvimos que hacer varias modificaciones sobre como el código leia archivos `.csv`. Igualmente
debido a esto se encontraron problemas _invisibles_ para nosotros (objetos sin pruebas). Esto fue de 
mucha utilidad debido a que nos dio una oportunidad de crear nuevas pruebas y asegurar el código de cualquier
otra instancia como estas.

Después de haber realizado la refactorización a dichas funciones y el cambio de nombres, así como sus 
pruebas comenzó la refactorización completa de la fución `get_best_json_for_logistic_model()` de arriba 
hacia abajo. En su gran mayoría fueron instrucciones sencillas las cuales fueron separables, aquí el 
reto se centró en ¿Cómo hago la mejor prueba? entonces relizamos discuciones en el equipo de trabajo
sobre ¿Qué hace la función? ¿Qué se espera que devuelva? ¿Usa variables que utilizamos mas adelante?.
Estas preguntas fueron una guía para hacer las pruebas, así como pensar en objetos que no cambien
independientemente de la situación en la que se encuentre el código, la prueba va a pasar. 
