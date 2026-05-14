---
layout: page
title: Cómo escribir comentarios en una revisión
tagline: Guía de estilo
description: Cómo logramos revisiones amables y efectivas
---

## Cómo escribimos comentarios en una revisión

Una revisión es una comunicación entre pares enfocada en mejorar un producto de nuestro trabajo. La
comunicación es un hilo de comentarios. Escribir un buen comentario es difícil. Esta guía ofrece
algunas sugerencias para escribir comentarios efectivos en una revisión.

### Resumen

- Seamos amables
- Expliquemos por qué
- Usemos lenguaje simple y claro
- Señalemos con precisión
- Expliquemos qué es lo que entendimos
- Proveamos alternativas de solución
- Proveamos referencias
- Solicitemos cambios, no explicaciones

---

## Seamos amables

Es importante ser amable, cortés y tratar con respeto a quien solicitó la revisión. Hagamos nuestros
comentarios sobre el **código** y nunca sobre la **persona**.

Mal ejemplo:

> "¿Por qué **usaste** técnicas bayesianas aquí?"

Buen ejemplo:

> "Las técnicas bayesianas aquí están agregando complejidad al análisis sin beneficios obvios. Dadas
> las características de la base de datos y del resultado esperado, _bootstrapping_ nos provee de la
> precisión requerida sin incrementar la complejidad del análisis. ¿Por favor podríamos calcular el
> intervalo de confianza mediante _bootstrapping_ (en lugar de usar técnicas bayesianas)?"

