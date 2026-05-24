---
layout: post
title: "Líneas de trabajo de Ciencia de Datos"
author: Evaristo
tags: equipo
---

En GECI contamos con una Dirección de Análisis Científico donde evaluamos cuantitativamente nuestras intervenciones de conservación sobre las aves marinas y las islas.
En la dirección de Análisis Científico colaboramos oceanólogos, programadores de computadoras y matemáticos (2 mujeres y 3 hombres). Además, el involucramiento de los biólogos en esta dirección es cada vez mayor.
De esta manera, el trabajo de conservación y restauración que GECI realiza tiene sólidas bases científicas, con un rico enfoque interdisciplinario.
En las siguientes secciones se describen de cada uno de los tipos de análisis que realizamos.

- Aprendizaje automatizado
- Bases de datos relacionales
- Bioacústica
- Ciencia ciudadana
- Climatología de variables ambientales
- Desarrollo de aplicaciones
- Diseño de experimentos
- Modelación matemática y análisis estadístico
- Modelos digitales de elevación
- Reproducibilidad y trabajo colaborativo
- Simulación computacional
- Visualizaciones web interactivas

---

## Climatología de variables ambientales

Estudiamos el clima de las islas para entender la dinámica de estos ecosistemas y poder hacer proyecciones hacia el futuro. Los análisis incluyen estudio y descripción de series de tiempo de variables oceanográficas: concentración de clorofila, temperatura superficial del mar, índices de surgencias; y series de tiempo de variables atmosféricas: temperatura ambiental, precipitación y humedad.
Contamos con instrumentación propia incluyendo 11 estaciones meteorológica y 4 sensores de temperatura sub-superficiales. Estos intrumentos nos proveen de información in situ con alta resolución temporal.

Además de usar información meteorológica y oceanográfica medida in situ, incorporamos en nuestros análisis información disponible obtenida mediante sensores remotos y reanálisis con una cobertura global y alta resolución espacial.
Usamos esta información, no solo por la resolución espacial, sino también por la disponibilidad de datos históricos. Algunas de estas bases de datos ofrecen información de hace varias décadas.
Es obvio que evaluar los impactos del cambio climático en los ecosistemas insulares requiere usar bases de datos de periodos mayores a décadas.
Pero también para analizar cuantitativamente nuestras intervenciones de conservación sobre las aves marinas y las islas tenemos que pensar en periodos de, al menos, décadas.
En la gráfica de la tendencia poblacional del albatros de Laysan se observa que la recuperación de esta población en Isla Guadalupe a llevado 30 años y todavía no alcanzamos a ver una forma asintótica en la curva, el crecimiento después de 3 décadas sigue siendo exponencial.
Entonces es en estas escalas temporales en las que tenemos que pensar cuando hablamos de conservación, porque queremos que los frutos de nuestros esfuerzos de conservación trasciendan estas escalas temporales de largo plazo.

## Desarrollo de aplicaciones

Cada análisis lo realizamos basándonos en tres principios: Reproducibilidad, Estandarización y Automatización. Considerar estos principios nos facilita el trabajo colaborativo, la revisión o verificación de resultados, y compartir datos; estos tres puntos tanto dentro de GECI como entre terceros.
Preferimos codificar cada análisis en R, MATLAB, Python o PHP, en lugar de usar software desarrollado por terceros.

## Diseño de experimentos

Usamos el Diseño de Experimentos para formalizar los experimentos o preguntas de investigación asociadas a nuestras acciones de conservación.
Pero también optimizamos la inversión en conservación ya que con estos análisis se valoran las acciones realizadas y se orientan las acciones que siguen.
Por ejemplo, el sencillo cálculo del tamaño mínimo de muestra nos asegura que el esfuerzo de muestreo es suficiente para obtener la precisión deseada sin ser excesivo para economizar así los recursos materiales y humanos.

## Modelación matemática y análisis estadístico

Realizamos un estricto control de calidad en los datos crudos para asegurar que nuestros resultados son confiables, incluyendo análisis exploratorio de datos y estadística descriptiva básica.
Para evaluar nuestras hipótesis sobre los ecosistemas insulares usamos diversas herramientas de la estadística inferencial, como pruebas t, análisis de varianza, modelos lineales generalizados, etc.
Para analizar la variabilidad temporal de las variables biológicas y ambientales utilizamos las herramientas apropiadas para el análisis de las series de tiempo como análisis de frecuencias.

Los modelos matemáticos y análisis estadísticos son particularmente importantes. Para explicar la dinámica de los sistemas ecológicos, estudiar los efectos de las interacciones con las variables ambientales y hacer proyecciones sobre su restauración, diseñamos modelos matemáticos y usamos técnicas estadísticas.
Un ejemplo de modelos matemáticos que desarrollamos es la NERD.
Otro ejemplo es el modelo que construimos mediante regresión logística para usa el dimorfismo sexual no evidente a simple vista para determinar el sexo de los albatros mediante morfometría.

## Modelos digitales de elevación

No solo analizamos la variación temporal de las variables, sino también su distribución espacial.
Generamos mapas para estudiar la distribución espacio-temporal de las variables que intervienen en la ecología insular, en particular mapas de distribución de especies y densidad de nidos y madrigueras de aves marinas.
Asimismo, llevamos a cabo estimaciones de densidades kernel de trayectorias de aves marinas obtenidas mediante GPS y GLS.

## Simulación computacional

La simulación computacional completa la cuadratura de nuestros métodos. Monitoreos en el campo, análisis de laboratorio, modelación matemática y, por úiltimo, la simulación computacional son las cuatro grandes herramientas que usamos en el análisis científico.
Así aprovechamos el poder de cómputo disponible para resolver, mediante diversos métodos numéricos, problemas ecológicos complejos representados por ecuaciones matemáticas que no tienen solución analítica.
Aquí les presento una animación de los resultados de nuestra modelación de impactos en las islas por escenarios de incremento del nivel del mar asociados a cambio climático. Usamos la relación especies-área para evaluar el impacto sobre especies en las islas de México como consecuencia del cambio climático.
