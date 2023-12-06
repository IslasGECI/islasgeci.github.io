---
usemathjax: true
layout: post
title: "Predicción del número de individuos remanentes"
author: Nepo
tags: eco mate
---



La figura de abajo muestra la predicción del número de individuos remanentes en Isla Socorro.
El eje del tiempo va desde julio de 2022 hasta diciembre de 2025.
El eje vertical va de 0 a 100 individuos remanentes.
Podemos observar que el mínimo del número de individuos de toda la serie de tiempo está en en julio de 2023.
Hasta julio de 2023 tenemos las estimaciones históricas.
De julio de 2023 en adelante son las predicciones a partir de las capturas de los último meses.

![erradicación de gato feral en isla socorro](/assets/images/erradicacion-gato-feral-isla-socorro.png)

Abajo describimos el modelo que utilizamos para hacer las predicciones.
\[ N_{t+1} = N_t + rN_t  - R_t \]
El número de individuos está en el lado izquierdo del igual.
El lado derecho de la igualdad está formado por tres términos.
$N_t$ es el número actual de individuos.
El producto $rN_t$ representa los nacimientos que tendremos en el mes.
$R_t$ son las capturas del mes.

Los nacimientos los obtenemos al multiplicar la tasa de crecimiento mensual ($r$) por el número actual de individuos ($N_t$).
La tasa de crecimiento mensual la calculamos a partir de los datos de nuestros proyectos de erradicación.
Confirmamos la tasa de crecimiento mensual con datos bibliográficos.

Actualmente, predecimos las capturas a partir de los datos de capturas recientes, sin utilizar un modelo.
Antes, las capturas futuras las obteníamos a partir de un modelo de esfuerzos.
El modelo consumía los esfuerzos históricos para predecir las capturas.
Ya no utilizamos los esfuerzos; solo utilizamos los datos de capturas.

Entre marzo y agosto de 2023 retiramos 18 individuos de Isla Socorro.
En ese mismo periodo nacieron 16 individuos.
Pasamos de 40 individuos en marzo a 38 en agosto.
Con el modelo explicado arriba predecimos que en los próximos 6 meses nacerán 20 individuos.
Los datos más recientes nos indican que retiraremos 7 individuos en el mismo periodo.
Para marzo de 2024, tendremos 51 individuos remanentes.
Lo anterior representa un incremento del 35%.