Solicitemos los cambios _por favor_ y redactemos nuestros comentarios como si estuviéramos
corrigiendo a una persona venerable. Recordemos seguir nuestro [Código de
conducta](https://islasgeci.github.io/2019/11/06/code-of-conduct).

## Expliquemos por qué

El **por qué** siempre es más importante que el _qué_. ¿Por qué estamos señalando esa línea? El
_Buen ejemplo_ de arriba ayuda a entender _por qué_ estamos haciendo nuestro comentario. Por favor
expliquemos nuestra intención, señalemos el principio o la buena práctica que estamos siguiendo, o
describamos cómo nuestra sugerencia mejora la calidad de nuestro repositorio o reduce nuestra deuda
técnica.

## Usemos lenguaje claro y simple

Esforcémonos en comunicarnos con asertividad. Usemos lenguaje amable, claro, inclusivo, preciso y
simple. Evitemos usar lenguaje rebuscado o abusar de las abreviaturas.

## Señalemos con precisión

Sólo señalemos las palabras que requieren atención. No "subrayemos" de más o donde no está el asunto
que queremos señalar. No digamos cosas como: "por ahí hay algo raro". Digamos exactamente dónde está
lo raro y por qué nos parece raro.

## Expliquemos qué es lo que entendimos

Para verificar que estamos interpretando correctamente la intención de quien solicita la revisión,
por favor expliquemos qué es lo que entendimos. ¿Cuál creemos que es la intención en la línea que
estamos señalando?

## Proveamos alternativas de solución

En general, es responsabilidad de quien solicita la revisión arreglar el _código en revisión_
(**PR** por _pull request_), no de nosotros los revisores.

Sin embargo, esto no significa que porque somos revisores, no debamos ayudar. Por favor señalemos
los problemas y proporcionemos orientación sobre su solución. Ayudemos a quien solicita la revisión
a solucionar el problema ofreciendo una alternativa; si es posible, ofrezcamos más de una opción.
Dejemos que quien solicita la revisión tome la decisión sobre cómo resolver el problema para
facilitar su aprendizaje y las futuras revisiones. Tal vez quien solicita la revisión encuentre una
mejor solución que la que nosotros proponemos, porque su familiaridad con el código es mayor que la
nuestra.

A veces, lo más útil son las instrucciones precisas, las sugerencias de cambios concretos o incluso
las contribuciones con código mediante consignaciones en el mismo PR. El objetivo principal de la
revisión de nuestro código es obtener el mejor código posible. El objetivo secundario es mejorar
gradualmente las habilidades de quien solicita la revisión.

## Proveamos referencias

Quien solicita la revisión nos agradecerá si señalamos con vínculos (ligas) las referencias en las
que basamos nuestra revisión. Intentemos usar las mismas referencias que ya hemos usado en el
pasado. Idealmente mostraremos ejemplos de nuestro propio código.

## Solicitemos cambios, no explicaciones

Si le pedimos a quien solicita la revisión que nos explique código que no entendimos, eso
generalmente debería resultar en que **reescriba el código más claramente**. Ocasionalmente, agregar
un comentario en el código también es una respuesta apropiada, siempre y cuando el comentario no
evite simplificar el código que sea demasiado complejo.

Las explicaciones escritas sólo como comentarios del PR **no** son útiles para futuras lectoras o
lectores del código. Son aceptables sólo en algunas circunstancias, como cuando estamos revisando
algo en lo que no estamos muy familiarizados y quien solicita la revisión explica algo que las y los
lectores usuales del código seguramente ya saben.

## Usemos la forma interrogativa en lugar de la imperativa

Con el propósito de fomentar el diálogo y facilitar la discusión, redactemos nuestras solicitudes de
cambio como sugerencias en forma de preguntas en lugar de instrucciones en forma imperativa. En
lugar de _"Mueve esta oración al siguiente párrafo"_ podríamos decir _"¿Crees que si movemos esta
oración al siguiente párrafo conservaríamos el significado y ganaríamos legibilidad?"_.

## Usemos _"nosotros"_ en lugar de _"tú"_

Cuando sea posible, usemos la primera persona del plural en lugar de la segunda persona del
singular. Por ejemplo, en lugar de: _"**usa** la primera persona del plural"_ podríamos decir _"¿Es
posible que aquí **usemos** la primera persona del plural sin cambiar el significado?"_

## Usa emojis y GIF

Los emojis y GIF nos ayudan a complementar las ideas, emociones o sentimientos que queremos expresar
en un comentario.

---

## Checklist for _Pull Request_

- [ ] **Small**: The pull request has fewer than 100 lines.
- [ ] **Passing**: The CI pipeline is passing.
- [ ] **Technical debt reduction**: Did we reduce any form of technical debt? Are we confident that this change did not introduce or increase technical debt?
- [ ] **Complexity**: Could the code be made simpler? Would another developer be able to easily understand and use this code when they come across it in the future? Is this code adding functionality that isn't presently needed?
- [ ] **Design**: Is the code well-designed and appropriate for your system?
- [ ] **Tests**: Does the code have correct and well-designed automated tests? Does the code behave as the author likely intended? 
- [ ] **Interface**: Any interface changes are sensible and look good. Is the way the code behaves good for its users?
- [ ] **CHANGELOG.md**: Are the changes recorded in this file following [this](https://keepachangelog.com/) standard? 
- [ ] **Versioning**: Are version numbers updated according to [semantic versioning](https://semver.org/) guidelines (e.g., MAJOR.MINOR.PATCH)? 
- [ ] **Documentation**: Did the developer also update relevant documentation? Does the exposed functions have docstrigns? **No tenemos pero nos vamos a pasar de líneas.**
- [ ] **CITATION.cff**: Is the citation files included and updated following the [this](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files) standard? _[Aquí](https://github.com/IslasGECI/seabird_tracking/blob/develop/CITATION.cff) y [aquí](https://github.com/IslasGECI/nerd/blob/develop/CITATION.cff) hay ejemplos._
- [ ] **Naming**: Did the developer choose clear names for variables, classes, methods, etc.?  Did we replace unnecessary comments with clear variable names, well-named functions, and small cohesive blocks?
- [ ] **Style**: Does the code follow our [style guides](https://islas.dev/guia_de_estilo/lista_de_guias)?
- [ ] **YAGNI**: The developer is not implementing things they might need in the future but don’t know they need now.
- [ ] **Good Things**: If you see something nice in the pull request, tell the developer, especially when they addressed one of your comments in a great way. 

---

## Referencias

- [How to write code review
  comments](https://google.github.io/eng-practices/review/reviewer/comments.html)
- [How to Do Code Reviews Like a Human (Part One)](https://mtlynch.io/human-code-reviews-1/)
- [How to Do Code Reviews Like a Human (Part Two)](https://mtlynch.io/human-code-reviews-2/)
