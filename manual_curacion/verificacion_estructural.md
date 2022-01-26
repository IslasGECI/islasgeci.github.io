---
layout: page
title: Verificación estructural
description: Manual de curación de datos
---

En este paso verificamos que la estructura de la base de datos cumpla con los lineamientos al no
contener ninguno de los siguientes errores en esta lista de verificación:

_Tabla: Verificaciones estructurales. Estas verificaciones validan que la estructura del archivo es válida_

**check**                | **description**                                                                    |
-------------------------|------------------------------------------------------------------------------------|
**encabezado vacío**     | Hay un encabezado de columna vacío                                                 |
**encabezado duplicado** | Hay múltiples columnas con el mismo nombre. todas las columnas deben de ser únicas |
**fila vacía**           | Las filas deben tener al menos una celda que no esté en blanco                     |
**fila duplicada**       | Las filas no deben de estar duplicadas                                             |
**valor extra**          | Una fila tiene menos columnas que el encabezado                                    |

Fuente:

- [goodtables-py](https://pypi.org/project/goodtables/#Structure_errors)

---

