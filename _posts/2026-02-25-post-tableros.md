---
layout: post
title: "Comparación entre distintos tableros de visualización"
author: David Rodríguez
tags: visualizacion
---

Los tableros de visualización resumen la información clave de un proyecto.
Múltiples plataformas permiten crear estos recursos.
Grafana, Metabase y Redash dominan el mercado actual.
En este articulo compararemos estas tres opciones considerando:
- Código abierto
- Se pueda alimentar el tablero por medio de una API (Data Resources)
- Sea una GUI delgada

## Grafana
Grafana facilita la creación de tableros de visualización.
Estos elementos integran los paneles de la plataforma.
El catálogo de visualizaciones crece constantemente.
Las opciones abarcan gráficos de series temporales, mapas de calor y modelos tridimensionales.
Los tableros ofrecen diversos estilos y formatos.
Cada visualización incluye opciones específicas de configuración.
Estas características otorgan un control detallado sobre los datos.
Grafana simplifica la obtención de información clave optimizando el rendimiento del análisis.
![Grafana dashboard](/assets/images/grafana_dashboard.png)


## Metabase
Metabase proporciona un sistema de código abierto.
Esta herramienta asiste a usuarios sin conocimientos técnicos.
Estas personas interpretan múltiples tipos de información fácilmente.
La plataforma destaca al crear tableros de visualización.
El sistema ofrece un funcionamiento muy sencillo.
El usuario selecciona los datos deseados primero.
La persona indica la base de datos correspondiente después.
El usuario elige el formato de presentación visual.
La aplicación genera el panel automáticamente.
Metabase elimina la barrera del lenguaje SQL.
Esta ventaja facilita el acceso a personas inexpertas.
![Metabase dashboard](/assets/images/Metabase_dashboard.png)

## Redash
Redash ofrece un sistema de código abierto.
Esta herramienta asiste a los desarrolladores.
El programa incluye un potente lenguaje de consultas resolviendo múltiples situaciones analíticas.
El sistema conecta diversas fuentes de datos.
Esta integración genera múltiples visualizaciones configurables.
Redash protege el intercambio de información.
Un solo clic comparte el tablero con el equipo.
![Redash dashboard](/assets/images/redash_dashboard.png)

## Comparativa

| Tablero | Alimentación mediante API | Paradigma | Capacidad de transformar datos | Facilidad para lanzar |
| :---: | :---: | :---: | :---: | :---: |
| Grafana | [✅](https://grafana.com/blog/grafana-json-api-how-to-import-third-party-data-sources-in-grafana-cloud/) A través de terceros | Tableros de observabilidad | ⚠️ Limitada (Via SQL y funciones nativas) | ✅ Muy fácil (un comando Docker) |
| Metabase | ❌ No de forma nativa | Analíticas de auto-servicio | ✅ Buena (Vía SQL/Python) | ⭐ Máxima (un archivo JAR o Docker) |
| Redash | [✅](https://redash.io/help/data-sources/querying/json-api/) | Herramientas analíticas de SQL | ⭐ Muy limitada (Vía SQL) | ⚠️ Compleja (requiere múltiples servicios y dependencias) |

## Conclusión
Se considera a Redash como la mejor opción para la creación de tableros de visualización. En primer lugar, se descarta Metabase debido a su falta de conexión nativa a APIs, una característica fundamental para el trabajo del equipo. Esto deja a Grafana como principal alternativa; sin embargo, esta plataforma solo se conecta a APIs mediante herramientas de terceros, mientras que Redash lo hace de manera nativa. Además, el paradigma de Redash otorga un control total al usuario para la extracción de datos, a diferencia de Metabase, que se limita a ser una herramienta de arrastrar y soltar. Aunque Redash ofrece una capacidad de transformación muy limitada, esto resulta ventajoso para el equipo, ya que les permite mantener el control manual y casi total sobre la información que procesan para el dashboard, en contraste con Grafana, que asume más poder sobre la manipulación de los datos. Por lo tanto, Redash no solo representa la mejor alternativa para este proyecto, sino también una herramienta de gran valor.

