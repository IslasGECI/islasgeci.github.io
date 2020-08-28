---
layout: post
title: Flujo de trabajo
author: Maritza y Fernando
tags: equipo
---

En este post platicaremos sobre nuestro flujo de trabajo en la dirección de Ciencia de Datos.

Nuestro flujo de trabajo comienza en la curación de los datos, seguido del análisis correspondiente y 
concluye con la elaboración del reporte técnico.

## Procesamiento de datos

### 1. Obtención de datos

Cada organización, institución o empresa genera una gran cantidad de datos independientemente del
giro que esta desarrolle. Particularmente, nuestra organización GECI, es una asociación civil que ha
participado en diferentes proyectos con la finalidad de la recuperación de sistemas insulares,
realizando diversas actividades y monitoreos de los cuales vamos tomando registros.

Algunos ejemplos de estos proyectos son: las erradicaciones de especies invasoras o la respuesta
rápida ante estas, monitoreos como: morfometría y anillamiento de aves, madrigueras naturales o
artificiales, esfuerzos de trampeo.

Cada tabla que obtenemos de cada monitoreo, ya sea de meses o años, tiene el potencial de
convertirse en valiosa información. ¿Cuáles son las problemáticas con las bases de datos? La primera es
que con cada uno de los proyectos obtenemos al menos una base de datos. No tener un manejo
adecuado nos llevará a un almacenamiento masivo de datos, sin tener la oportunidad de explotar la
información contenida en estas. Estas bases de datos contienen información significativa y son el
recurso fundamental para los análisis. 

Ahora, si recopilamos todos estos datos en tablas o archivos separados, que generalmente no se comunican entre sí, tenemos otro problema. La fuente del problema es que no existe un medio en el cual todas las personas tengan acceso y puedan consultar estas bases de datos.

Uno más de estos problemas, es la información no documentada. Esto quiere decir que solo la persona
que recopiló la información conoce la tabla. Un ejemplo podría ser una base de datos con registros
de morfometría de aves, donde no están documentadas las unidades (cm o in) en las que se tomaron las
medidas. Por lo que alguien que consulte esta tabla podría verse en problemas a la hora de procesar
la información.

Acceder a todos estos datos y la integración de estos es una tarea importante, especialmente si lo
que queremos es poder tomar decisiones basadas en los análisis de los datos generados.

### 2. Curación de datos

En Ciencia de Datos hemos adoptado metodologías que se utilizan en el desarrollo de software para
automatizar los procesos de curación de datos y análisis.

Si las fuentes de datos son internas o de terceros externos, los datos eventualmente contendrán
errores. Los errores de datos pueden (obstruir/bloquear) el flujo de datos. Los errores también
pueden ser sutiles, como registros duplicados o campos individuales que contienen datos erróneos.
Los errores de datos pueden ser difíciles de rastrear y de resolver rápidamente.

La integración de datos, la limpieza, la transformación, el aseguramiento de la calidad y la
implementación de nuevos análisis deben realizarse sin problemas día tras día.

Hemos automatizado una parte de estas tareas, pero en muchas ocasiones realizamos
numerosos procesos manuales de forma regular. Estos procedimientos de memoria son propensos a
errores, requieren mucho tiempo y son tediosos.

## Análisis de datos

### 3. Estadística descriptiva

La estadística descriptiva aplicada a un conjunto de datos, es lo que comúnmente conocemos como
análisis exploratorio de datos. En resumen, en este análisis utilizamos números, tablas y gráficas
para describir la información y sacar conclusiones sobre la muestra de datos.

Esto también nos ayuda a saber qué tipos de análisis cuantitativos son viables para implementar en
el siguiente paso, cuáles metodologías son viables para el conjuto de datos dada la incógnita que
pretendemos resolver. Por ejemplo, no puedes usar métodos de _machine learning_ con pocos datos,
simplemente no funcionaría.

### 4. Estadística inferencial

En este escenario realizamos análisis y ajuste de modelos estadísticos. Aquí pretendemos extraer
conclusiones globales para toda la población, a partir de una muestra de datos.

Es crucial contar con una muestra representativa y sin sesgos de la población para obtener mayor
confiabilidad. Por definición, podemos rechazar una hipótesis, pero nunca podemos probarla. Lo único
que podemos hacer es rechazar la hipótesis nula con cierta significancia estadística, o como se
acostumbra, con cierto p-valor.

El nivel de significación de una prueba estadística es un concepto estadístico asociado a la
verificación de una hipótesis. El p-valor es una probabilidad condicional, la probabilidad de
obtener las observaciones si la hipótesis nula es verdadera.

Por ejemplo, digamos que queremos probar que la población de albatros de Laysan en Isla Guadalupe
(IG) está en crecimiento. Para esto, hacemos monitoreos de conteo de nidos y así obtener una muestra
de la población de albatros en IG anualmente. Como todos sabemos, por las características de esta
colonia las muestras son altamente representativas de la población, los conteos son prácticamente
exactos. Incluso si por algúna razón no contase algunos individuos el nivel de significancia
sería muy alto. Sin embargo, esta misma muestra de datos, ¿es representativa para decir
que la población de albatros de Laysan del mundo entero está en aumento?. Habiendo en IG solo cerca
del 1% de la población mundial de albatros, no es posible obtener resultados significativos con la
muestra nidos de albatros en IG.

## Entrega

### 5. Reporte técnico

Finalmente el reporte tiene como objetivo comunicar de la forma más clara y precisa posible, los
resultados obtenidos del análisis cuantitativo. Con todas sus partes, un resumen, introducción, la
metodología, resultados y algunas conclusiones, apoyándonos de herramientas visuales como gráficas y
tablas. Estos reportes siempre son revisados por pares.

Para reproducir o generar un reporte, repetimos de manera automátizada cada uno de los análisis y
desplegamos los resultados en el archivo final de salida. Esto nos ayuda a que cuando haya
actualización de datos, los resultados se incorporen al reporte de manera automatizada.

## Conclusión

Todo este flujo de trabajo, lo hacemos de manera reproducible. En principio cualquier compañero de
GECI solo necesita tener instaladas dos herramientas en su computadora, **git** y **docker**. Esto
es muy útil, por ejemplo en estos días durante situación actual con la pandemia. Yo por ejemplo he
estado trabajando en mi computadora personal. Y no tuve que copiar NADA de la computadora de oficina
a la mia. Todo está en plataformas en línea (nube) y con instalar estas dos herramientas en mi
computadora, puedo reproducir todos los análisis que hemos hecho en el último año.

El proceso de la automatización en la ciencia de datos es algo novedoso. No es posible automatizar
por completo el proceso, la intervención humana es necesaria como en la mayoría de las ciencias. Sin
embargo es diferente automatizar todo el proceso, a automatizar las herramientas utilizadas en el
proceso. A largo plazo esta metodología nos proporciona mayor velocidad de respuesta en la
generación de nuevos resultados.
