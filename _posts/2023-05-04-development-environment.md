---
layout: post
title: "Entorno de desarrollo remoto: Configuración común para tmux"
author: Mario y Evaristo
tags: programacion
---

Con la finalidad de mejorar la experiencia del equipo durante el desarrollo remoto, creamos una
configuración común para tmux.
Actualmente, nuestra configuración común de tmux incluye:

- La numeración de las ventanas comienza en 1.
- Cuando alguna de las ventanas tienen actividad esta parpadea.
- Podemos navegar con el mouse: hacer clic a los nombres de las ventanas y movernos verticalmente
  con el _scroll_ del mouse.
- Si prefieres usar tu configuración personal puedes cargarla presionando `Ctrl+b` `r`.


Esta configuración la definimos en el archivo
[`.tmux.conf`](https://github.com/analislas/dotfiles/blob/develop/.tmux.conf) que agregamos al
repositorio [`analislas/dotfiles`](https://github.com/analislas/dotfiles).
En este repositorio podríamos agregar más configuraciones comunes para el equipo.

En el _playbook_ `development.yml` corremos la [instalación de los
dotfiles](https://github.com/IslasGECI/development_server_setup/blob/develop/ansible/development.yml#L137)
del _analislas_.
Para tmux, la [instalación](https://github.com/analislas/dotfiles/blob/develop/Makefile#L2) consiste
en copiar nuestro archivo `.tmux.conf` al archivo que tmux lee por defecto (`/etc/tmux.conf`).
