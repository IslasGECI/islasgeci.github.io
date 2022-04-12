---
layout: page
title: Documentación
tagline: Guía de estilo
description: Cómo escribir la ayuda para el usuario de nuestras funciones
---

La reutilización de los programas y funciones depende de su documentación. Si el código está bien documentado, será fácil usarlo nuevamente. De lo contrario, el programa será inútil en el futuro. Aquí propongo el contenido mínimo en el texto de ayuda de funciones escritas en R.

## R

Para documentar funciones en R usamos el paquete `Roxygen`.

### Cabecera
En R, la primera línea del texto es identificada automáticamente por `Roxygen` como el título de la función, que es una breve descripción de la misma, por lo tanto no es necesario indicarlo con el _tag_ `@title`. El nombre de la función se establece al definirla en el código al final de la documentación (no es necesario mencionarla en la documentación).

```
#' Suma dos números.
```

### Descripción
La documentación en `Roxygen` reconoce automáticamente la segunda línea de comentarios como la sección donde se describe detalladamente a la función por lo que de nuevo no es necesario utilizar un _tag_ (`@description`).

```
#' Suma dos números usando la suma de los números reales. Esta suma,
#' junto con los números reales, cumplen con los cuatro axiomas de
#' grupo: cerradura, asociatividad, existencia de elemento neutro y
#' existencia de elementos inversos. Además, la suma es conmutativa,
#' por lo que los reales con esta suma son un grupo abeliano.
```

### Autores
Debido a que en la documentación de `Roxygen` los _tags_ comienzan con `@`, si se quiere agregar un `@` en el texto es necesario escribirlo dos veces: `@@`.

```
#' @author Evaristo Rojas <evaristo.rojas@@islas.org.mx>
```

### Referencias

```
#' @references
#'  \href{http://es.wikipedia.org/wiki/Suma}{Suma}
```

### Sintaxis

```
#'  @usage c <- add(a,b)
#'
#'  # Suma a mas b.
```

### Entrada

```
#' @param a(numeric) Número real que será sumado.
#' @param b(numeric) Número real que será sumado.
```

### Salida

```
#' @return c(numeric) Total de la suma.
```

### Ejemplos

```
#' @examples
#'  c <- add(2,3)
#'  # Devuelve c = 5
```

### See also

```
#' @seealso \code{\link[base]{sum}}, \code{\link[base]{cumsum}}
```

### Ayuda

```
?add
```
`add{base}`

**Suma dos números.**

**Descripción:**

Suma dos números usando la suma de los números reales. Esta suma,
junto con los números reales, cumplen con los cuatro axiomas de
grupo: cerradura, asociatividad, existencia de elemento neutro y
existencia de elementos inversos. Además, la suma es conmutativa, por
lo que los reales con esta suma son un grupo abeliano.

**Usage**

`c <- add(a,b)`

`# Suma a mas b.`

**Arguments**

`a(numeric)` Número real que será sumado.

`b(numeric)` Número real que será sumado.

**Value**

`c(numeric)` Total de la suma.

**Author(s)**

Evaristo Rojas <evaristo.rojas@islas.org.mx>

**References**

[Suma](http://es.wikipedia.org/wiki/Suma)

**See Also**

`sum`, `cumsum`

**Examples**

```
c <- add(2,3)
# Devuelve c = 5
```
