---
layout: post
title: "Blameless Postmortem: Evaluación de desempeño"
author: Memo, Nepo y Mario
tags: equipo aprendizaje
---

## Resumen del incidente
Al dibujar las cartas de control con datos de mayo del 2022 a marzo del 2024, notamos que nuestro desempeño está fuera de control.

Este evento fuera de control comenzó el día 13 de octubre de 2023 y termina el 01 de marzo de 2024.
La duración fue de 140 días, el tiempo medio de recuperación es 70 días. Hubo alertas en todas las cartas, estuvimos por debajo del promedio.
(por qué?)
- Cambios en la especificación de tareas
- 


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
- En el **promedio de lambda**, tuvimos **8 puntos por debajo del promedio** el 30 de octubre de 2023.
- En el **promedio de W**, la alerta comienza el 13 de octubre y termina el 01 de marzo de 2023. El criterio de la alerta fue de **1 punto por arriba de tres sigmas**. Hay una **segunda alerta** el 2 de febrero de 2024 con **8 puntos por debajo del promedio**.
- En el **rango de lambda** la alerta ocurrió el 22 de diciembre de 2023. El criterio de la alerta fue **8 puntos por debajo del promedio**.
- En el **rango de W**, el 9 de febrero de 2024 hay una alerta de **8 puntos por debajo del promedio**.

## Respuesta
- Pusimos atención en la longitud de las tareas.
- Planeamos las tareas que deben salir en la semana con base en las cartas de control.

Hubo una barrera o retraso para regresar a control en este tiempo.
Desde diciembre sabemos que estamos fuera de control y tardamos 10 semanas en recuperar el control.
Cuando creamos las cartas de control ya llevábamos dos meses fuera de control.
Esta detección tardía provocó que fuera difícil identificar la causa asignable.

## Otras ideas para explorar
- Tal vez la especificación del viernes no la hicimos bien.
En esta junta debimos de especificar el tamaño de las tareas.

## Recuperación
Regresamos a control el primero de marzo de 2024.
A partir del 26 de enero de 2024 intentamos definir tarjetas más cortas y planeamos el número de tarjetas que podrían salir en la semana.
Con las cartas de control actualizadas sabíamos cuantas tarjetas debíamos terminar por semana para volver a control.
Una vez que teníamos el número necesario, revisamos cuáles eran las tareas más fáciles de terminar y en esas trabajamos.

### ¿Cómo reducir el tiempo de recuperación?
- Si las cartas las generamos automáticamente las podríamos revisar con la misma periodicidad con la que actualizamos los datos.
- Podemos agregar al corte la revisión de las cartas de control.

## Línea de tiempo
- [18-09-2023] Regreso a oficinas
- [18-09-2023 al 29-09-2023] Experimentos con microservicios
- [18-09-2023] NR trabajó en casa jueves y viernes para evitar contagios en oficina
- [09-10-2023] Levantamos servidor en Azure y día económico Memo
- [23-10-2023] Levantamos el provisionador en Azure
- [17-11-2023] Reunión con Ale Fabila y taller Looker Studio

## Cinco "por qué"s
1. ¿Por qué estamos fuera de control?
    - Las cuatro cartas de control tienen al menos una alerta en el periodo del 13 de octubre de 2023 al 01 de marzo del 2024.
1. ¿Por qué se activaron las alertas?
    - Porque comenzamos a tener un número menor de tarjetas terminadas.
1. ¿Por qué disminuyó el número de tarjetas terminadas?
1. ¿Por qué estas razones contribuye a que haya aumentado la $\lambda$?
    - En el Kanban ya no contamos el trabajo en el mantenimiento de nuestras herramientas ni del trabajo administrativo.
    - La proporción de tareas clase 1 en este equipo es 17\% en el "equipo anterior" teníamos 25\%. Las tareas clase 3 de los últimos dos años es 31\% antes teníamos 13\%. Sospechamos que estamos incluyendo trabajo clase 1 en las tarjetas clase 3.
    - En las 4 semanas previas a la primera alerta:
        - Experimentamos con microservicios. 
        Durante tres semanas invertimos tiempo en implementar el microservicio que genera la gráfica de semáforo.
        En esas tres semanas solamente tuvimos una estrella en terminado, con cuatro tarjetas terminadas.
        - Cambiamos el servidor de desarrollo y el provisionador a Azure.
        Al menos tres días de trabajo los invertimos en la migración a Azure.
1. ¿Por qué quitamos el trabajo administrativo del Kanban, experimentamos con microservicios, nos cambiamos a Azure?
    - Decidimos que el tablero se reflejara el trabajo relacionado a una isla y especie en particular.
    Aprovechamos que tenemos que ir a oficina para realizar el trabajo administrativo.
    Aun no queda claro cuáles tarjetas administrativas deben entrar al Kanban.
    - Experimentamos con microservicios porque:
    Teníamos problemas de dependencias entre paquetes de Python de dos módulos.
    Usamos esta técnica para evitar problemas de compatibilidad en la imagen del repositorio clase 3.
    - Migramos a Azure porque se nos terminó la donación de DigitalOcean.
## Causa raíz
- De las tres razones que encontramos en la sección anterior, al menos dos son cosas puntuales.
  Si fueran la causa raíz nos hubieramos recuperado más rápido.
- El cambio en la definición de las tarjetas del Kanban es un comportamiento que se mantuvo hasta de manera regular.

## Lecciones aprendidas y cosas ganadas
- En las semanas que no tenemos tareas terminadas, definimos la W como 3 sigmas.
Así evitamos la división por cero.
- Las Notas del Kanban nos sirven para detectar eventos atípicos y encontrar las causas.
- Aun no queda claro cuáles tarjetas administrativas deben entrar al Kanban.
- Es más difícil encontrar una causa asignable
- ¿Cómo afecto no haber tenido inspector de reproducibilidad?

## Acciones correctivas
- Viernes creativos disminuyeron.
- Agregar al corte la revisión de las cartas de control.
- Contamos el trabajo administrativo de la semana del 26 de febrero al 1 de marzo.
