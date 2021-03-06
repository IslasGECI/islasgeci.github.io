﻿---
layout: post
title: "Ciencia de Datos para la Conservación de la Biodiversidad: El caso de las Islas de México"
author: Evaristo, Nepo, Maritza, David, Efren y Fernando
tags: equipo
---

## Introducción

La Ciencia de Datos es un campo académico interdisciplinario, basado en evidencias, que tiene como
objeto de estudio las diferentes técnicas de análisis de datos [^1]. En años recientes, la
popularidad de este campo ha aumentado gracias a las empresas privadas que pretenden maximizar sus
ganancias agregando valor al gran volumen de datos  que generamos mediante las tecnologías de la
información. Sin embargo, hasta ahora las organizaciones que se dedican a la conservación de la
biodiversidad y al desarrollo sustentable habían obtenido poco beneficio del desarrollo de la
Ciencia de Datos.

El Grupo de Ecología y Conservación de Islas, A.C., (GECI), es una asociación civil sin fines de
lucro que tiene como misión la protección de los ecosistemas insulares mexicanos y la restauración
de su biodiversidad. Gracias al trabajo interdisciplinario en colaboración con las comunidades de
pobladores insulares, GECI ha logrado la recuperación de ecosistemas insulares y de numerosas
poblaciones de plantas y vertebrados nativos, además de contribuir a mejorar la calidad de vida de
las y los habitantes de las islas.

En GECI contamos con un equipo de Ciencia de Datos cuyos objetivos son optimizar los recursos para
la conservación y evaluar el impacto de nuestras intervenciones de restauración. El equipo de
Ciencia de Datos desarrolla diversos estudios y aplicaciones de apoyo para la toma de decisiones y
ejecución de proyectos de conservación de las islas de México. Nuestro equipo está conformado por
mujeres y hombres profesionistas en las áreas de oceanología, ingeniería en computación, ingeniería
geofísica, física y matemáticas. Cada una de estas profesiones aporta conocimientos y habilidades
distintas, de tal forma que sólo al considerar al equipo en su conjunto resulta una unidad completa
con todas las habilidades requeridas.

En la Ciencia de Datos aplicada a la conservación de las islas de México, nos basamos principalmente
en tres áreas de conocimiento: la ambiental, computacional y matemática.

La primera área del conocimiento está relacionada con el ambiente. En las islas, los fenómenos
oceanográficos y meteorológicos de escala regional y global afectan la distribución y abundancia de
las poblaciones biológicas. El Niño-Oscilación del Sur, las condiciones Santa Ana, y El Blob son
ejemplos de fenómenos que influyen en la ecología insular. La Ciencia de Datos, aplicada a grandes
volúmenes de información sobre las variables ambientales, nos permite identificar con prontitud la
ocurrencia de estos fenómenos y hacer predicciones sobre la magnitud de su impacto sobre las
poblaciones que pretendemos conservar.

La ingeniería en computación abarca el conocimiento relacionado con la segunda categoría. Adoptamos
las técnicas y herramientas usadas en el desarrollo de software ya que nos facilita la
reproducibilidad de los resultados, la automatización de procesos y el trabajo colaborativo. Con
reproducibilidad de resultados nos referimos a la capacidad de replicar, por ejemplo, una gráfica,
un mapa o un estadístico a partir de los datos originales. La automatización de procesos nos permite
escalar la producción de resultados que inicialmente generamos para una especie particular en una
isla específica, generalizando nuestras metodologías para otras especies, otras islas y otras
temporadas. El trabajo colaborativo nos permite a todas y todos los integrantes del equipo de
Ciencia de Datos participar en cada uno de los análisis realizados por el equipo. Al conjunto de
prácticas enfocadas en la reproducibilidad, automatización y colaboración en el análisis de datos lo
llamamos _DataOps_.

La tercera categoría incluye conocimiento matemático. Para elaborar un plan de restauración es
necesario conocer el estado actual de la población que se desea restaurar. Sin embargo, determinar
el estado actual de nuestro objeto de conservación mediante observaciones directas es por lo general
prohibitivo dados los costos de las mediciones. Mediante la abstracción de procesos ecológicos
complejos y su representación en modelos matemáticos simplificados, podemos inferir el estado actual
de nuestro objeto de conservación sin necesidad de medirlo directamente. También así, podemos
predecir el impacto de nuestras acciones, lo que nos ayuda a optimizar los recursos disponibles para
la conservación de las islas de México, maximizando los beneficios de nuestras intervenciones de
restauración.

Las siguientes secciones tratan sobre el papel que juegan el análisis de variables ambientales, la
computación y las matemáticas en la Ciencia de Datos aplicada a la conservación de las islas de
México.

## Análisis de variables ambientales

### La Ciencia de Datos como medio para entender los fenómenos oceanográficos y meteorológicos

Los fenómenos oceanográficos y meteorológicos como el ENSO, el Blob y los vientos de Santa Ana,
difícilmente podrían caracterizarse sin un monitoreo continuo y a largo plazo de las variables
atmosféricas y parámetros oceanográficos.

