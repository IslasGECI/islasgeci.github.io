---
layout: post
title: Las inspecciones, una revisión por pares
author: Nepo
tags: programacion
---

## ¿Qué es una inspección?
Karl Weigers enlista algunos ejemplos de revisiones por pares en su libro "Peer Reviews in
Software". Las revisiones pueden ser acomodadas dependiendo de la formalidad de la metodología. Así,
la menos formal es "Ad hoc Review" que consiste en pedirle ayuda a un colega con algún problema que
tienes. Los siguientes dos ejemplos son "_Peer Deskcheck_" y "_Pair Programing_", ambos los
utilizamos en el trabajo diario del equipo de Ciencia de Datos. "_Peer Deskcheck_" es la manera
estándar de definir las revisiones en nuestra columna de **Revisando**, una persona somete su
trabajo para que otra revise que se cumplan todos los elementos de un _checklist_. Y "_Pair
Programming_" es lo que hacemos en nuestros tomates. Los tres ejemplos más formales de revisión por
pares son "Recorrido", "Revisión en equipo" e "Inspección". Para Karl, la revisión más formal es la
inspección.

La inspección consiste en un par de reuniones donde las y los participantes de la inspección cumplen
con diferentes roles. El objetivo principal de la inspección deberá ser encontrar defectos graves en
nuestro trabajo. A continuación hablaremos brevemente de esta revisión por pares.

## ¿Quiénes son los participantes y cuáles sus roles en una inspección?
- **Autor o autora**: No tiene permitido moderar, leer o contar, ya que está muy cerca al trabajo
  como para actuar con objetividad. Además, esto podrá ayudarle a prestar más atención a los
  comentarios que los otros inspectores hagan.
- **Lector o lectora**: Será quien presenta pedazos de código. La idea es probar la claridad del
  código. La interpretación a veces revela ambigüedad, suposiciones escondidas, documentación
  inadecuada o problemas de estilo que entorpecen la comunicación.
- **Moderador o moderadora**: Deberá de mandar las noticias del aviso de la reunión con los eventos,
  las fechas y los tiempos. Si el o la autora y el o la moderadora asignan alguna responsabilidad
  para las y los inspectores, el o la moderadora deberá de comunicar esa información junto con las
  listas de revisión (_checklist_). A toda esa información le llamamos el paquete de la inspección.
- **Contador o contadora**: Durante la reunión de inspección, estará a cargo de llenar la sección de
  _**Issue log**_. Ahí irán los problemas presentados en la inspección que todos y todas las
  participantes estén de acuerdo que deben ser corregidos.
- **Las y los inspectores**: Al resto de las y los participantes los llamamos inspectores. Ellas y
  ellos revisarán el código desde distintas perspectivas en la etapa de preparación y anotarán sus
  observaciones. La primera intervención que hará cada inspector en la reunión de inspección será
  decir algo positivo del producto en revisión.

## ¿Cuáles son las etapas de una inspección?
- **La revisión general**: Esta es un reunión la cual dirige el o la autora. El fin es juzgar si las
  o los inspectores tienen la información necesaria para entender el código. Así si en la revisión
  ellos detectan un _bug_ deberán esperan hasta la reunión de inspección para señalarlo. A más
  tardar, al final de la revisión los inspectores deberán tener el paquete de inspección y los
  objetivos del autor.

- **La preparación**: El verdadero trabajo de encontrar problemas ocurrirá aquí. Los inspectores
  examinan el código en busca de posibles errores, usando los _checklist_ de defectos. Escriben las
  dudas y los problemas para presentarlos en la reunión de inspección. A los problemas encontrados
  debemos agregarles prioridad, estatus y tipo. Los errores de tipografía los agregaremos como
  sugerencias. El tiempo de preparación es de una hora por cada 200 líneas de código.

- **La reunión de inspección**: No utilicen más de un minuto decidiendo cómo resolver un problema,
  ya que el tiempo que utilices en el problema es tiempo que no utilizarán en encontrar más
  problemas. La descripción que haga el lector durante la reunión deberá ser como la de un o una
  profesora dirigiéndose a sus estudiantes. El tiempo estimado de la reunión de inspección es de una
  hora por cada 200 líneas de código, el mismo de la preparación.

- **El seguimiento**: Al terminar la reunión de inspección determinaremos si necesitaremos hacer más
  trabajo. Si eso es requerido asiganremos a alguien para que haga la verificación de que
  acompletamos dicho trabajo. El tiempo que nos tomó atender las correcciones nos dará información
  para hacer estimaciones del tiempo que toma nuestro flujo de trabajo. En esta parte el o la
  moderadora u otra persona asignada se reúne con el o la autora para verificar que ya resolvimos
  todos los problemas.

- **El análisis causal**: Aquí analizaremos los defectos y evaluaremos que tan bien pudimos detectar
  los errores. Si ayudó a que el equipo mejorara la calidad en el desarrollo y en la revisión de
  código. Esta parte es para poder obtener el mejor beneficio a partir de los datos de la inspección
  (CEP).

## ¿Cuáles son las herramientas para la inspección?
- [Patrones en pruebas
  unitarias](https://medium.com/swlh/3-patterns-for-reducing-duplication-in-your-unit-tests-7d693c6bfbd2)
- [Código que apesta (_Clean
  code_)](https://learning.oreilly.com/library/view/clean-code-a/9780136083238/chapter17.html#ch17)
- [Principios SOLID](http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod?)
- [Patrones de diseño](https://learning.oreilly.com/videos/clean-code/9780134661742/9780134661742-CODE_E25)
- [Guías de estilo](https://islasgeci.github.io/guia_de_estilo/)
- [_Checklists_ de la columna **Revisando**](https://github.com/IslasGECI/manual#checklists-del-kanban)
