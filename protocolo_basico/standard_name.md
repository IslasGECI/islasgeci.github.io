---
layout: page
title: Nombre estándar
description: Metadato `standard_name`
---

Los posibles valores para el metadato `standard_name` se encuentran en [CF standard name
table](http://cfconventions.org/Data/cf-standard-names/current/build/cf-standard-name-table.html).
La convención CF está enfocada a variables climáticas. Para variables biológicas todavía hace falta
implementar algunos nombres estándar. En la siguiente tabla se muestran los nombres estándar
reconocidos por este protocolo.

_Tabla: Nombres estándar reconocidos por este protocolo._

Standard Name             | Long Name       | Nombre Largo         | Descripción
--------------------------|-----------------|----------------------|--------------------------------------------------------------------
`air_temperature`         | Air temperature | Temperatura del aire | Grado o nivel termico del ambiente
`altitude`                | Altitude        | Altitud              | Altitud sobre el geoide, la cual es la referencia de la superficie geopotencial
`date`                    | Date            | Fecha                | La fecha de avistamiento, registro o captura del individuo
`distance`                | Distance        | Distancia            | La distancia a la que se encontraba el individuo
`effort`                  | Effort          | Esfuerzo             | Cantidad de recursos necesarios para lograr una labor, por ejemplo: capturar un individuo
`height`                  | Height          | Elevación            | Distancia vertical sobre la superficie
`latitude`                | Latitude        | Latitud              | La latitud es positiva hacia el norte
`longitude`               | Longitude       | Longitud             | La longitud es positiva hacia el este
`mass`                    | Mass            | Masa                 | Cantidad de masa del individuo dada en gramos o kilogramos
`number_of_captures`      | Captures        | Capturas             | Cantidad de individuos capturados en trampas
`projection_x_coordinate` | Easting         | Coordenada Este      | Componente vectorial a lo largo del eje x de la cuadrícula, es positiva al incrementar la x
`projection_y_coordinate` | Northing        | Coordenada Norte     | Componente vectorial a lo largo del eje y, es positiva al incrementar la y
`time`                    | Time            | Tiempo               | &nbsp;
`utm_zone`                | UTM zone        | Zona UTM             | Una de las 60 zonas de proyección longitudinal

Para incluir nuevos nombres estándar que no sean parte de la convención CF se debe utilizar la
[_guía de construccción de nombres
estándar_](http://cfconventions.org/Data/cf-standard-names/docs/guidelines.html) de la convención
CF y el equipo de Ciencia de Datos deberá agregarlos a `metadata_tools/metadatatools/_StandardName.py`.

---

&rarr; Siguiente: [Unidades](units.html).

&larr; Anterior: [Metadatos](metadatos.html).
