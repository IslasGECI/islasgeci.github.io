---
layout: post
title: ¿Qué debemos automatizar?
author: Evaristo
tags: dataops
---

Todo.

La automatización es evidencia de reproducibilidad y la reproducibilidad es un prerrequisito de la
colaboración. Ya que deseamos ser capacas de colaborar en cada paso de nuestro flujo de trabajo,
debemos automatizar cada paso de nuestro flujo de trabajo.

En la curación de datos, debemos automatizar _mutation testing_ de los datos para evaluar los
_constrains_ de los _data packages_. Tenemos que eliminar la parte manual requerida después de
ejecutar `geci-tdp2xls`. Debemos automatizar el respaldo y restauración de las bases de datos.

Debemos echar a andar el Inspector de reproducibilidad y agregar columnas en el Tablero de
reproducibilidad. Además de la reproducibilidad "estricta" (reconstrucción de imagen y reproducción
de resultados) que muestra ahorita, también debemos mostrar la reproducibilidad "permisiva"
(reproducción de resultados sin reconstrucción de imagen) como lo hacíamos en Bitbucket Pipelines;
esto para las versiones _latest_ y _stable_ de las imágenes clase 3. Tambien debemos mostrar la
reproducción de cada reporte con la imagen indicada en el campo `docker_image` en `analyses.json`,
así cada reporte puede usar una imagen distinta.

Debemos automatizar la ejecución de aplicaciones web en nuestro servidor islasgeci.org cuando
hagamos _merge_ hacia la _develop_ y en islas.org.mx cuando hagamos _merge_ hacia la _master_. Debe
ser trivial ejecutar una aplicación en el _local host_ durante la revisión. Durante la revisión, se
deben evaluar las pruebas mediante _mutation testing_ automáticamente.

Debemos tener un puño de _cron jobs_ que verifiquen que los procesos automatizados se están
comportando como esperamos. 

Debemos automatizar la simulación aleatoria de catástrofes para verificar constantemente que el
sistema se restaura a sí mismo.

La automatización absoluta, junto con la reducción permanente e implacable de nuestra deuda técnica,
nos permitirá mantener nuestra productividad constante de manera indefinida.

## Referencias

- [Prince Ali](https://www.youtube.com/watch?v=eGLSPyGszjo)
