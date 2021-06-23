## Grupo de Ecología y Conservación de Islas, A.C.

Este repositorio es la fuente de [la página](https://islas.dev/) del
[equipo](https://github.com/orgs/IslasGECI/people) de [Ciencia de
Datos](https://github.com/IslasGECI) en [GECI](https://islas.org.mx).

## Comunidad de Código Abierto de GECI

Únete a nuestra comunidad de código abierto:

- [Foro de GECI en GitHub](https://github.com/IslasGECI/islasgeci.github.io/discussions)
- [Chat de GECI en Slack](https://islasgeci.slack.com)
    - [Crear cuenta en
      Slack](https://join.slack.com/t/islasgeci/shared_invite/zt-f8kqlr2t-C8dO0JthMxaT81ShJiNk0w)

---

Para servir esta página localmente con Docker ejecuta:

```
docker run \
    --publish 4000:4000 \
    --rm \
    --volume="${PWD}:/srv/jekyll" \
    jekyll/jekyll:4 jekyll serve
```

y visita [localhost:4000](http://localhost:4000).