La Ciencia de Datos nos ayuda a entender condiciones climáticas a lo largo del tiempo, de tal manera
que podamos saber qué es lo que viene y cómo podemos actuar. Para este fin, la Ciencia de Datos
aprovecha dos elementos fundamentales: los recursos para el manejo de grandes cantidades de datos y
las técnicas de análisis de datos.

El monitoreo continuo de variables ambientales (tales como la temperatura superficial del mar,
dirección y velocidad del viento, etc.), es un requerimiento fundamental para poder conocer las
interacciones, fenómenos y cambios en los sistemas oceanográficos. La gran cantidad de registros
obtenidos a partir del monitoreo resulta en un almacenamiento masivo de datos. Estas bases de datos
contienen información significativa y son el recurso fundamental para el análisis a diferentes
escalas de los fenómenos meteorológicos.

Las herramientas que ofrece la Ciencia de Datos para el almacenamiento, manejo y análisis de datos,
hacen posible la detección de este tipo de fenómenos. De otra forma, sin un análisis adecuado de los
datos, estos fenómenos pasarían inadvertidos excepto por los impactos directos en los ecosistemas
(por ejemplo, en las aves marinas como lo mencionamos en las siguientes secciones). A continuación,
describimos tres ejemplos de fenómenos oceanográficos y meteorológicos que podemos estudiar mediante
el análisis de variables ambientales.

### ENSO

En el 2016, Chunzai Wang[^2] describió a El Niño-Oscilación del Sur (ENSO, por sus siglas en inglés)
como una condición ambiental cíclica que ocurre a través del Océano Pacífico Ecuatorial. El Niño es
un evento de calentamiento oceánico a gran escala en el Pacífico tropical que ocurre con una
periodicidad de pocos años. La Oscilación del Sur está caracterizada por una fluctuación interanual
en la presión del nivel del mar tropical entre el Pacífico occidental y el Pacífico oriental. Dicha
fluctuación consiste en un debilitamiento y fortalecimiento de los vientos alisios sobre el Pacífico
tropical. Desde hace medio siglo, Bjerknes[^2] reconoció que existe una conexión muy estrecha entre
El Niño y la Oscilación del Sur, y que ambos son dos aspectos diferentes del mismo fenómeno.

En el capítulo de El Niño and Southern Oscillation (ENSO): A Review, Chunzai Wang[^2] hace notar
varios puntos relacionados con el ENSO: 1) las anomalías de la temperatura superficial del mar (TSS)
y el viento zonal están altamente correlacionadas, indicando que el ENSO es un fenómeno acoplado de
océano-atmósfera. 2) Muestra un comportamiento oscilatorio con una escala de tiempo preferida de
entre 3 y 5 años, a pesar de una considerable irregularidad en la oscilación. 3) Los eventos ENSO
muestran asimetría entre los eventos cálidos de El Niño y los eventos fríos de La Niña, con
anomalías de El Niño más grandes que las de La Niña. La Niña, a su vez, produce efectos opuestos a
los de El Niño, dentro del mismo fenómeno ENSO. En La Niña los vientos alisios transportan el agua
cálida superficial hacia el oeste a través del Pacífico, conduciendo a las aguas más frías hacia el
este y a las más cálidas hacia el oeste.

Arne Mooers, en un artículo del 2007 titulado El Niño and Biodiversity[^3], menciona que ambas
condiciones (El Niño y La Niña) producen efectos marcadamente importantes en los ecosistemas a lo
largo del planeta, sobre todo a latitudes bajas. La presencia de El Niño y La Niña puede influir
sobre los patrones meteorológicos, las condiciones oceánicas y las pesquerías marinas a través de
grandes porciones del planeta por un periodo largo de tiempo.

Marcus England, en su artículo del 2000 _"A review of bird responses to El Niño-Southern Oscillation
conditions in the Neotropics"_[^4], dice que las aves marinas son uno de los grupos biológicos más
afectados por el El Niño, ya que su comportamiento está relacionado directamente con el ambiente
marino. Por una parte, un aumento de la temperatura del aire puede ocasionar un estrés térmico en
las aves. Por otro lado, un aumento en la temperatura superficial del mar ocasiona cambios en la
distribución de ciertos organismos marinos, como las sardinas, que son alimento de muchas aves
marinas. Ambos escenarios ocasionan un incremento en el abandono de los sitios de anidación y de la
mortandad de las crías de las aves, que en este caso mueren por inanición. Un caso registrado es el
de la pardela mexicana en Isla Natividad en el evento de El Niño del 2015. Durante la temporada de
anidación de la pardela en este año (primavera - verano), las aves comenzaron a abandonar sus nidos
debido al intenso calor registrado y a la poca disponibilidad de alimento por la alta temperatura
del mar. La baja productividad (cantidad de volantones por nido activo) es un reflejo del abandono
de los nidos de la pardela mexicana para ese año.

### Vientos de Santa Ana

Los eventos atmosféricos conocidos como vientos de Santa Ana se caracterizan por ser vientos secos y
regularmente cálidos que afectan el sur de California y el norte de Baja California. Según la
Universidad de California en Los Ángeles (UCLA, por sus siglas en inglés)[^5], los vientos de Santa
Ana son siempre secos, como resultado de su descenso desde su lugar de origen en la Gran Cuenca de
Nevada y Utah, que son regiones altas. En su artículo _"The Santa Ana Winds of California"_, Raphael
Marilyn[^6] dice que los vientos de Santa Ana suceden regularmente entre el otoño y el inicio de la
primavera, entre septiembre y abril, pero tienen mayor ocurrencia en diciembre.

