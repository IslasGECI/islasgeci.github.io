---
layout: post
title: ¿Qué debemos automatizar?
author: Evaristo
tags: dataops
---

La automatización es evidencia de reproducibilidad y la reproducibilidad es un prerrequisito de la
colaboración. Ya que deseamos ser capacas de colaborar en cada paso de nuestro flujo de trabajo,
debemos automatizar cada paso de nuestro flujo de trabajo.

Debemos automatizar:

- _mutation testing_ de los datos para evaluar los _constrains_ de los _data packages_
- la parte manual requerida después de ejecutar `geci-tdp2xls`
- el respaldo y restauración de las bases de datos
- la ejecución de aplicaciones web en nuestro servidor islasgeci.org cuando hagamos _merge_ hacia la
  _develop_ y en islas.org.mx cuando hagamos _merge_ hacia la _master_
- la evaluación de las pruebas mediante _mutation testing_ automáticamente en los _pull request_
- la verificación de que los procesos automatizados se están comportando como esperamos y la
  notificación en caso contrario
- la simulación aleatoria de catástrofes para verificar constantemente que el sistema se restaura a
  sí mismo

La automatización absoluta, junto con la reducción permanente e implacable de nuestra deuda técnica,
nos permitirá mantener nuestra productividad constante de manera indefinida.
