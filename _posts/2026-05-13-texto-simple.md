---
layout: post
title: "Por qué preferimos el texto simple"
author: Equipo de Ciencia de Datos
tags: dataops programación
---

Preferimos los datos en texto simple (CSV, JSON, etc.) sobre archivos binarios (XLSX, pickle, RDS, etc.) por las siguientes razones:

1. **Control de versiones**: los archivos de texto simple se agregan a Git; los
   binarios no se diferencian bien entre versiones.
2. **Portabilidad entre lenguajes**:
   exportar e importar un JSON de Python a R (o viceversa) es trivial. Un
   archivo `.rds` en Python o un `.pkl` en R no lo es.
3. **Acceso universal**:
   un archivo de texto se abre en cualquier máquina sin instalar nada adicional.
   Un binario requiere un programa específico.
4. **Licencias**:
   los formatos binarios suelen ser propietarios y pueden implicar costos económicos.
5. **Estabilidad**:
   los formatos de texto simple son estables y cuentan con herramientas gratuitas
   duraderas. Los binarios quedan obsoletos con frecuencia.
6. **Consultas**:
   las consultas que filtran datos sin modificar la estructura de la tabla son
   aceptables dentro del programa; aquellas que agrupan o transforman no lo
   son.