En la nota _"What Are the Santa Ana Winds?"_, de la página mentalfloss[^7], podemos encontrar una
descripción del origen de los vientos de Santa Ana. La nota dice que los vientos se originan cuando
se forman sistemas de alta presión entre la Sierra Nevada y las Montañas Rocosas. El aire dentro del
sistema de alta presión fluye en dirección de las manecillas del reloj, por lo tanto, los vientos en
la parte sur del sistema son empujados hacia el oeste, directo al Océano Pacífico. Los vientos pasan
sobre las montañas, entre la costa de California y los desiertos continentales. Mientras el viento
va fluyendo hacia la costa, el aire se comprime y su temperatura aumenta. Al mismo tiempo, la
humedad baja a menos de 20% e incluso a veces hasta por debajo de 10%. Los vientos también aumentan
su velocidad, al verse forzados a pasar entre estrechos pasos de montaña y cañones.

Tom Rolinski, en su artículo publicado en el 2019 _"Santa Ana Winds: A Descriptive
Climatology"_[^8], menciona que las condiciones extremadamente secas y ventosas durante los eventos
Santa Ana crean condiciones favorables para producir incendios catastróficos. Estos incendios
ocurren regularmente en el otoño y a inicios del invierno cuando la vegetación nativa es más
susceptible a igniciones. Rolinski menciona que, durante dichos eventos, el fuego se puede propagar
rápidamente a través de la vegetación que existe entre las manchas urbanas, poniendo en riesgo vidas
humanas y propiedades.

Como ya mencionamos en la sección anterior, las aves marinas son susceptibles a los cambios
ambientales abruptos, como un aumento en la temperatura del aire debido a los vientos de Santa Ana.
Aunque las aves poseen mecanismos para regular su temperatura, un evento intenso de Santa Ana puede
llegar a ocasionarles serios problemas. Un ejemplo de esto ocurrió en el 2014 en Isla Guadalupe.
Julio Montoya reportó en la Red LEO[^9] que varios eventos de vientos de Santa estuvieron presentes
en la isla durante el mes de mayo. La intensidad de este fenómeno afectó fuertemente la
sobrevivencia de las aves marinas anidantes, ya que este fenómeno coincidió con la etapa de
crecimiento y maduración de las crías de aves marinas, particularmente de albatros de Laysan. El
resultado de este fenómeno fue la mortandad de muchas crías de albatros, debido a la alta
temperatura y a la baja humedad del ambiente.

### El Blob

Desde diciembre del 2013 hasta marzo del 2015, fueron registradas anomalías positivas de la
temperatura superficial del mar en el Pacífico noreste. Este evento cálido se esparció hacia el Este
desde la región centro-sur del Golfo de Alaska hacia la plataforma continental. Este fenómeno
comenzó a ser conocido como El Blob. El Blob es una masa de agua caliente en el Océano Pacífico
norte, esta masa de agua está ligada a cambios en el ambiente y en los ecosistemas oceánicos.

El Blob es causado por un incremento en la temperatura del aire, cambios en los patrones del viento,
y la masa de agua caliente persistente a lo largo del ecuador inducida por el ENSO. Según el
National Park Service[^10] (NPS), nunca antes se había registrado un evento como el Blob. El Blob es
un evento sin precedentes, debido a su magnitud (muy cálido y extendido) y su duración de varios
años.

Nick Bond, un científico del clima en la Universidad de Washington en Seattle, en su artículo del
2015 _"Causes and impacts of the 2014 warm anomaly in the NE Pacific"_, muestra patrones inusuales
de las variables ambientales. Desde septiembre del 2013 hasta febrero del 2014, las velocidades
mínimas del viento y la profundidad de la capa de mezcla fueron menores que los años anteriores. El
enfriamiento local, desde octubre del 2013 hasta febrero del 2014 fue 30% menor que el promedio. En
años anteriores, el flujo de calor en la capa superficial produjo un efecto de enfriamiento de 3°C
en el curso de 4 meses; sin embargo, el efecto de enfriamiento observado entre el 2013 y el 2014 fue
solo de 2°C.

Las aguas oceánicas frías son en general más productivas. Son ricas en plancton y en peces pequeños,
como sardinas y anchovetas, los cuales son importantes para especies marinas más grandes, como
mamíferos y aves marinas. Algunas especies dependientes del agua fría pueden moverse para escapar
del agua caliente o para poder encontrar suficiente comida. Tal es el caso de las aves marinas que
se alimentan de peces pequeños.

Bond, cuyo trabajo de investigación es en pesquerías y oceanografía, encontró que las condiciones
físicas que estuvieron relacionadas con las variables ambientales tuvieron impactos biológicos en la
región. Durante el verano e invierno de 2014 se registraron concentraciones extremadamente bajas de
clorofila, así como avistamientos inusuales de algunas especies de peces.

