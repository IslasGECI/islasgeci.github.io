---
layout: post
title: "Desacoplamiento de análisis y visualización"
author: Evaristo
tags: programación visualización
---

En nuestro canal de integración, separamos explícitamente el cálculo de resultados del graficado.
Seguimos un flujo de trabajo que consta de los siguientes pasos:

1. Lectura y procesamiento de datos.
1. Cálculo de resultados en memoria.
1. Escritura de resultados en disco.
1. Lectura de resultados desde disco.
1. Generación de visualizaciones.
1. Escritura de gráficas en disco.

Así, definimos dos fases independientes: (1–3) cálculo del resultado y (4–6) visualización del resultado, en lugar de acoplar ambas etapas en un solo paso.

Como recomendación general, procuramos no graficar en el mismo lenguaje en el que calculamos los resultados.
Cuando es posible, graficamos en gnuplot.
Esto refuerza la separación de responsabilidades y reduce dependencias implícitas entre etapas.

En Make, esta separación puede reflejarse en la nomenclatura de funciones:

- `create_*`: generan resultados y los escriben en disco.
- `render_*`: leen resultados existentes (no los generan), producen la visualización y la guardan en disco.

Las funciones `render_*` no realizan cómputo desde cero; operan exclusivamente sobre resultados previamente generados.
Esta distinción hace que los pasos del canal de integración sean más explícitos, facilita su mantenimiento y permite reutilizar resultados intermedios sin recalcularlos.

Este diseño evita que la visualización dependa directamente del cómputo.
Con ello, mejoramos el desacoplamiento, facilitamos la reutilización de resultados y hacemos más claro el origen de cada resultado y los pasos seguidos para generarlo.
