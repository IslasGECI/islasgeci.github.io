---
layout: post
title: TDD es opcional; mutation testing es obligatorio
author: Nepo, Evaristo
tags: programacion
---

En nuestro equipo, requerimos que el código sea resistente a mutaciones. La resistencia a mutaciones
es una medida de la calidad de las pruebas. Las mutaciones son modificaciones al código de
producción y mimetizan los errores típicos en la programación. Su objetivo es identificar
debilidades en las pruebas.

Puedes usar _Test-driven development_ (TDD) para lograr lo anterior (o puedes usar otra disciplina).
TDD es una técnica en la que primero escribimos las pruebas y después el código de producción. En
nuestro equipo practicamos la versión del tío Bob, resumida en tres reglas:

- No puedes escribir código de producción a menos que esté una prueba fallando
- Solo puedes escribir lo necesario para hacer fallar una prueba
- Solo estás permitido a escribir el código suficiente para hacer pasar la prueba fallando

El porcentaje de cobertura de las pruebas no tiene significado si las pruebas no las generamos
mediante TDD. El porcentaje de cobertura es una medida de la proporción del código de producción que
ejecutamos al correr las pruebas. Al seguir las reglas del TDD, tenemos la seguridad de que las
pruebas documentarán el comportamiento deseado del código de producción.

El propósito de que hagamos código que sea resistente a mutaciones es que podamos refactorizar
continuamente sin miedo. Tener pruebas de calidad nos permite hacer los cambios necesarios para que
el código de producción sea claro y legible. Después de cada cambio corremos las pruebas y si pasan
seguimos refactorizando. Si alguna prueba falla, regresamos el cambio y revisamos qué salió mal.
Solo cuando confiamos en el _feedback_ de nuestras pruebas, es cuando seguimos limpiando nuestro
código de producción.

El código libre de mutaciones es el único que podemos mejorar continuamente sin miedo a romper su
funcionalidad.