Las muertes de aves marinas han sido más cuantiosas desde la aparición del Blob. Aunque las muertes
de aves marinas no son inusuales, el NPS menciona que la cantidad de muertes durante el 2015 y 2016
del _Uria aalge_ (Arao común) fue la más grande registrada en el Golfo de Alaska. En el 2017 y 2018,
continuaron las muertes masivas de aves marinas, incluyendo más especies y cambiando geográficamente
al Mar de Bering y el Mar de Chukchi. Ya a finales del 2014 las consecuencias en la alcuela oscura
eran evidentes, podías ver miles de ellas famélicas en las costas de Oregón y Washington. La alcuela
es un ave marina que anida en algunas islas mexicanas, por ejemplo, en Guadalupe, San Benito y Todos
Santos.

## Computación

Cuando generamos un análisis estadístico, gráficas o mapas, lo hacemos en un documento que contiene
instrucciones escritas en lenguajes de programación como Python o R. Esto tiene dos beneficios. Uno
es que mientras los datos de entrada sean los mismos, obtendremos el mismo resultado. Otro, es que
el resultado se genera sin la intervención de un humano. Por ejemplo, para generar una gráfica en
Excel debemos seguir una serie de pasos de manera manual y estos pasos los tendríamos que repetir
cada vez que tengamos datos nuevos. Por otra parte, si deseamos que el estilo de la gráfica sea
personalizado (color de la fuente, tamaño de letra, color y tamaño de los marcadores, etcétera),
hacerlo nos podría tomar mucho tiempo. Tomando en cuenta lo anterior, uno de los principios del
equipo de Ciencia de Datos, es la automatización de la producción de resultados. La automatización
es evidencia de reproducibilidad. Si un resultado puede ser producido de forma automática sin la
intervención de un humano entonces ese resultado es reproducible, lo que facilita la revisión por
pares y la colaboración.

Desde que el equipo de Ciencia de Datos se formó en GECI, hemos generado una gran cantidad de
paquetes de uso interno para facilitar el trabajo que realizamos. Algunos de estos paquetes nos
ayudan a manejar datos geográficos, como puntos georeferenciados, trayectorias y polígonos. También
nos permiten personalizar gráficas, mapas y realizar análisis estadísticos, entre muchas otras
cosas. Gracias a esto, cada vez podemos generar una mayor cantidad de resultados en menor tiempo.
Para generar dichos paquetes, actualmente usamos una metodología llamada _DataOps_. _DataOps_
también nos permite implementar algoritmos de aprendizaje automatizado (_machine learning_) y
desarrollar nuestras propias aplicaciones para el análisis de datos para la conservación.

### Aprendizaje automatizado

En los últimos años, aumentó la utilización de una diversidad de algoritmos que los conocemos como
de “aprendizaje automatizado” (o _machine learning_ en inglés). Usualmente, estos algoritmos se
dividen en tres categorías: clasificación, regresión y agrupamiento. Una vez que contamos con
análisis estadísticos, utilizamos los resultados para entrenar a estos algoritmos que nos ayudarán a
predecir cosas nuevas. Aunque una limitante que tenemos para aprovecharlos al máximo es que
requieren una gran cantidad de datos, hemos empezado a utilizarlos con éxito. A continuación, se
describen tres situaciones que ejemplifican la forma en que lo hemos hecho.

#### Metodología para pasar de censo a muestreo

La responsabilidad más importante de una científica o un científico de datos es poder extraer
información relevante a partir de un conjunto de datos. Dicha información nos permite tomar
decisiones sobre cómo optimizar los recursos con los que la organización cuenta y cuantificar el
impacto de nuestras intervenciones en la restauración insular. Un ejemplo es la posibilidad de
optimizar los esfuerzos de monitoreo biológico en campo, encontrando patrones en los datos con que
ya se cuenta referentes a los sitios de anidación de las aves marinas en las islas.

Desde hace años, las biólogas y biólogos de GECI realizan censos de aves marinas en diversas islas
de México para conocer el estado de sus poblaciones. En el caso de las aves que anidan en
madrigueras, esto es un proceso complicado y exhaustivo. Las madrigueras son hoyos pequeños y
profundos. Para poder ver si están ocupadas o no, y si tienen huevos o pollos, los biólogos de campo
necesitan hincarse continuamente, con lo que se vuelve un trabajo arduo. Una de las islas donde es
más difícil realizar censos biológicos de las aves marinas es Isla Guadalupe, ya que es de origen
volcánico y el suelo es muy duro e irregular. Y sus islotes principales, muy escarpados, concentran
una gran cantidad de aves marinas que anidan en madriguera. Tomando lo anterior en cuenta, las
científicas y científicos de datos de GECI nos propusimos desarrollar una metodología que permitiera
que el esfuerzo requerido para monitorear las aves de madrigueras fuera menor. El primer paso que
seguimos fue agrupar en parches los datos históricos, con los que ya contábamos en la organización,
sobre la ubicación de las madrigueras donde las aves habitualmente anidan. Para ello, utilizamos el
algoritmo _k-means_, el cual permite agrupar datos en diferentes categorías. Este es un algoritmo de
aprendizaje no supervisado, lo cual significa que el programa puede encontrar la mejor forma de
hacer la clasificación sin ayuda. Una vez que obtuvimos un modelo de parches para agrupar
visualmente las madrigueras de las aves, diseñamos muestreos con los datos anuales históricos. Estos
diseños pretenden simular salidas de campo y nos brindan un estimado de la cantidad de madrigueras.
Posteriormente, seleccionamos el diseño que se acercó más a los valores de cantidad de madrigueras
obtenidos en campo a través de censos. Con la información obtenida, durante la temporada de
monitoreo del 2018, comparamos las dos metodologías: las biólogas y biólogos de campo realizaron
tanto censos como muestreos con cuadrantes. Al finalizar, analizamos los datos obtenidos a partir de
ambas metodologías y pudimos validar los resultados provenientes del muestreo con cuadrantes. Como
resultado, ahora contamos con una metodología que nos permite minimizar el esfuerzo realizado en
campo con márgenes de error mínimos.

