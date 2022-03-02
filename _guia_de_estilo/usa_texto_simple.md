---
layout: page
title: Usa texto simple
tagline: Guía de estilo
description: Por qué preferimos los archivos de texto simple
---

Los datos se prefieren en texto simple (csv, json, etc.) sobre los archivos binarios (xls, mat,
etc.) porque:

1. Pueden agregarse los archivos de texto simple en el sistema de control de versiones (Git).
1. Es más fácil transferir archivos de texto simple entre distintos lenguajes de programación. Por
   ejemplo es más fácil exportar e importar un JSON desde MATLAB a R y viceversa que importar un
   `.mat` a R o un `.RData` a MATLAB
1. Puede abrirse un archivo de texto simple en cualquier máquina sin instalar nada (ya tiene
   Notepad). Es universalmente accesible. Para abrir un archivo binario tienes que instalar algún
   programa que no viene incluido en el sistema operativo.
1. Los archivos binarios comúnmente son formatos propietarios que acarrean problemas con las
   licencias que, a su vez, podrían traducirse en costos económicos.
1. Los formatos de texto simple son más estables y puedes confiar en que en el futuro seguirán
   existiendo herramientas gratuitas para trabajar con ellos. Los formatos binarios se convierten en
   obsoletos pronto porque las fuerzas del mercado obligan a los usuarios de software propietario a
   comprar las versiones más nuevas.
1. Los _queries_ que filtran datos sin modificar podrán ser una petición aceptable dentro del cuerpo
   del programa, es decir, subconjuntos de datos. Aquellos _queries_ que modifiquen la estructura de
   la tabla, que usan agrupaciones u operaciones, no serán permitidos.
