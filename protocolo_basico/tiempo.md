---
layout: page
title: Fecha y hora
description: Formato para guardar fechas y horas
---

Guarda las fechas y horas en Excel en formato de _texto_, no con formato de fecha ni de hora. De lo
contrario, Excel guardará internamente las fechas como entero y las horas como fracciones. Y cuando
importemos los datos no obtendremos lo mismo que tú viste al momento de guardar el archivo.

En Excel:

- Selecciona las celdas con fechas u horas
- Haz clic con el botón derecho
- Selecciona "Formato de Celdas..."
- Selecciona "Texto"

Guarda la fecha en una columna y la hora en otra columna distinta.  El formato para guardar fechas
es el siguiente:

- Formato "`dd/Mmm/yyyy`", donde `dd` es el día con dos dígitos, `Mmm` son las tres primeras letras
  del mes en español y `yyyy` es el año con cuatro dígitos. Por ejemplo, "`31/Ene/2021`". En este
  caso la fecha es una cadena de exactamente 11 caracteres de longitud.

Para las horas usa el formato "`hh:mm:ss`", por ejemplo, "`18:00:00`". La hora es una cadena de
exactamente 8 caracteres de longitud.

Ejemplo:

_Tabla: Hoja de datos_

**Fecha**   | **Hora** | **Conteo**
------------|----------|-----------
07/Oct/1998 | 13:00:00 | 63
07/Oct/1998 | 13:30:00 | 27
07/Oct/1998 | 14:00:00 | 54


---

&rarr; Siguiente: [Referencias](referencias.html).

&larr; Anterior: [Coordenadas UTM](utm.html).
