---
layout: post
title: "Configuración y solución de problemas al trabajar con VS Code y contenedores Docker"
author: Francisco Alejandro Padilla Gomez
tags: equipo
---

Cuando configuramos VS Code para trabajar, necesitamos instalar una extensión previa. Instalaremos
_Remote Development_ `ms-vscode-remote.vscode-remote-extensionpack`. Esta extensión nos permite
abrir cualquier repositorio dentro de un contenedor de Docker.

Después de que terminamos de instalar _Remote Development_, le damos clic en un botón verde
encontrado en la parte inferior izquierda. Encontramos varías opciones, entonces seleccionamos `open
container`.

Al estar dentro del contenedor, entonces ya podremos realizar cambios, correr archivos de código, etc.
Al ejecutar recetas del Makefile pueden surgir errores al no tener bien definido el directorio de trabajo.

Cuando tengamos errores donde tenemos `[Makefile:45: data/processed/logistic_model_table.csv] Error
1` es probable que nuestra carpeta de trabajo y nuestra carpeta local no estén vinculadas. Para
vincularlas tendremos que modificar el archivo `.devcontainer/devcontainer.json`.

Dentro de `.devcontainer/devcontainer.json` agregaremos:

```json
"workspaceMount": "source=${localWorkspaceFolder},target=/workdir,type=bind",
"workspaceFolder": "/workdir"
```

Con la opción `workspaceMount` le decimos al VS Code que vincule nuestro directorio local en la
carpeta `/workdir/`. Y con la opción `workspaceFolder` definimos la carpeta de trabajo.

Ahora tenemos que borrar los contenedores porque puede ser que VS Code los vuelva a utilizar al
reconstruir el contenedor. Así que borraremos dichos contenedores desde una terminal fuera de VS
Code.

Primero veremos los procesos con:

```shell
docker ps --all
```

La opción `--all` nos muestra todos los contenedores.

La instrucción anterior nos muestra el _id_ del contenedor, la imagen con el que generamos el
contenedor, el comando actual y otras columnas.

Para ver sólo el _id_ de dichos contenedores utilizamos:

```shell
docker ps --all --quiet
```

Ahora, para borrar todos los contenedores, utilizaremos la siguiente función con el comando anterior
como argumento.

```shell
docker rm $(docker ps --all --quiet)
```

El subcomando `docker rm` remueve los contenedores.

Ya habiendo realizado esto, podemos volver a abrir el contenedor en VS Code y estará resuelto el
problema: nuestro directorio de trabajo será `/workdir/`.

