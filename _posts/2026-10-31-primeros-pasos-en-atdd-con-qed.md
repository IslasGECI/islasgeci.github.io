---
layout: post
title: "Primeros pasos en ATDD con qed"
author: Evaristo
tags: programación dataops
---

En nuestros repositorios, las pruebas que escribimos con TDD suelen ser de bajo nivel.
De ahora en adelante, también agregamos pruebas de aceptación de alto nivel para cada funcionalidad nueva.
Aquí explicamos la práctica que estamos adoptando y cómo la implementamos con [qed](https://github.com/tskovlund/qed).

## De TDD a ATDD

Con TDD escribimos una prueba unitaria (que falla) desde la perspectiva del programador; luego escribimos el código que la hace pasar.
Con ATDD escribimos primero una prueba de aceptación desde la perspectiva de quien usa el sistema.
El criterio y su prueba de aceptación forman la especificación ejecutable: definen qué significa terminar.

El ciclo tiene dos bucles.
El bucle externo es la prueba de aceptación, que falla mientras la funcionalidad no existe.
El bucle interno es TDD, que construye las piezas internas con pruebas unitarias.
La prueba de aceptación pasa cuando el comportamiento completo existe.

Un criterio de aceptación es un escenario, no una regla abstracta.
Elegimos ejemplos concretos que cualquiera del equipo puede reconocer.
Cada escenario se convierte en una prueba y en un criterio del archivo de especificación.

## La arquitectura de la verificación

Nuestros proyectos separan niveles.
Make corre dentro del contenedor y no sabe que Docker existe. Nunca invocamos Docker dentro del Makefile.
Docker Compose inicia el contenedor y monta el árbol de trabajo.
Los guiones que corren fuera del contenedor viven en `.pipelines/`.
La explicación completa está en la [guía de arquitectura](https://islas.dev/guia_de_estilo/arquitectura).

qed verifica criterios escritos en TOML.
Cada criterio ejecuta un comando y, si el comando falla, el criterio falla.

## El flujo de trabajo

Primero preparamos qed; después lo usamos en la siguiente funcionalidad.

### 1. Declarar la interfaz pública

`AGENTS.md` debe decir cuál es la interfaz pública, por ejemplo, una API o una CLI.
Las pruebas de aceptación observan el sistema solo por esa interfaz.

### 2. Agregar qed a una imagen de desarrollo

Creamos `Dockerfile.dev` a partir de la imagen de producción.

```dockerfile
 FROM islasgeci/<repositorio>:latest

 RUN apt update && apt install --yes curl git
 RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh --silent --show-error --fail | sh -s -- -y
 RUN . "$HOME/.elan/env" && git clone https://github.com/tskovlund/qed.git /opt/qed
 RUN . "$HOME/.elan/env" && cd /opt/qed && lake build
 RUN ln --symbolic --force /opt/qed/.lake/build/bin/qed /usr/local/bin/qed
```

### 3. Declarar el servicio de desarrollo

En `compose.yml` agregamos un servicio con el perfil `develop`.

```yaml
 services:
   develop:
     profiles: ["develop"]
     build:
       context: .
       dockerfile: Dockerfile.dev
     image: islasgeci/<repositorio>:develop
     command: bash
     volumes:
       - $PWD:/workdir
```

El perfil mantiene la imagen de desarrollo fuera de la construcción normal.

### 4. Agregar el objetivo `verify`

El Makefile solo llama a qed.

```make
 verify:
 	qed verify specs
```

### 5. Agregar el guión del canal

Creamos `.pipelines/verify.sh`:

```bash
 #!/usr/bin/env bash
 set -o errexit -o nounset -o pipefail

 docker compose --profile develop run --rm develop make verify
```

El guión supone que la imagen de la aplicación ya existe; constrúyela con `docker compose build` antes de ejecutarlo.

### 6. Integrar el canal

```yaml
     - name: Verify acceptance criteria
       run: bash .pipelines/verify.sh
```

Cualquier canal sirve; el guión es la parte portátil.

## El primer ciclo

Elegimos la siguiente funcionalidad, no una que ya funciona.

### 1. Escribir la especificación

Aquí un ejemplo de criterio de aceptación en `specs/<funcionalidad>.spec.toml`.

```toml
 #:schema https://github.com/tskovlund/qed/blob/main/docs/spec.schema.json

 name = "<funcionalidad>"

 [[criteria]]
 description = """
 <Escenario de aceptación en lenguaje natural, con ejemplos concretos.>
 """
 skip = "Not implemented"
 [criteria.verify]
 type = "command"
 run = "pytest tests/test_acceptance_<funcionalidad>.py::test_four_tasks"
```

El `skip` es temporal: desaparece cuando la prueba existe.

### 2. Escribir la prueba que falla

En Python, un archivo por funcionalidad y un caso por escenario.
Si la interfaz es una API de FastAPI, usamos `TestClient`.

```python
 from fastapi.testclient import TestClient
 from <modulo>.api import app

 client = TestClient(app)


 def test_four_tasks():
     response = client.post("/task/1/done")
     assert response.status_code == 200
```

Si la interfaz es una CLI de Typer, usamos `CliRunner`.

```python
 from typer.testing import CliRunner
 from <modulo>.cli import cli

 runner = CliRunner()


 def test_version():
     result = runner.invoke(cli, ["version"])
     assert result.exit_code == 0
     assert "0.1.0" in result.stdout
```

Los criterios de Python apuntan al nodo exacto de la prueba.


Al igual que en Python, en R también usamos un archivo por funcionalidad.

```toml
 [[criteria]]
 description = """
 <Escenario de aceptación en lenguaje natural, con ejemplos concretos.>
 """
 skip = "Not implemented"
 [criteria.verify]
 type = "command"
 run = "Rscript --expr \"testthat::test_file('tests/testthat/test-acceptance-<funcionalidad>.R')\""
```

### 3. Rojo

Ejecutamos `make verify` dentro de la imagen de desarrollo.
El criterio falla porque el comportamiento todavía no existe.

### 4. Implementar hasta el verde

Quitamos el `skip` cuando la prueba falla por la razón correcta.
Implementamos con TDD las piezas internas.
La prueba de aceptación pasa cuando el escenario completo funciona.

## Conclusión

La especificación queda en el repositorio y el canal la verifica en cada push.
El siguiente proyecto empieza con un escenario, su prueba de aceptación y su criterio en la especificación.
Los detalles de qed están en su [documentación](https://github.com/tskovlund/qed).
