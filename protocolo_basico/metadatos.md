---
layout: page
title: Metadatos
description: Cómo agregar metadatos a un archivo de datos en Excel
---
- Los datos y metadatos de un monitoreo se guardan en diferentes hojas de un único archivo de Excel.
- El orden de las hojas es el siguiente:
    1. **Datos:** Pueden ser una o mas hojas dependiendo de cuantos monitoreos se requieran guardar
       en la base de datos.
    2. **Metadatos de columnas:** La primera fila está reservada para el encabezado que contiene los
       nombres de los metadatos, mientras que la primera columna contiene los nombres de las
       variables del monitoreo. La cantidad total de filas corresponde al total de columnas de la
       hoja de datos más uno (Cantidad de variables más el encabezado).
    3. **Metadatos de tablas:** La primera fila está reservada para el encabezado de los metadatos y
       cada una de las demás indica una tabla. Cada columna representa un tipo de metadato de tabla.
    4. **Metadatos del archivo:** Estos metadatos son el nombre del archivo y el de la institución a
       la que pertenecen los datos.

---

Los metadatos nos proporcionan información adicional sobre los datos, por ejemplo: unidades, nombres
en inglés, etcétera.

Aquí hay un ejemplo de una tabla de metadatos.

_Tabla: Ejemplo de la hoja de metadatos de columnas_

**name**     | **type** | **ejemplo** | **description**                    | **nombre_largo** | **long_name** | **standard_name** | **axis** | **units**     |
-------------|----------|-------------|------------------------------------|------------------|---------------|-------------------|----------|---------------|
**latitud**  | number   |   32        | Latitud del punto de conteo        | Latitud          | Latitude      | latitude          | Y        | degree_north  |
**longitud** | number   | -116        | Longitud del punto de conteo       | Longitud         | Longitude     | longitude         | X        | degree_west   |
**conteo**   | integer  |    5        | Cantidad de madrigueras observadas | Madrigueras      | Burrows       | NA                | NA       | NA            |

En el ejemplo anterior, la tabla de datos tiene tres columnas **lat**, **lon** y **conteo**.
([Aquí](resumen.html) puedes ver la tabla de datos correspondiente.) También se aprecia en el
ejemplo anterior que [ninguna celda está vacía](celdas_vacias.html); se indica con "NA" que "_no
aplica_" o que no se cuenta con el valor faltante.

En la hoja de metadatos de columna el primer renglón muestra el nombre de los metadatos y el resto
de los renglones contienen los metadatos de cada columna de datos. La primera columna en la tabla de
metadatos contiene el nombre de las columnas de la tabla de datos.

La información que nos proporcionan los metadatos nos ayudan a visualizar y procesar los datos, por
ejemplo, podríamos transformar unidades de forma automática si incluímos el metadato **units**.
Podríamos convertir de [coordenadas geográficas](geograficas.html) a [coordenadas UTM](utm.html) o
viceversa al incluir los metadatos [**axis**](axis.html) y [**standard_name**](standard_name.html)
correspondientes.


_Tabla: Metadatos reconocidos por este protocolo. La primera columna indica el nombre del metadato;
la segunda columna describe al metadato._

Metadato           | Descripción
-------------------|-------------
`name`             | [Nombre de la columna en la hoja de datos](http://specs.frictionlessdata.io/table-schema/#name)
`axis`             | [Identifica coordenadas o tiempo con las letras `X`, `Y`, `Z` o `T`](axis.html)
`description`      | [Descripción de la columna de datos](http://specs.frictionlessdata.io/table-schema/#description)
`long_name`        | [Nombre descriptivo de la columna en inglés para ser usado como rótulo en los ejes de las gráficas](http://cfconventions.org/cf-conventions/cf-conventions.html#long-name)
`nombre_largo`     | Traducción al español de `long_name`
`standard_name`    | [Nombre estándar de la variable](standard_name.html)
`units`            | [Unidades de los valores de la columna de datos](units.html)

No es necesario que te limites a los metadatos enlistados en la tabla anterior. Puedes agregar
cualquier metadato que te ayude a comunicar la historia detallada detrás de los datos.

---

&rarr; Siguiente: [Nombre estándar](standard_name.html).

&larr; Anterior: [No uses colores en lugar de datos](sin_colores.md).
