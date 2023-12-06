---
layout: post
title: "Blameless Postmortem: Evaluación de desempeño"
author: Memo, Nepo y Mario
tags: equipo aprendizaje
---

## Resumen del incidente
Al dibujar las cartas de control con datos de octubre del 2022 a diciembre del 2023, notamos que nuestro desempeño está fuera de control.
Encontramos al menos una alerta en cada carta de control en el periodo de septiembre a diciembre del 2023.

## ¿Qué nos condujo al evento?
- Dividimos el equipo para hacer trabajo administrativo durante la semana.
- Ahora intentamos que no entren tarjetas relacionadas con trabajo administrativo.
- Se nos acabaron los créditos de DigitalOcean y tuvimos que mudar el servidor de desarrollo.
- Implementamos nuestra primera versión de un microservicio.

## Falla
![cartas de control](/assets/images/control_charts.png)

## Impacto
- Menos tarjetas completadas.
- Menos resultados reportables.
- Retraso en completar las tarjetas.
- Retraso en entregar reportes de curación de datos, lo cual disminuye su valor.

## Detección
Teníamos agendada la evaluación del desempeño del equipo y decidimos hacer las cartas de control.
Hicimos 4 cartas de control: el promedio de lambda, el promedio de W, el rango de la lambda y el rango de W.
- En el promedio de W, la alerta ocurre el 13 de octubre.
El criterio de la alerta fue 4 puntos por arriba de una sigma.
El 7 de noviembre ocurre una alerta de 8 puntos por arriba del promedio.
- En el rango de lambda la alerta ocurrió el 23 de octubre.
El criterio de la alerta fue 4 puntos por arriba de una sigma.
- En el rango de W, el 23 de octubre hay una alerta de 2 puntos por arriba de dos sigmas.
El 7 de noviembre hay dos alertas de 8 puntos arriba del promedio y 4 puntos arriba de una sigma.
- En el promedio de lambda, tuvimos 8 puntos por debajo del promedio el 7 de noviembre de 2023.
Hay dos alertas que siguen activas: el rango de W sigue por arriba del promedio y el promedio de lambda sigue por abajo del promedio.

## Respuesta
La respuesta todavía no llega.
Una barrera para generar una respuesta es que los límites de control y las cartas de control las generamos manualmente.

## Recuperación

### ¿Cómo reducir el tiempo de recuperación?
- Si las cartas las generamos automáticamente las podríamos revisar con la misma periodicidad con la que actualizamos los datos.
- Podemos agregar al corte la revisión de las cartas de control.

## Línea de tiempo
- [01-09-203] Empieza el horario de trabajo administrativo en lunes y miércoles; viernes creativo
- [11-09-2023] Tomamos curso "Efficiently Testing ETL Pipelines: Enhancing data quality with PySpark and Python"
- [18-09-2023] Regreso a oficinas
- [18-09-2023 al 29-09-2023] Experimentos con microservicios
- [18-09-2023] NR trabajó en casa jueves y viernes para evitar contagios en oficina
- [09-10-2023] Levantamos servidor en Azure y día económico Memo
- [23-10-2023] Levantamos el provisionador en Azure
- [30-10-2023 al 07-11-203] Presentación de IRIS
- [07-11-203 al 21-11-2023] Vacaciones Mario
- [17-11-2023] Reunión con Ale Fabila y taller Looker Studio
- [24-11-2023] Semana de 4 días

## Cinco "por qué"s
1. ¿Por qué estamos fuera de control?
    - Las cuatro cartas de control tienen al menos una alerta en el periodo de septiembre de 2023 al 4 de diciembre del 2023.
1. ¿Por qué se activaron las alertas?
    - Porque redujimos el tiempo de trabajo en las tarjetas del Kanban
1. ¿Por qué redujimos el tiempo de trabajo en las tarjetas del Kanban?
    - Porque empezamos a asignar un horario al trabajo administrativo, a los viernes creativos, experimentamos con microservicios y cambiamos el alojamiento del servidor de desarrollo a Azure.
1. ¿Por qué estas razones contribuye a que haya aumentado la W?
    - Horario administrativo:
      - Los lunes y miércoles hay un equipo que trabaja en tarjetas del Kanban. Ahora estamos atendiendo trabajo administrativo y antes no.
      - En el Kanban ya no contamos el trabajo administrativo.
    - Viernes creativo:
      - Los días viernes intentamos trabajar en cosas que no están en el Kanban, medio día menos.
    - Experimentos con microservicios:
      - Durante tres semanas invertimos tiempo en implementar el microservicio que genera la gráfica de semáforo. En esas tres semanas solamente tuvimos una estrella en terminado, con cuatro tarjetas terminadas.
    - Cambiamos el servidor de desarrollo a Azure:
      - Al menos dos días de trabajo los invertimos en esto.
1. ¿Por qué implementamos el horario administrativo, viernes creativo y el microservicio?
    - Horario administrativo:
        - Regreso a oficina
        - Organizar los tiempos para trabajar en temas administrativos
    - Viernes creativo:
        - Apartar tiempo para investigar/experimentar con software y patrones de diseño que nos podrían ser de utilidad.
    - Microservicio:
        - Teníamos problemas de dependencias entre paquetes de Python de dos módulos. Usamos esta técnica para evitar problemas de compatibilidad en la imagen del repositorio clase 3.

## Causa raíz
Todavía no estamos en control y las causas que generaron las primeras alertas y siguen activas son:
- Horario administrativo
- Viernes creativo

## Lecciones aprendidas y cosas ganadas
- En las semanas que no tenemos tareas terminadas, definimos la W como 3 sigmas. Así evitamos al división por cero. 
- Las Notas del Kanban nos sirven para detectar eventos atípicos y encontrar las causas.

## Acciones correctivas
- Agregar al corte la revisión de las cartas de control.
- Contabilidad del trabajo administrativo: mantener estas acciones hasta el viernes 19 de enero.