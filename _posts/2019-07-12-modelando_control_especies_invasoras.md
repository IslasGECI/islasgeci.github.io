---
layout: post
title: "Modelando el control de especies invasoras"
author: Nepo
tags: ecologia mate
---

En esta entrada mostramos el avance que tenemos en la Dirección de Ciencie de Datos para 
estimar el tamaño de un población a la que intentamos controlar. Para este ejemplo, utilizamos una 
metodología que nos ayudará a evaluar la probabilidad de terminar una erradicación en función del 
esfuerzo. Los valores de los parámetros del modelo los obtuvimos de referencias bibliográficas y 
otros calculados a partir de datos de GECI. 

El modelo del cremiento exponencial de una población considera que los recursos de la población
son ilimitados. Otra simplificación es que la población es cerrada, es decir, no hay inmigración o 
emigración. Como resultado, las tasas de nacimiento y de muerte de una población son constantes. 
Aunque ninguna población puede crecer sin límites por siempre, todas las poblaciones tienen el 
potencial de incrementar exponencialmente. 

Ahora consideramos que los recursos para el crecimiento y la reproducción son limitados. La 
capacidad de carga de un sistema resume varias limitaciones del ambiente como espacio, comida y 
resguardo. Una consecuencia de las limitaciones es que las tasas de nacimiento y de muerte ahora 
dependen del tamaño de la población. Así, la tasa de nacimiento disminuirá si hay menos comida y 
pocos recursos, los cuales son necesarios para la reproducción. También esperamos que la tasa de 
muertes crezca si el alimento es menor. Por lo tanto, la capacidad de carga impone un tope al 
tamaño máximo de la población. 

Para modelar las capturas seguimos la propuesta de Ramsey (2011): el total de capturas depende del 
número total de gatos y de la probabilidad de captura. Si hay muchos gatos en la isla 
capturaremos más gatos. Por lo contrario, si la probabilidad de captura es baja entonces el 
número de los individuos removidos será menor. Además, esta probabilidad depende del esfuerzo de 
captura, si el esfuerzo es mayor la probabilidad crecerá. En los resultados que aquí presentamos 
utilizamos una probabilidad de captura $0.036\leq p\leq 0.096$. Esa probabilidad la obtuvimos
utilizando los datos de erradicación de gatos en Isla Socorro. 

Leo _et al._ (2018) caracterizaron la población de gato feral en Isla Rota usando la siguiente
ecuación: 
$$N_{t+1} = N_t + rN_t\left(1-\frac{N_t}{K} - R_t.$$
Esta ecuación es una forma discreta del modelo de Schaefer donde $N_t$ es la población estimada 
en el tiempo $t$, $r$ es la tasa de crecimiento poblacional (mensual), $K$ es la capacidad de carga
de la isla y $R_t$ es la cantidad de gatos removidos en el intento $t$. Ellos encontraron adecuado  
considerar la capacidad de carga de la isla cercana al tamaño inicial de población (antes de la 
erradación). Otro resultados de su trabajo es el intervalo para la tasa de crecimiento poblacional 
de $0.032 \leq r \leq 0.126.$

Nuestros resultados muestran que solo el 32\% de las ocasiones lograremos terminar con la erradicación. 
Simulamos 100,000 intentos de erradicación con los valores de probabilidad de captura (para 
Socorro) y tasa de crecimiento poblacional (utilizada por Leo _et al._ (2018)) que mencionamos 
arriba. La probabilidad aumenta a 37\% si consideramos el esfuerzo máximo que hicimos el último año
en Isla Socorro.

## Conclusión
Este tipo de metodologías nos permitirán evaluar si la cantidad de esfuerzo para la erradicación es 
la adecuada. Presentamos una combinación de dos metodologías, la de Ramsey para evaluar las
técnicas de captura y la de Leo para considerar los nacimientos y las muertes de la 
población. El siguiente paso es evaluar la tasa de crecimiento poblacional de la especie objetivo.
Para hacer lo anterior, nos apoyaremos en la metodología de Leo. 

## Referencias
Brian T. Leo, James J. Anderson, James Ha, Reese B. Phillips, and Renee R. Ha 
"Modeling Impacts of Hunting on Control of an Insular Feral Cat Population" 
Pacific Science (2018) 72(1), 57-67. 

David S.L. Ramsey, John P. Parkes, David Will, Chad C. Hanson, and Karl J. Campbell
"Quantifying the success of feral cat eradication, San Nicolas Island, California" New Zealand 
Journal of Ecology (2011) 35(2), 163-173.