#### ¿Cómo determinar el sexo de albatros de Laysan a partir de su morfometría?

El dimorfismo sexual (las diferencias físicas entre machos y hembras de una especie) en la mayoría
de las aves marinas es casi inexistente, por lo que la forma más segura de determinar el sexo de un
individuo es a través de pruebas sanguíneas. Esto no es ideal ya que las pruebas sanguíneas son
caras, tardadas y la toma de la sangre puede estresar a las aves. Desde hace algunos años, en GECI
hemos trabajado con albatros de Laysan en Isla Guadalupe. Los últimos cinco años hemos tomado
muestras de sangre y medidas morfológicas a cerca de cien individuos. Con estas medidas, construimos
un modelo logístico para determinar el sexo a partir de la morfometría. Para ajustar dicho modelo,
utilizamos un algoritmo de regresión y de aprendizaje supervisado. Esto quiere decir que para
emplearlo necesitamos tener ejemplos de entrada y una salida asociada. Para construirlo, usamos el
80% de los datos morfométricos para el proceso de entrenamiento y 20% para validar el modelo. El
modelo construido dio buenos resultados, por lo que se decidió crear una aplicación móvil que
permitiera utilizarlo en campo y así determinar el sexo de los individuos sin la necesidad de
pruebas genéticas. En la sección "El caso de las AICA marinas" hablaremos de otro ejemplo donde
utilizamos regresión logística.

### Desarrollo de aplicaciones

Algunos de los proyectos de restauración que realizamos en GECI generan una gran cantidad de datos,
los cuales recolectamos para poder evaluar el impacto de nuestras acciones de conservación. La forma
tradicional de capturar los datos en el campo es anotándolos en bitácoras o en formatos especiales
cuando los monitoreos ya están estandarizados. Una vez que regresamos a la oficina transcribimos
estos datos a hojas de Excel las cuales usamos para analizarlos. Esta metodología funciona cuando
los proyectos son pequeños, pero conforme comienzan a crecer esto ya no es sostenible. Otro problema
con esta metodología es que la retroalimentación es lenta. Pasa mucho tiempo desde que recolectamos
los datos hasta que generamos gráficas, mapas o análisis estadísticos. Esto quiere decir que los
datos que recolectamos en las islas no nos permiten tomar decisiones cuando aún estamos allá.
Recientemente, en el equipo de Ciencia de Datos hemos empezado a orientar esfuerzos para generar
herramientas que ayuden a la validación y visualización de los datos para que se puedan utilizar
directamente en el campo. Nuestros primeros intentos han sido con aplicaciones web. Estas tienen la
ventaja de que se pueden utilizar sin la necesidad de instalar aplicaciones adicionales, sólo es
necesario tener un navegador y acceso a internet (aunque ahora ya se pueden utilizar sin acceso
continuo). A continuación, describimos una aplicación que en el equipo consideramos un éxito. Esta
aplicación ya se está utilizando en campo y ha comenzado a facilitar la captura y visualización de
los datos.

#### Mapa de la posición y estado de trampas cepo en Isla Guadalupe

En Isla Guadalupe estamos llevando a cabo una de las erradicaciones de gato feral más grandes que se
han realizado en el mundo. En este proyecto generamos una gran cantidad de datos provenientes de
diversas fuentes, por ejemplo, posición de las trampas, morfometría de los gatos, recorridos con
perros rastreadores, entre otros. En un inicio seguíamos la metodología tradicional para la toma de
datos mencionada anteriormente: se capturaban los datos en hojas de Excel y se mandaban a la oficina
para procesarlos y obtener diferentes resultados. Algunos de estos resultados son mapas de
trayectorias de los gatos o posición de las trampas que se utilizan para atrapar a los gatos, así
como la probabilidad de éxito de la erradicación en las diferentes zonas de la isla. Como
mencionamos anteriormente, haciendo esto la retroalimentación es muy lenta y no tenemos una forma
sencilla de validar los datos. Para intentar solucionar estos problemas, como primer paso,
desarrollamos un sistema para el control y monitoreo de las trampas en la isla. Con esta aplicación
podemos cargar los datos diarios y así verificar que el estado de las trampas sea el reportado en
las bitácoras. Con este sistema es más fácil ver las capturas diarias y la cantidad de trampas
activas. En próximas versiones, esperamos ir agregando herramientas que les permitan planificar más
fácilmente el trabajo en campo. Por ejemplo, que sobre el mapa se puedan trazar trayectorias que
seguirán con los perros y descargarlas a los GPS, esto les ayudaría para hacer transectos con base
en los datos de capturas diarias.

