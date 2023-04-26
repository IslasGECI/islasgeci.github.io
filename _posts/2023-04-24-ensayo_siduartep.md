---
layout: post
title: "Ensayo primeros pasos Ciencia de datos"
author: Simon
tags: ensayo
---

## Reproducibilidad

La reproducibilidad en ciencia de datos es un tema crucial en la actualidad para validar la calidad de nuestros resultados.
Cuando hablamos de reproducibilidad de resultados, nos referimos a la habilidad de repetir y obtener los mismos resultados utilizando los mismos datos y métodos de un estudio anterior.
Esta capacidad es fundamental para verificar la exactitud de los hallazgos y confirmar que los resultados no son producto de errores o sesgos.
Si no se pueden replicar los resultados, es imposible saber si son válidos o si se deben a errores en la recolección o análisis de los datos.
Por otro lado, la reproducibilidad también nos permite comparar entre diversos experimentos y detectar posibles errores en los métodos de investigación.
Para alcanzar estos resultados es necesario una sintonía entre las versiones de los datos, el entorno y el código. Dentro de las posibles herramientas para lograrlo se destaca Docker, el cual es un software que dentro de sus funciones busca congelar las versiones de estos tres elementos para una ejecución adecuada, conduciendo a la reproducibilidad.

## Unit testing

En nuestra práctica dentro del equipo de ciencia de datos, utilizamos la técnica de unit testing para asegurarnos de que cada componente individual de nuestro sistema funcione adecuadamente.
En lugar de probar todo el modelo de aprendizaje-automático, nos enfocamos en probar cada componente individual del modelo como la limpieza, transformación de datos, selección de características y evaluación del modelo.
Al probar cada componente por separado, podemos corregir errores específicos antes de afectar todo el modelo.
El proceso consta de tres pasos: primero, definimos los requisitos que debe cumplir el código de producción, luego creamos las pruebas y finalmente comprobamos si los resultados son correctos o incorrectos.
La aplicación de esta técnica en ciencia de datos puede mejorar la calidad y reproducibilidad de nuestros modelos, así como aumentar nuestra confianza en los resultados del análisis de datos.
Además, al tener la seguridad de que cada componente individual funcione adecuadamente, podemos identificar errores específicos en el modelo y corregirlos antes de implementarlo en un entorno de producción.

## Test Driven Development

Es una técnica de desarrollo de software que se ha popularizado en los últimos años por su eficacia y cambio en la arquitectura que presenta.
En nuestra práctica, escribimos las pruebas antes de escribir el código, lo que asegura que el análisis se ha diseñado para cumplir con los requisitos establecidos por el usuario.
Hemos encontrado que esta técnica es efectiva en la prevención de errores y en la creación de análisis más robustos y mantenibles.
Además, existe una variante de TDD llamada Ping Pong Programming, en la cual dos programadores trabajan juntos en el mismo proyecto, alternándose para escribir las pruebas y el código.
Esta técnica promueve la colaboración y comunicación constante entre los miembros del equipo, lo que puede llevar a un mejor diseño del análisis.
En nuestro caso, las pruebas son diseñadas para verificar la calidad de los datos, la efectividad del modelo y la precisión de los resultados, lo que lleva a modelos más sólidos y confiables.
La colaboración entre los miembros del equipo en Ping Pong Programming también ha promovido una mejor comprensión del modelo y los datos subyacentes.
La aplicación en conjunto de TDD y Ping Pong Programming en nuestro equipo ha llevado a una mayor calidad y mantenibilidad de nuestros análisis.
Además, estas técnicas han promovido una mejor comunicación y colaboración entre los miembros del equipo.
Sin embargo, hay que tener en cuenta que estas técnicas pueden requerir más tiempo y esfuerzo al principio del proceso de desarrollo.

## Continuos delivery

Hace referencia a una serie de prácticas utilizadas en el desarrollo de software para asegurar que nuestros análisis sean entregados rápidamente y con alta calidad.
Este enfoque implica la ejecución de una serie de prácticas que abarcan desde el desarrollo, entrega, feedback y gestión de calidad de manera simultánea y constante.
Con ello, logramos ser más eficientes y satisfacer las necesidades de manera más rápida.
El pipeline de Continuous Delivery comienza con la integración continua (CI) de los cambios realizados en el modelo y sus datos correspondientes.
Posteriormente, se realiza una fase de pruebas automatizadas para evaluar la calidad del modelo, asegurándonos de que cumpla con los criterios definidos.
Si el modelo pasa estas pruebas, se implementa automáticamente en producción para que los usuarios finales puedan utilizarlo.
Gracias a la implementación de Continuous Delivery se ha mejorado la calidad de nuestros análisis y hemos acelerado el proceso de entrega de resultados.
La retroalimentación constante que obtenemos a través de las pruebas automatizadas nos permite corregir cualquier problema rápidamente manteniendo nuestros modelos actualizados y eficientes.