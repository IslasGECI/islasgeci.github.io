---
layout: page
title: Control de versiones
tagline: Guía de estilo
description: Cómo y qué consignar
---

## Mensajes de consignación

La siguiente es una lista de recomendaciones para escribir mensajes de
consignación útiles.

- Indica el número de tarea al inicio del mensaje (e.g. _#999_).
- El mensaje de consignación debe describir _qué_ cambio se hizo y _por qué_.
- El mensaje debe comenzar con un verbo en modo imperativo para describir _qué_ cambio se hizo.
- Describir _por qué_ se hizo el cambio es más importante que describir _qué_ cambio se hizo.
- Cada línea debe ser menor o igual a 80 caracteres.
- La primer línea debe ser una oración completa.
- El resto del mensaje se debe ser un texto formado por párrafos.
- El mensaje puede ser tan extenso como sea necesario para describir la consignación de forma detallada.
- Es más fácil redactar los mensajes cuando se hacen muchas consignaciones con pocos cambios en lugar de pocas consignaciones con muchos cambios.

## Sistemas de Control de Versiones

Git es el único sistema de control de versiones que usamos. Usamos dos hospederos web de nuestros repositorios:

- Bitbucket: para repos clase 3
- GitHub: para repos clase 1

## GitFlow

Usamos GitFlow como lo muestra el diagrama de abajo.

![GitFlow](https://wpdevkvk.files.wordpress.com/2017/03/diagram.png?resize=900%2C506)

Para pasar (_merge_) los cambios de una _feature_ a la rama _develop_, o de un _release_ a la ramas _master_ y _develop_, los cambios deben ser aprobados en revisión por pares mediante un _pull request_. Es preferible que el _merge_ lo haga el revisor quien aprobó el _pull request_ pero también lo puede hacer el autor.

Consideramos _feature_ los cambios que introducen nuevos productos (resultados, contentenido, etc.) y que generalmente incrementan la [deuda técnica](https://en.wikipedia.org/wiki/Technical_debt). Consideramos _release_ los cambios que [refactorizan](https://en.wikipedia.org/wiki/Code_refactoring) código existente (5 archivos, reporte, postentrega, documentacion, pruebas, etc.) y que disminuyen la [deuda técnica](https://en.wikipedia.org/wiki/Technical_debt).

## Contenido
- Sólo se consignaran archivos de texto simple (csv, json, svg, tex, txt, etc.), nunca binarios.
- No se consignarán archivos mayores a 1 MB (> 10 mil líneas de código).
- Se prefieren las imágenes `svg` sobre cualquier formato binario. Excepcionalmente se podrán consignar imágenes binarias si son para una aplicación que depende de las imágenes para funcionar siempre y cuando el lado más grande sea ≤ 256 pixeles
- Las excepciones a las reglas anteriores serán consensuadas.
