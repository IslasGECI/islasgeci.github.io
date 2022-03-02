---
layout: page
title: Estructura de los directorios
tagline: Guía de estilo
description: Cuáles son los archivos y carpetas en nuestros repositorios
---

En esta página definimos la estructura requerida en los repositorios clase 3. Todavía no tenemos una
guía para los repositorios clase 1 o de otra clase.

La estructura que aquí describimos está inspirada en [Cookiecutter Data
Science](https://drivendata.github.io/cookiecutter-data-science/#directory-structure). Antes de
modificar nuestra guía primero debemos consultar aquella para intentar no contradecirla.

```
├── Dockerfile         <- Requerido para construir la imagen del repo mediante
│                         `docker build`
├── Makefile           <- Instrucciones para crear reportes o resultados mediante Make
├── README.md          <- Contiene una lista ordenada de los resultados esperados del
│                         proyecto y es la única fuente que indica el trabajo requerido
├── analyses.json      <- Describe las relaciones entre los archivos (datos, reportes,
│                         resultados, scripts, etc.) de cada análisis
├── bitbucket-pipelines.yml  <- Archivo de configuración del Pipeline en Bitbucket
├── data/
│   ├── external/      <- Datos de terceros
│   ├── processed/     <- Datos procesados para que tengan la forma requerida por los
│   │                     módulo y paquetes para análisis estadísticos y modelación.
│   │                     También resultados parciales que no se incluyen directamente en
│   │                     el reporte como archivos KML y SHP.
│   └── raw/           <- Los datos crudos originales e inmutables de GECI
│
├── docs/              <- Documentación para los analistas
├── notebooks/         <- Notebooks de Jupyter
├── references/        <- Artículos, libros y notas que son relevantes para el proyecto y
│   │                     para los resultados que estamos produciendo. Aquí se encuentran
│   │                     los artículos que se citan en los reportes que producimos
│   ├── references.bib <- Archivo de referecias para LaTeX en formato BibTeX
│   └── references.md  <- Lista de referencias con una descripción e hipervínculos en
│                         Markdown
│
├── renv.lock          <- Registro de los paquetes instalados en R y sus versiones. Este
│                         archivo es generado con el paquete `renv` y es equivalente al
│                         archivo `requirements.txt` generado con `pip freeze`
├── reports/           <- Reportes y presentaciones dirigidos al director de proyecto
│   │                     correspondiente. Los formatos preferidos para el código fuente de
│   │                     los reportes son LaTeX y Markdown. Se prefieren formatos de texto
│   │                     plano para poder implementar control de versiones. El reporte se
│   │                     entrega en formato PDF o, si el Director lo requiere, se usa
│   │                     Pandoc para transformar a Word.
│   ├── figures/       <- Figuras incluidas en los reportes de los análisis realizados
│   ├── non-tabular/   <- Resultados incluidos en los reportes de los análisis realizados
│   └── tables/        <- Tablas incluidas en los reportes de los análisis realizados
│
├── requirements.txt   <- Enlista los requerimientos para obtener el entorno para realizar
│                         el análisis, por ejemplo puede ser generado con:
│                         `pip freeze > requirements.txt`
├── src/               <- Scripts que se usarán en este proyecto
└── tests/             <- Pruebas que verifican la repoducibilidad de los resultados
```

## `Makefile`

El archivo `Makefile` consta de 3 secciones: 

1. Definición del _phony_ **all**: enlista todos los objetivos (_targets_) principales (reportes,
   presentaciones, etc.) que se encuentran en el `analyses.json`.
1. Variables y reglas por resultado: Las siguientes subsecciones se agregan y agrupan en bloques
   para cada resultado.
    1. Declaración de las variables.
    1. Reglas para construir los objetivos principales (enlistados en **all**).
    1. Reglas para construir las dependencias de los objetivos principales.
    1. Reglas _phonies_ para construir dependencias de los objetivos principales.
1. Reglas del resto de los _phonies_ para uso general.

**Referencias:**

- [Nomenclatura](nomenclatura.html)
- [Ejemplo de
  Makefile](https://bitbucket.org/IslasGECI/analisis/src/default/referencias/ejemplo-makefile).

## `README.md`
Ver la sección
[`README.md`](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-readmemd)
anterior.

## Datos
Ver la sección [Obtención de
Datos](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-obtencion-de-datos).

## Programas
Todos los scripts van en el directorio de `src/`. Opcionalmente puedes guardar en `src/R` el código
de R.

Los programas usan las
[funciones](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-funciones)
para generar los
[resultados](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-resultados)
que se guardan en la carpeta `resultados/`.

## Resultados
Ver la sección [Producción de
resultados](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-produccion-de-resultados).

## Entrega
Ver la sección [Redacción de
reporte](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-redaccion-de-reporte).

## Funciones
Cada una de las funciones creadas para generar los resultados se guarda en un archivo aparte. El
nombre del archivo y el nombre de la función debe ser el mismo. Los nombres de las funciones y de
las variables dentro de las funciones deben seguir la [guía para
nomenclatura](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-nomenclatura).

Las funciones de R se guardan en `R/`, mientras que las funciones de MATLAB se guardan en
`MATLAB/funciones/`.

Todas las funciones deben ser documentadas siguiendo la [guía para
documentación](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-documentacion).
La documentación de las funciones de R se escribe en formato Roxygen.

Cada función, cuando es posible, recibe como primer argumento entrada y devuelve como primer
argumento de salida una tabla que pasa la prueba `checkTable`.

## Clases
Las clases de MATLAB se guardan en `MATLAB/clases/`.

## Demostraciones
Ver la sección [Creación de Pruebas y
Demostraciones](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-creacion-de-pruebas-y-demostraciones).

## Pruebas
Ver la sección [Creación de Pruebas y
Demostraciones](https://bitbucket.org/IslasGECI/analisis/src/default/README.md#markdown-header-creacion-de-pruebas-y-demostraciones).

## Referencias
La carpeta `referencias/` contiene artículos, libros y notas que son relevantes para el proyecto en
general y, en particular, para los resultados que estamos produciendo. Aquí se encuentran los
artículos que se citan en los reportes y presentaciones que se encuentran en `entrega/`.
