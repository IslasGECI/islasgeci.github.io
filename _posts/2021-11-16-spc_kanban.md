---
layout: post
title: 📉 Control estadístico de procesos
author: Equipo
tags: mate
---

# 👩🏿‍🏫 Qué es el control estadístico de procesos

El control estadístico de procesos (SPC, por sus siglas en inglés) es una técnica estadística usada
en el control de calidad.  Decimos que un proceso se encuentra en control estadístico si las
variables que usamos para describir el proceso se encuentra dentro de los límites de la variabilidad
característica del proceso. Cuando un proceso no está en control decimos que está fuera de control
(OOC, por sus siglas en inglés). Una manera para determinar si un proceso está en control es
mediante una carta de control.

# 📈 Carta de control

La carta de control la construimos a partir de una medida de tendencia central y una medida de
dispersión de los datos. Por ejemplo, la carta de control de Shewhart la construimos con el promedio
y la desviación estándar.

# 📋 Criterios para identificar que estamos fuera de control

Consideramos que un proceso se encuentra OOC cuando un punto en su carta de control se encuentra a 3
desviaciones estándares (por arriba o por abajo) de la media. A este criterio le llamamos 3𝜎. Si la
[distribución muestral](https://es.wikipedia.org/wiki/Distribuci%C3%B3n_muestral) de la media es
normal, el criterio 3𝜎 tiene una probabilidad 𝛼 de una falsa alarma de 0.0027.

Otros criterios alternativos para definir un proceso OOC son:

- 2 puntos consecutivos a 2 desviaciones estándares de la media.
- 4 puntos consecutivos a 1 desviaciones estándares de la media.
- 6 puntos consecutivos son crecientes o decrecientes.
- 8 puntos consecutivos por arriba de la media.
- 8 puntos consecutivos por abajo de la media.

# 🙈 Ejemplo

El SPC nos dice que nuestra productividad (tarea terminadas semanalmente) se encuentra fuera de
control desde finales de octubre de 2020. Debemos buscar la _causa asignable_ de esta variabilidad y
actuar en consecuencia para que nuestra producción se encuentre nuevamente bajo control estadístico.