Decidimos que el sistema fuera una aplicación web porque queremos usarla en cualquier lugar, el
problema con esto es que en la isla no hay internet. Para solucionar este problema la aplicación
tiene integrado un pequeño servidor que utiliza para servir los archivos de forma local.

Una aplicación web está constituida por dos partes: el _back-end_ y el _front-end_. La primera se
refiere a la parte que está en el servidor, esta se encarga de comunicarse con la base de datos y
atender las peticiones hechas por el cliente. La segunda es la interfaz que utiliza el cliente para
comunicarse con el servidor.

El _back-end_ de la aplicación se desarrolló en Go (_Golang_). Este lenguaje tiene la ventaja de que
una vez que se compila los programas no necesitan dependencias externas. Para guardar los datos
escogimos utilizar SQLite. Esta base de datos tiene la ventaja de que no ocupa que se instale ningún
gestor de bases de datos. Y para el _front-end_ se utilizó D3.js y jQuery.

En el equipo esperamos que nuestros esfuerzos por desarrollar aplicaciones sirvan para poder tener
una retroalimentación rápida y los datos que recolectamos nos ayuden a tomar decisiones mientras aún
seguimos en el campo.

### DataOps

La metodología que seguimos en el equipo de Ciencia de Datos de GECI se llama _DataOps_. Christopher
Berg y Gil Benghiat fundadores de _DataKitchen_ consideran que para “cocinar” una gráfica necesitas
los ingredientes y las recetas correctas. Ellos  descubrieron que el tiempo y la calidad en el ciclo
del procesamiento de datos puede ser optimizado con una combinación de herramientas y metodologías
que ellos llamaron _DataOps_. _DataOps_ está inspirada en la ingeniería de software y enfatiza la
automatización de procesos [^11]. La automatización de procesos nos permite implementar algoritmos
de aprendizaje automatizado con gran rapidez. Es gracias a la automatización que, los resultados
producidos mediante _DataOps_ siempre son reproducibles. La reproducibilidad de los resultados
facilita la colaboración de todas las y los miembros del equipo en cada etapa del análisis de los
datos: desde la curación inicial de los datos hasta la redacción del reporte técnico final. Además,
la reproducibilidad de los resultados también facilita a terceras personas auditar nuestros
análisis.

## Matemáticas

Puesto que en GECI nuestro principal objetivo de trabajo es propiciar la recuperación de poblaciones
de especies insulares y prevenir su extinción, el equipo de Ciencia de Datos genera modelos
matemáticos que nos permiten —a través de la simplificación de las interacciones ecológicas—
explicar y predecir los comportamientos de las poblaciones biológicas de nuestro interés. Además,
utilizamos métodos estadísticos para evaluar nuestros modelos y sus predicciones. Estos métodos
estadísticos se pueden clasificar en dos categorías: métodos frecuentistas y bayesianos. Los métodos
frecuentistas son aquellos que solemos aprender durante nuestra formación profesional. Una
diferencia entre los métodos tradicionales y los bayesianos es la forma en que cada uno responde a
las preguntas. Los métodos frecuentistas se apoyan del hecho de que la hipótesis se cumple y nos
permiten conocer la probabilidad de reproducir y explicar los datos. Por otra parte, los métodos
bayesianos utilizan la naturaleza de los datos para calcular la probabilidad de comprobar una
hipótesis.

Nosotros utilizamos métodos frecuentistas cuando estamos interesados en cuantificar los cambios en
el comportamiento del ecosistema con el que estamos trabajando. Por ejemplo, una vez que concluyó un
proyecto de manejo de borrego (especie exótica) en Isla Socorro (parte del Parque Nacional
Archipiélago Revillagigedo, Patrimonio Natural de la Humanidad por la UNESCO), observamos un efecto
positivo en la vegetación de la isla —ya que aumentó su cobertura—, y lo confirmamos utilizando
estadística frecuentista. Por otra parte, cuando estamos interesados en evaluar las predicciones de
nuestro modelo, utilizamos los datos colectados y métodos bayesianos. Hay investigadoras e
investigadores que consideran que los métodos bayesianos están revolucionando la ecología.

### Métodos bayesianos

Entre los proyectos que desarrollamos en GECI, un aspecto crucial es estimar el tamaño de
poblaciones biológicas. Por ejemplo, para considerar terminado un proyecto de remoción de alguna
especie invasora, una convención internacional establece, de manera empírica, monitorear la isla
durante dos años para confirmar la ausencia de individuos de la especie objetivo. Si durante ese
tiempo no encontramos evidencias de su presencia en la isla, entonces podemos considerar que hemos
concluido el proyecto exitosamente. Sin embargo, no hay manera de evaluar si el esfuerzo que
realizamos es el necesario para concluir la fase de confirmación de ausencia de la especie invasora.
Podríamos estar monitoreando la isla de manera inadecuada, por ejemplo, con poca gente o con pocas
cámaras. Ante dicha situación, los métodos bayesianos proporcionan una alternativa para evaluar la
probabilidad de que la ausencia de la especie exótica es verdadera.

