---
usemathjax: true
layout: post
title: "Predicción del número de individuos remanentes"
author: Nepo
tags: ecologia mate
---

La figura de abajo muestra la predicción del número de individuos remanentes en Isla Socorro.
El eje del tiempo va desde julio de 2022 hasta diciembre de 2025.
El eje vertical va de 0 a 100 individuos remanentes.
Podemos observar que el mínimo del número de individuos de toda la serie de tiempo está en en julio de 2023.
Hasta julio de 2023 tenemos las estimaciones históricas.
De julio de 2023 en adelante son las predicciones a partir de las capturas de los último meses.

Abajo describimos el modelo que utilizamos para hacer las predicciones.
\[ N_{t+1} = N_t + rN_t \left(1 - \frac{N_t}{K} \right) - R_t \]
El número de individuos está en el lado izquierdo del igual.
El lado derecho de la igualdad está formado por tres términos.
$N_t$ es el número actual de individuos.
El producto rNt representa los nacimientos que tendremos en el mes.
Rt son las capturas del mes.
