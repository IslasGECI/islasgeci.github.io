---
layout: post
title: "Crisis de Reproducibilidad"
author: Evaristo
tags: dataops
---

Ya le dimos una vuelta a la tuerca. Ahora estamos haciendo nuestros pininos en visualizaciones web e interfaces de línea de comandos (CLI). Incluso ya hemos dado nuestros primeros pasos en programación orientada a objetos y arquitectura de software. Eventualmente empezaremos a implementar bases de datos relacionales y a desarrollar aplicaciones móviles. No me sorprendería que algún día avancemos el tema de aprendizaje automatizado mediante el _common task framework_. Pero hay que avanzar cuidando la retaguardia.

Reproducibilidad solía ser nuestro único principio; es el principio original. El resto de nuestros principios (puntualidad, transparencia, trabajo colaborativo y estandarización) se identificaron después, cuando ya teníamos la reproducibilidad bajo control.

Actualmente, nos encontramos inmersos en una crisis de reproducibilidad. Me resulta difícil realizar las revisiones post-entrega ya que no puedo reproducir los resultados que debo revisar. Supongo que debería revisar el producto entregado descargándolo desde el Trello, pero me rehúso.

Nuestro "tablero de aeropuerto" solía ser el instrumento que nos permitía a verificar la reproducibilidad de nuestros productos. Cuando dejamos de usar nuestro administrador de tareas _ad hoc_ y empezamos a usar el pizarrón kanban en su lugar, abandonamos el tablero de aeropuerto que se encontraba integrado en el mismo sistema.

Es momento de que retomemos nuestra iniciativa de lograr una [integración continua](https://en.wikipedia.org/wiki/Continuous_integration) de nuestros productos. Me gustaría usar algún servicio de integración continua como [Travis CI](https://travis-ci.org/), [CircleCI](https://circleci.com/) o [cualquier otro](https://code-maze.com/top-8-continuous-integration-tools/); pero tal vez algunas de nuestras dependencias (e.g. MATLAB) nos obliguen a redescubrir el hilo negro. :facepalm:

Identifico los siguientes elementos:

- El servidor que reproduzca el producto debe ser una de nuestras máquinas de escritorio (Windows, MATLAB, LaTeX, etc.)
- Los módulos de los lenguajes de programación instalados en el servidor deben ser actualizados de manera regular (y preferentemente automática) a la versión más reciente disponible
- Cada producto debe ser reproducido de manera periódica y automática mediante una tarea programada (equivalente a _cron_ de Linux) en lugar de ser iniciada por el `testMake`
- El éxito o fracaso de la reproducción debe ser mostrada de manera inmediata y automática en el tablero de aeropuerto
- La entrega (tanto externa como interna) de cualquier producto (reporte o gráfica pelona) tiene como requisito una reproducción automática exitosa
