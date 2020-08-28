---
layout: post
title: "Algoritmo de clasificación k-means"
author: Efren
tags: mate programacion
---

k-means es uno de los algoritmos de _machine learning_ más populares. Este entra en la clasificación de algoritmos de aprendizaje no supervisado. Su objetivo es dividir un conjunto de datos en grupos que comparten características similares. Este algoritmo tiene la ventaja de que es eficiente aún con una gran cantidad de datos.

Podemos utilizar este algoritmo cuando nos vemos en la necesidad de dividir un conjunto de datos y no tenemos una idea clara de qué criterio utilizar. Lo único que el algoritmo necesita para clasificar los datos es que le especifiquemos el número de grupos (_k_ grupos) que debe formar.

Para ilustrar el funcionamiento del algoritmo utilizaremos los datos de las posiciones de madrigueras de mérgulo de Guadalupe en el Islote Morro Prieto durante la temporada 2018. Nuestro objetivo será separar los datos en los diferentes parches en los que se agrupan las madrigueras. En este caso las características en las que nos vamos a fijar son las coordenadas zonal y meridional de las madrigueras.

![Datos crudos](http://intranet.islas.org.mx/img/noticias/kmeans_raw_data.png)

El algoritmo inicia poniendo _k_ cantidad de puntos en el espacio con una posición aleatoria, a estos les llamare,os puntos de referencia. Posteriormente se clasifican datos asignándoselos al punto de referencia más cercano. Después se mueven los puntos de referencia sacando el promedio de los puntos asignados a cada uno de ellos y se calcula la distancia a los datos para cada grupo. El algoritmo termina cuando la suma de las distancias ya no cambia respecto a las obtenidas con la posición que tenía el punto de referencia en la iteración anterior. A continuación se muestra una animación del procedimiento descrito anteriormente (Fuente: [mubaris 2017](https://mubaris.com/posts/kmeans-clustering/)).

![Animación K means](https://i.imgur.com/k4XcapI.gif)

Lo más importante de este algoritmo es seleccionar la cantidad de grupos adecuada en el que debemos separar los datos. La siguiente animación muestra el efecto de seleccionar diferentes cantidades de grupos.

![Animación K means](http://intranet.islas.org.mx/img/noticias/kmenas_k_effect.gif)

Una forma de determinar cuántos grupos formar es utilizar la inercia. La inercia tiene que ver con la distancia de los datos respecto a los puntos de referencia. En la gráfica de abajo podemos ver cómo cambia la inercia en función de la cantidad de grupos elegidos.

![Inercia vs cantidad de datos](http://intranet.islas.org.mx/img/noticias/k_selection_criteria.png)

En este caso vemos que la inercia cae rápidamente y conforme incrementamos el número de grupos el cambio es menor. Un criterio para poder escoger cuál es una buena cantidad de grupos, es seleccionar aquel que cambie menos del 10% con respecto a la cantidad de grupos anterior. En este caso lo mejor sería escoger 5 grupos.

### Implementación en _Python_

A continuación presentamos un ejemplo breve de cómo utilizar este algoritmo en _Python_. Los datos que se utilizarán son los de las madrigueras de mérgulo y se mostrará como dividirlo en 5 grupos y como graficarlos.

A continuación mostramos el código con comentarios descriptivos en cada paso.

```python
# Librería para graficar
import matpltolib.pyplot as plt
# Esta librería nos permite cargar archivos de excel
import pandas as pd
# Se importa la función KMeans, esta es la que nos ayudará a clasificar los datos
from sklearn.cluster import KMeans

# Aquí se cargan los datos
datos_madrigueras = pd.read_excel("madrigueras_mergulo_2018.xlsx")

# Se clasifican los puntos
clasificador = KMeans(n_clusters=5).fit(datos_madrigueras)

# Se grafican los datos y se muestra la grafica
plt.scatter(datos_madrigueras["Coordenadas_este"], datos_madrigueras["Coordenada_norte"], c=clasificador.labels_)
plt.show()
```

Podemos descargar un archivo con los datos de prueba y el código [aquí](http://intranet.islas.org.mx/data/noticias/ejemplo_kmeans.zip). Más abajo mostramos la imagen resultante.

![Ejemplo grafica python](http://intranet.islas.org.mx/img/noticias/k_example_clasification.png)

## Conclusión

Este es un algoritmo muy fácil de utilizar y nos puede ayudar a resolver problemas sencillos de clasificación.
