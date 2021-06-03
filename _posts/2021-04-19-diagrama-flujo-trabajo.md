---
layout: post
title: Diagrama para flujo de trabajo
author: Xavier
tags: equipo
---
![image](https://user-images.githubusercontent.com/9456708/117341297-ca563580-ae56-11eb-886c-eec3c0a2adce.png)

## Introducción
Nuestro flujo de trabajo esta basado en gitflow. En lugar de tener una unica rama `main`, en este flujo de trabajo usamos dos ramas principales para dejar constancia de la historia del proyecto. La rama `main` guardala historia de los releases oficiales y la rama `develop` sirve para para ir integrando las nuevas caracteristicas.

Ademas tenemos ramas temporales (feature, release y hotfix).


## Revisión en el entorno Local
Las ramas temporales `features` las revisamos en un entorno local.

## Revisión en el entorno Interno
Al aceptar una rama `feature` llega a `develop` y desplegaremos el resultado en el entorno interno, es decir nuestro servidor [islasgeci.org](http://islasgeci.org/)

## Lanzamiento al público
Cada vez que lleguen consignaciones a la rama `main`, las podremos ver en el servidor externo.

## Conclusión