La estadística bayesiana utiliza cuatro fuentes de información: los datos, el modelo, la información
conocida antes de utilizar los datos (prior) y la información conocida después de utilizar los datos
(posterior). En el proyecto de erradicación de gato feral en Isla Guadalupe los datos consisten en
el número de trampas colocadas y los gatos retirados. El modelo que utilizamos es el propuesto por
el investigador David Ramsey perteneciente al Instituto Arthur Rylah de investigaciones ambientales
en Australia. Nuestra información a priori es que cualquier tamaño inicial de la población es
igualmente probable. Mientras el proyecto avanza, actualizamos los parámetros de nuestro modelo a
partir de los datos recolectados, obteniendo el tamaño más probable de la población (posterior).

Otro de los parámetros del modelo relaciona la probabilidad de detectar un gato con el esfuerzo
hecho para encontrarlo. Así podremos saber cuántas trampas necesitamos para hallar algún individuo
remanente. También utilizamos esta probabilidad para dirigir mejor nuestros esfuerzos, ya sea para
cambiar la zona de búsqueda o para tener un mayor esfuerzo en aquellas que lo requieran.

### Los modelos y las suposiciones

Cuando hacemos simplificaciones, la primera aproximación es suponer que los datos siguen una
distribución normal, en la que la mayor parte de los datos se acumula cerca del promedio. La
interpretación gráfica de este modelo es un histograma de datos con forma de campana. Pero, a veces,
en nuestro trabajo cotidiano como científicas y científicos de datos, después de hacer la primera
exploración de ciertos datos descubrimos que estos no cumplen con la suposición de normalidad.
Cuando los datos no son “normales”, tenemos que utilizar modelos distintos apoyándonos en el
conocimiento de nuestros compañeros y compañeras expertas en conservación. Como se mencionó más
arriba, en varios de los proyectos de GECI estamos interesados en evaluar la población de especies
en las islas. La cuestión es que el tamaño de la población de algunas especies de aves es difícil de
estimar mediante conteo directo. Este es el caso de la pardela de Revillagigedo, el ave marina más
rara y en mayor peligro de extinción de México.

Para monitorear el tamaño de la población de pardela en las islas del Archipiélago de Revillagigedo,
utilizamos la tasa de vocalización o número de cantos de aves durante un tiempo determinado. Sin
embargo, la tasa de vocalización es un ejemplo de datos que no sigue una distribución normal. El
número de cantos es una variable discreta (podemos tener una vocalización, dos vocalizaciones o tres
vocalizaciones, pero no 2.6 vocalizaciones), así que utilizar un modelo continuo (como la
distribución normal) no es lo más adecuado. Ante esta situación, los modelos jerárquicos nos
proporcionan una alternativa puesto que analizan por partes a un sistema.

Los modelos jerárquicos son muy adecuados para describir procesos con escalas múltiples. Por
ejemplo, en el caso de la pardela de Revillagigedo, consideramos que el número de pardelas no es el
mismo en toda la isla (primera escala) y que el número de cantos es proporcional al número de
pardelas (segunda escala). Para considerar esta relación, el nivel más alto de nuestro modelo
jerárquico considera que el número de pardelas sigue una distribución log-normal y que el número de
cantos sigue una distribución de Poisson. De esta manera, tomamos en cuenta la variación dentro de
la isla y la naturaleza de los datos que medimos para definir cuál modelo proponer. En ninguna de
las dos partes de este modelo jerárquico consideramos una distribución normal.

## El caso de las AICA marinas

El programa de Áreas de Importancia para la Conservación de las Aves (AICA) fue propuesto por
_BirdLife International_ con el propósito de identificar y documentar las regiones geográficas que
son críticas para la conservación de las aves y así facilitar la gestión de políticas para su
protección. Las AICA son sitios clave lo suficientemente pequeños para ser conservados que albergan
especies amenazadas globalmente, de distribución restringida o con cantidades excepcionales de
especies migratorias o congregatorias. El primer paso para definir un AICA es identificar las áreas
clave para las aves durante su reproducción o alimentación. Las zonas de alimentación de las aves
tienen ciertas características muy particulares. Estas están determinadas por la biología de la
especie y su preferencia de alimentación. Algunas prefieren aguas costeras y otras prefieren aguas
oceánicas, algunas prefieren aguas cálidas y otras aguas frías.

En nuestro caso nos interesa definir las AICA para las aves marinas que anidan en las islas de
México. Para identificar las áreas clave del albatros de Laysan y la pardela mexicana en el mar,
utilizamos datos de seguimiento remoto y modelos de hábitat. El seguimiento remoto consiste en
colocar dispositivos GPS a algunos individuos adultos durante su temporada de reproducción.
Estimamos la densidad kernel de sus trayectorias para encontrar el contorno de mayor densidad que
contiene la mitad de los datos de su localización. Estos contornos son las regiones geográficas que
prefieren los individuos y suponemos que tienen las características representativas de su hábitat
idóneo. Haciendo una simplificación del hábitat de las aves marinas, podemos construir un modelo que
describa cuál es el hábitat preferido para estas especies. Los modelos de hábitat se construyen a
partir de diversas capas de datos. En particular, nuestro modelo relaciona los datos de la
localización de los individuos con los datos de variables oceanográficas relacionadas a la presencia
de aves marinas, tales como batimetría, temperatura superficial del mar y concentración de
clorofila.

