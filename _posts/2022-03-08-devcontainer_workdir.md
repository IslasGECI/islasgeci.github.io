---
layout: post
title: Devcontainer and workdir
author: Francisco Alejandro Padilla Gomez
tags: equipo
---
Cuando se tienen errores del tipo un cierto archivo no se encuentra en
```bash
/workspaces/sub-folder
```
Entonces dentro de **.devcontainer/devcontainer.json** se tiene que agregar:
```bash
$ "workspaceMount": "source=${localWorkspaceFolder},target=/workdir,type=bind",

$ "workspaceFolder": "/workdir"
```
Ahora, se tienen que borrar los contenedores porque puede que vscode los vuelva a utilizar al reconstruir el contenedor, así que borraremos dichos contenedores desde una terminal fuera de vscode.

Primero se ven los procesos con
```bash
$ docker ps -a
```
Para verl el id de dichos procesos en docker (contenedores) utilizamos 
```bash
$ docker ps -aq
```
Ahora, para borrar todos, podemos utilizar la siguiente función con argumento otra función (la cual despliega todos los ids)
```bash
$ docker rm $(docker ps -aq)
```
Ya habiendo realizado esto, puedes volcer a abrir el contenedor en vscode y tendría que ya estar resuelto el problema, estando automaticamente en **/workdir**