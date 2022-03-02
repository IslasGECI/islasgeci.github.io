---
layout: page
title: Nomenclatura
tagline: Guía de estilo
description: Cómo nombramos las cosas
---

## General

- Los nombres son en inglés

## Archivos de datos

Consulta nuestro protocolo para [nombrar un archivo de
datos](../protocolo_basico/nomenclatura.html).

## Archivos de código (_scripts_)

- El nombre empieza con un verbo
- Puede incluir únicamente números y letras (excepto eñe y vocales con acento)

El nombre de un programa que genera resultados debe coincidir con el nombre de la variable en el
`Makefile` que define el conjunto de resultados que el programa genera (excepto tal vez por algunas
omisiones para evitar redundancias). Por ejemplo, el programa que genera los resultados definidos
por la variable `png_density_maps_albatross_guadalupe` se debe llamar
`plot_density_maps_albatross_guadalupe`; en este ejemplo se omite el formato `PNG` del nombre porque
el mismo programa también genera los resultados en formato `SHP` definidos por la variable
`shp_density_maps_albatross_guadalupe`.

## Funciones y métodos

- El nombre debe estar compuesto por un verbo seguido de un objeto. Ejemplos: `process_data()`,
  `pet_dog()`. Si la función realiza tantas tareas que no sabes cual verbo escoger entonces tu
  función es incorrecta; cada función debe realizar una única acción y la debe hacer bien.
- Si la función cambia el formato del argumento de entrada, usamos la notación `input2output`.
  Ejemplos: `jpg2bmp()`, `txt2pdf()`, `lbs2kg()`
- En algunos casos es aceptable nombrar a una función con un sustantivo que describe una operación,
  por ejemplo: `mean()`, `square()`
- Si la función devuelve valores lógicos, usamos el prefijo `is`. Ejemplo: `is_dog()`

## Pruebas

Los nombres de los archivos que contienen pruebas deben seguir las reglas de nomenclatura del
_testing framework_ que se use. Si el _testing framework_ lo permite, se seguirán las siguiente
reglas:

- El nombre empieza con el prefijo `test_`, por ejemplo, `test_plot_island`
- Puede incluir únicamente números y letras (excepto eñe y vocales con acento)

## Makefile

### Variables dentro del Makefile

Los nombres de las variables que dentro del `Makefile` definen un conjunto de archivos están formado
por cinco elementos.

Las variables que definen conjuntos de archivos de **datos** se nombran como:

- formato
- variable(s)
- tipo de monitoreo (o simplemente la palabra `data`)
- especie (o grupo)
- región geográfica

Ejemplos: `xlsx_nests_census_albatross_guadalupe`, `xlsx_burrows_sampling_guadalupe_murrelet`

Las variables que definen conjuntos de archivos de **resultados** se nombran como:

- formato
- variable(s)
- tipo de resultado
- especie (o grupo)
- región geográfica

Ejemplo: `png_density_maps_albatross_guadalupe`.

En ambos casos se pueden omitir las palabras reduntantes que se incluyan en el nombre del
repositorio

### Objetivos _phonies_

Los nombres de los objetivos _phonies_ son sustantivos o adjetivos. Si el sustantivo se omite, se
entiende que el adjetivo se refiere al repositorio.

## Otros archivos y directorios

- Preferimos [_snake_case_](https://en.wikipedia.org/wiki/Snake_case)
- Puede incluir únicamente números y letras (excepto eñe y vocales con acento)
- Si el nombre del archivo incluye una fecha, usa el formato `YYYY-MM-DD` (año-mes-día) o `YYYYMMDD`
  (añomesdía); si es posible, inicia el nombre con la fecha.

## Variables

- Deben ser nombres descriptivos y sin abreviaturas (ver excepciones abajo).
- Si la variable representa el número total de elementos de un conjunto usamos el prefijo `n`.
  Ejemplos: `n_files`, `n_dogs`
- Si la variable se usa para iterar usamos el prefijo `i`. Ejemplo: `for i_dog = 1:n_dogs, ... ,
  end`
- Para variables lógicas usamos el prefijo `is`. Ejemplos: `is_dog`, `is_cat`
- Si la variable es el índice de un arreglo usamos el prefijo `ind`. Ejemplo: `ind_dog =
  find(is_dog)`
- Indicamos la unidades de las variables con un sufijo separado del nombre de la variable por un
  guión bajo. Ejemplos: `distance_m`, `weight_kg`, `time_s`
- Las únicas abreviaturas aceptadas son:
    - `sst`: Temperatura Superficial del Mar
    - `eez`: Zona Económica Exclusiva
    - `x`: Vector de coordenadas UTM zonales de un conjunto de puntos (e.g. vértices de un
      polígono).
    - `y`: Vector de coordenadas UTM meridionales de un conjunto de puntos (e.g. vértices de un
      polígono).
    - `x_axis`: Vector de coordenadas UTM zonales (usualmete equiespaciadas) que definen el dominio
      o eje.
    - `y_axis`: Vector de coordenadas UTM meridionales (usualmete equiespaciadas) que definen el
      dominio o eje.
    - `X`: Malla de coordenadas UTM zonales.
    - `Y`: Malla de coordenadas UTM meridionales.
    - `lon`: Vector de coordenadas geográficas zonales de un conjunto de puntos (e.g. vértices de un
      polígono).
    - `lat`: Vector de coordenadas geográficas meridionales de un conjunto de puntos (e.g. vértices
      de un polígono).
    - `lon_axis`: Vector de coordenadas geográficas zonales (usualmete equiespaciadas) que definen
      el dominio o eje.
    - `lat_axis`: Vector de coordenadas geográficas meridionales (usualmete equiespaciadas) que
      definen el dominio o eje.
    - `LON`: Malla de coordenadas geográficas zonales.
    - `LAT`: Malla de coordenadas geográficas meridionales.
