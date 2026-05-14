---
layout: post
title: Control estadístico de procesos
author: Evaristo, Nepo
tags: matemáticas
---

# 👩🏿‍🏫 Qué es el control estadístico de procesos

El control estadístico de procesos (SPC, por sus siglas en inglés) es una técnica estadística usada en el control de calidad.
Decimos que un proceso está bajo control estadístico si las variables que lo describen están dentro de los límites de la variabilidad característica del proceso.
Cuando un proceso no está en control decimos que está fuera de control (OOC, por sus siglas en inglés).
Una manera para determinar si un proceso está en control es mediante una carta de control.

# 📈 Carta de control

Construimos la carta de control a partir de una medida de tendencia central y una medida de dispersión de los datos.
Por ejemplo, la carta de control de Shewhart utiliza el promedio y la desviación estándar.

# 📋 Criterios para identificar que estamos fuera de control

Un proceso está OOC cuando un punto en su carta de control se encuentra a 3 desviaciones estándares de la media.
A este criterio le llamamos 3𝜎.
Si la [distribución muestral](https://es.wikipedia.org/wiki/Distribuci%C3%B3n_muestral) de la media es normal, el criterio 3𝜎 tiene una probabilidad 𝛼 de una falsa alarma de 0.0027.

Otros criterios alternativos para definir un proceso OOC son:

- 2 puntos consecutivos a 2 desviaciones estándares de la media.
- 4 puntos consecutivos a 1 desviaciones estándares de la media.
- 6 puntos consecutivos son crecientes o decrecientes.
- 8 puntos consecutivos por arriba de la media.
- 8 puntos consecutivos por abajo de la media.

# 🙈 Ejemplo

El SPC nos dijo que nuestra productividad (tareas terminadas semanalmente) estaba fuera de control desde finales de octubre de 2020.
En ese momento, buscamos la _causa asignable_ de esta variabilidad y actuamos en consecuencia para modificar nuestra producción y para que estuviera bajo control estadístico.
