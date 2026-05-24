---
layout: post
title: "Nuestras herramientas"
author: Evaristo
tags: equipo
---

Cada oficio tiene sus herramientas características. Las herramientas de las y los practicantes de
Ciencia de Datos son programas de computadora y lenguajes de programación que nos permiten realizar
análisis cuantitativos de forma colaborativa y reproducible.

En GECI, toda acción de conservación implica la colecta de datos mediante actividades de monitoreo
diseñadas para evaluar cuentitativamente los beneficios de nuestra intervención en la biodiversidad
de la isla que restauraramos.

Antes de analizar un conjunto de datos, la curadora de datos verifica que los datos recibidos sean
adecuados. Típicamente recibimos los datos en un archivo de Excel con miles de registros. Dado que
es difícil encontrar manualmente errores en una tabla de este tamaño, la curadora de datos usa
**GoodTables** para validar la estructura y el contenido del conjunto de datos de forma automática e
inmediata. GoodTables nos permite encontrar en segundos un error de dedo (por ejemplo una O en lugar
de un 0) en un archivo con miles de registros.

En algunos casos no es pertinente guardar los datos en un archivo de Excel. En proyectos complejos
los datos provienen de fuentes diversas y no es prudente combinarlos en una sola tabla. En estos
casos es necesario usar **bases de datos relacionales** para guardar la información sin redundancia
en múltiples tablas y combinar las tablas considerando las relaciones que existen entre las
diferentes variables del sistema. Los sistemas de gestión de bases de datos relacionales que más
usamos son **MySQL**, **SQLite** y **Access**.

Una vez que los datos han sido depurados y almacenados, realizamos un análisis exploratorio de datos
para familiarizarnos con su naturaleza y características. Durante esta manipulación inicial de los
datos graficamos los datos crudos, elaboramos histogramas o diagramas de cajas y bigotes, y
calculamos algunos estadísticos básicos. A medida de que avanzamos en esta exploración, los
resultados mismos nos van sugiriendo realizar nuevas visualizaciones para observar los detalles de
alguna característica que nos haya llamado la atención. Esta actividad un tanto lúdica la realizamos
de forma interactiva, es decir, introducimos un comando en la computadora, la computadora nos
responde con un resultado, y el resultado nos impulsa a introducir otro comando. En esta etapa, cada
comando depende del resultado producido por el comando anterior. Esta interacción sucede en un
intérprete de comandos como **Bash** o en el intérprete de **Python** o **R** o en un cuaderno
interactivo (_notebook_) de Jupyter.

Después del análisis exploratorio de datos tenemos algunas ideas sobre cuales metodologías nos
podrían ayudar a responder la pregunta de conservación planteada. Los subsecuentes análisis también
los hacemos en Python o R. Python y R son los lenguajes de programación más usados actualmente en
Ciencia de Datos. Ambos son lenguajes gratuitos y por ser tan populares es fácil encontrar ayuda
sobre cómo usarlos. Además, podemos utilizar Python fuera del análisis de datos, por ejemplo, para
desarrollar aplicaciones web. Para hacer nuestros análisis preferimos los lenguajes de programación
o programas que ofrecen una **interfaz de línea de comando** (CLI) porque nos brindan la
flexibilidad de usarlos tanto de forma interactiva (en la línea de comandos) como programática. Una
vez satisfechos con los resultados obtenidos, transcribimos los comandos ejecutados a un guión de
comandos (_script_) para reproducir el resultado de forma no interactiva. Eliminar la interactividad
nos permite automatizar el proceso lo cual implica la reproducibilidad de nuestros resultados.

Los hallazgos de nuestros análisis los describimos en un reporte técnico. Este reporte incluye
descripciones de los métodos analíticos usados, los resultados obtenidos y las conclusiones a las
que arribamos. Los reportes técnicos los escribimos en un **lenguaje de marcado** (_markup_),
usualmente **LaTeX**, **Markdown** o **HTML**. Los lenguajes de marcado son convenciones para
escribir texto indicando en el contenido las instrucciones para su formato. Estos lenguajes nos
permiten editar nuestros reportes sin depender de alguna aplicación particular (por ejemplo Word) ya
que los documentos se guardan como archivos de texto simple sin formato (_plain text_).

Esta nota la estoy escribiendo en el lenguaje de marcado Markdown con el editor de código fuente
Visual Studio Code. A medida que voy escribiendo el contenido también voy agregando código que
indica el formato con el que deseo que se presente el texto pero mientras escribo el contenido no
veo el formato, sólo veo el código mezclado con el contenido. Al final, un programa interpreta el
código Markdown y genera la versión en la que el lector puede ver el texto con el formato deseado.

Al concluir un análisis terminamos con varios guiones de comandos para producir los resultados y los
reportes técnicos. Debemos ejecutar estos guiones en un orden particular cuando queremos producir
los resultados nuevamente. El orden en el que ejecutamos los los guiones lo describimos en un
archivo llamado `Makefile`. En el `Makefile` también describimos las relaciones entre los datos,
guiones y reportes, además de las dependencias que el análisis tiene en los módulos de los lenguajes
de programación y en los paquetes del sistema operativo. El `Makefile` puede ser usado como guía por
otro u otra científica de datos para reproducir el mismo resultado y examinar el método usado. El
`Makefile` es a su vez un archivo de instrucciones interpretado por **GNU Make**. Make es un
programa que permite automatizar la producción de resultados en múltiples ocasiones de forma no
interactiva.

Para escribir nuestros guiones de comandos, los reportes técnicos de nuestros análisis, el archivo
de instrucciones de Make y cualquier otro archivo de texto usamos un **editor de código fuente**. El
editor de código fuente es el programa que más usamos en nuestro trabajo. Actualmente, nuestro
editor favorito es **Visual Studio Code** aunque de vez en cuando usamos **Vim**; **Atom** es otro
editor que en el pasado usamos mucho.

El código fuente de cada análisis es examinado por otro integrante del equipo en una revisión por
pares entre científicos de datos. El autor del análisis usa **Git** para compartir el código fuente
con el revisor. Git es un sistema de control de versiones que nos permite registrar cada cambio que
hacemos al código fuente de nuestros análisis y nos facilitan el trabajo colaborativo. Después de
varias tandas de revisiones y correcciones, eventualmente aprueban el código fuente y los guiones
pasan a ser parte del acervo de herramientas generadas por el equipo de Ciencia de Datos.

Finalmente, para asegurarnos que es posible reproducir un resultado es necesario que el entorno de
la computadora en el que se desea reproducir el resultado sea el mismo (o al menos compatible) que
el entorno usado para producir el resultado por primera vez. Para replicar los entornos de
producción de resultados usamos **Docker**. Cada científico de datos genera los resultados dentro de
un contenedor de Docker (un concepto similar al de máquinas virtuales) y luego comparte el
contenedor junto con los datos de entrada y el código fuente del análisis asegurando así su
reproducibilidad.

Esas son las principales herramientas que usamos en el equipo de Ciencia de Datos de Conservación de
Islas. GoodTables, MySQL, SQLite, Python, R, LaTeX, Markdown, Make, Visual Studio Code, Git y Docker
nos facilitan el trabajo colaborativo a la vez que nos garantizan la reproducibilidad de nuestros
resultados.