Al igual que el modelo de predicción de sexo para albatros, este modelo es logístico. Una vez que
obtuvimos el modelo encontramos las áreas que tienen características similares a las de las zonas de
alimentación determinadas con los datos de sus trayectorias. Este modelo es predictivo, por lo que
nos puede decir cuáles áreas cumplen con las características de una zona de alimentación para años
donde no tenemos datos de trayectorias y por lo tanto no podemos conocer las regiones utilizadas esa
temporada. Las áreas predichas por este modelo son insumos para definir las áreas clave para los
albatros y pardelas.

En la fase final para identificar las AICA, expertos en aves marinas usan estos insumos y otra
información adicional (tamaño de las colonias, radios de forrajeo) para delimitar y describir las
AICA que serán propuestas a _BirdLife International_ para su validación.

## Conclusión

En GECI utilizamos la Ciencia de Datos para diseñar y evaluar nuestra intervención en las islas de
México. Esto nos ayuda a enfocar nuestros esfuerzos y así optimizar los recursos que tenemos para la
restauración y conservación de la biodiversidad insular.

Usando la Ciencia de Datos analizamos los datos biológicos en conjunto con los datos ambientales.
Incorporar el conocimiento oceanográfico y meteorológico al análisis los datos nos permiten
responder preguntas ecológicas importantes. Un ejemplo de lo anterior es saber cuáles factores
ambientales determinan una disminución abrupta en la tasa de reproducción de aves marinas.

Los avances en la ingeniería en computación y la disminución de costos asociados al poder de cómputo
nos permiten resolver problemas que antes eran prohibitivos. Inspirados en el desarrollo de
software, usamos _DataOps_ para maximizar la reproducibilidad, automatización y colaboración en el
análisis de datos y producción de resultados. Utilizamos algoritmos de aprendizaje automatizado
(_machine learning_) para resolver problemas que no tienen una solución analítica sencilla. Hacemos
simulaciones computacionales para predecir estados futuros de una población o de un ecosistema.
Ejemplos de estas predicciones son las que hemos realizado para albatros y pardela mediante la
implementación de modelos de hábitat que desarrollamos considerando una gran cantidad de variables.

Los modelos matemáticos nos permiten explicar el comportamiento ecológico interpretando los datos
registrados en el campo. También predecimos los resultados que tendrán nuestras acciones a partir
del conocimiento adquirido y la manipulación de los modelos matemáticos. El sustento matemático nos
trae certidumbre en nuestro trabajo de restauración en las islas. Además, las matemáticas nos
permiten considerar como objeto de estudio a cada método de análisis de datos.

La Ciencia de Datos combina el conocimiento ambiental, computacional y matemático para optimizar los
escasos recursos disponibles la restauración de las islas de México con base en el conocimiento y
experiencia que GECI ha generado por más de 20 años.

## Referencias

[^1]: [50 years of Data Science](https://courses.csail.mit.edu/18.337/2015/docs/50YearsDataScience.pdf)
[^2]: [El Niño and Southern Oscillation (ENSO): A Review](http://www.cgd.ucar.edu/staff/cdeser/docs/wang.enso_review.springer_sci_pub16.pdf)
[^3]: [El Niño and Biodiversity](https://www.researchgate.net/publication/216791434_El_Nino_and_Biodiversity)
[^4]: [A review of bird responses to El Niño-Southern Oscillation conditions in the Neotropics](http://www.neotropicalbirdclub.org/wp-content/uploads/2016/02/Cotinga-13-2000-83-88.pdf)
[^5]: [Etymology of the name "Santa Ana winds", as revealed in the archives of the Los Angeles Times newspaper.](http://people.atmos.ucla.edu/fovell/LATimes_SantaAna.html)
[^6]: [The Santa Ana Winds of California](https://journals.ametsoc.org/ei/article/7/8/1/676/The-Santa-Ana-Winds-of-California)
[^7]: [What Are the Santa Ana Winds?](https://www.mentalfloss.com/article/56873/what-are-santa-ana-winds)
[^8]: [Santa Ana Winds: A Descriptive Climatology](https://journals.ametsoc.org/waf/article/34/2/257/107119/Santa-Ana-Winds-A-Descriptive-Climatology)
[^9]: [Mortandad de pollos de albatros de Laysan relacionada con vientos Santa Ana](https://www.leonetwork.org/en/posts/show/4932A444-6104-4894-AC7A-078C8909E4C9)
[^10]: [The Blob](https://www.nps.gov/articles/theblob.htm)
[^11]: [Christopher Berg, Gil Benghiat, and Eran Strod. 2019. The DataOps Cookbook](https://datakitchen.io/content/DataKitchen_dataops_cookbook.pdf)
