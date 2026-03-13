---
layout: post
title: "Comparación entre distintos tableros de visualización"
author: David Rodríguez
tags: visualizacion
---

En este artículo compararemos tecnologías para generar un tablero de visualización de datos.
Los tableros de visualización resumen la información clave de un proyecto.
Múltiples plataformas permiten crear estos recursos siendo Grafana, Metabase y Redash algunas de las mas populares del mercado actual.
Los criterios que usaremos para seleccionar son los siguientes:
- Código abierto.
- Se pueda alimentar el tablero por medio de una API.
- La capacidad de manipular datos sea limitada.
Estos criterios nos permiten desarrollar tableros mantenibles y desacoplados de los análisis.

## Grafana
Grafana es una plataforma de código abierto que facilita la creación de tableros de visualización.
El catálogo de visualizaciones crece constantemente, las opciones abarcan gráficos de series temporales, mapas de calor y modelos tridimensionales.
Los tableros ofrecen diversos estilos y formatos, cada visualización incluye opciones específicas de configuración.
Caractersiticas como operaciones matemáticas, relacionar tablas y transformar campos permite la manipulación de datos.
Grafana permite la obtención de información clave, analisis y visualización de datos lo cual la vuelve una herramienta "todo en uno".
![Grafana dashboard](/assets/images/grafana_dashboard.png)


## Metabase
Metabase proporciona un sistema de código abierto, la cual asiste a usuarios sin conocimientos técnicos.
Metabase ofrece una usabilidad inmediata para la configuración rápida de paneles de control.
El usuario simplemente selecciona los datos, indica la base de datos y elige el formato; la aplicación genera el panel automáticamente.
Metabase elimina la barrera del lenguaje SQL.
Es ideal para equipos que buscan obtener información de manera rápida, sin una curva de aprendizaje pronunciada.
![Metabase dashboard](/assets/images/Metabase_dashboard.png)

## Redash
Redash ofrece un sistema de código abierto, mejor adaptado para desarrolladores.
Requiere más conocimiento técnico para lanzar ya que requiere múltiples servicios y dependencias.
Incluye una integración nativa de APIs para conectar diversas fuentes de datos.
Las consultas a los datos se realizan a través de SQL.
La configuración en la visualización es limitada.
Es ideal para equipos experimentados que buscan flexibilidad en las fuentes de datos y generar visualizaciones de manera rápida y sencilla.
![Redash dashboard](/assets/images/redash_dashboard.png)

## Comparativa

| Tablero | Alimentación mediante API | Paradigma | Capacidad de transformar datos | Facilidad para lanzar |
| :---: | :---: | :---: | :---: | :---: |
| Grafana | [✅](https://grafana.com/blog/grafana-json-api-how-to-import-third-party-data-sources-in-grafana-cloud/) A través de terceros | Tableros de observabilidad | ⚠️ Limitada (Via SQL y funciones nativas) | ✅ Muy fácil (un comando Docker) |
| Metabase | ❌ No de forma nativa | Analíticas de auto-servicio | ✅ Buena (Vía SQL/Python) | ⭐ Máxima (un archivo JAR o Docker) |
| Redash | [✅](https://redash.io/help/data-sources/querying/json-api/) | Herramientas analíticas de SQL | ⭐ Muy limitada (Vía SQL) | ⚠️ Compleja (requiere múltiples servicios y dependencias) |

## Conclusión
Consideramos a Redash como la mejor opción para la creación de tableros de visualización.
Redash se conecta a APIs de manera nativa, una característica fundamental para el flujo trabajo del equipo.
Descartamos Metabase y Grafana debido a su falta de conexión nativa a APIs.
El paradigma de Redash otorga un control total al usuario para la extracción de datos pero limita la manipulación.
A diferencia de Metabase, que se limita a ser una herramienta de arrastrar y soltar, mientras que Grafana asume más poder sobre la manipulación de los datos.
Redash representa la mejor alternativa para este proyecto por su conectividad nativa y su paradigma de funcionamiento.

