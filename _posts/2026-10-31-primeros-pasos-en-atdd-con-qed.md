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
El criterio y su prueba de aceptación definen qué significa terminar.

El ciclo tiene dos bucles.
El bucle externo es la prueba de aceptación, que falla mientras la funcionalidad no existe.
El bucle interno es TDD, que construye las piezas internas con pruebas unitarias.
La prueba de aceptación pasa cuando el comportamiento completo existe.

Un criterio de aceptación es una entrada de la especificación: describe un escenario y declara el comando que verifica el escenario descrito.
Elegimos ejemplos concretos que cualquiera del equipo puede reconocer.
Convertimos cada escenario en una prueba de aceptación y en una entrada de la especificación.

## La arquitectura de la verificación

La arquitectura de nuestros proyectos separa niveles.
Make corre dentro del contenedor y no sabe que Docker existe. Nunca invocamos Docker dentro del Makefile.
Docker Compose inicia el contenedor y monta el árbol de trabajo.
Los guiones que corren fuera del contenedor viven en `.pipelines/`.
La explicación completa está en la [guía de arquitectura](https://islas.dev/guia_de_estilo/arquitectura).

qed verifica criterios escritos en TOML.
Cada criterio declara un comando y, si el comando falla, qed marca el criterio como fallido.

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
 RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh --silent --show-error --fail --output /tmp/elan-init.sh && sh /tmp/elan-init.sh -y
 RUN . "$HOME/.elan/env" && git clone https://github.com/tskovlund/qed.git /opt/qed
 RUN . "$HOME/.elan/env" && cd /opt/qed && lake build
 RUN ln --symbolic --force /opt/qed/.lake/build/bin/qed /usr/local/bin/qed
```

### 3. Declarar el servicio de desarrollo

En `docker-compose.yml` agregamos un servicio con el perfil `develop`.

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

El objetivo `verify` solo llama a qed.

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

El guión supone que la imagen de producción ya existe; constrúyela con `docker compose build` antes de ejecutarlo.

### 6. Integrar el canal

```yaml
     - name: Verify acceptance criteria
       run: bash .pipelines/verify.sh
```

Cualquier canal sirve; el guión es la parte portátil.

## El primer ciclo

Elegimos la siguiente funcionalidad, no una que ya funciona.

### 1. Escribir la especificación

Aquí hay un ejemplo de criterio de aceptación en `specs/<funcionalidad>.spec.toml` para Python con `pytest`.

```toml
 #:schema https://raw.githubusercontent.com/tskovlund/qed/main/docs/spec.schema.json

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

La verificación del criterio en R usa `testthat`.

```toml
 [criteria.verify]
 type = "command"
 run = "Rscript --expr \"testthat::test_file('tests/testthat/test-acceptance-<funcionalidad>.R')\""
```

### 2. Escribir la prueba que falla

Usamos un archivo por funcionalidad y un caso por escenario en Python.
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

En R, usamos un archivo por funcionalidad en `tests/testthat/test-acceptance-<funcionalidad>.R`; el comando del criterio ejecuta el archivo completo.

```r
 describe("Múltiplos de tres y cinco", {
   it("dice Fizz para múltiplos de tres", {
     expect_equal(fizzbuzz(3), "Fizz")
   })

   it("dice Buzz para múltiplos de cinco", {
     expect_equal(fizzbuzz(5), "Buzz")
   })

   it("dice FizzBuzz para múltiplos de quince", {
     expect_equal(fizzbuzz(15), "FizzBuzz")
   })
 })

 describe("Números ordinarios", {
   it("devuelve el número como texto", {
     expect_equal(fizzbuzz(7), "7")
   })
 })
```

Quitamos el `skip` de `specs/<funcionalidad>.spec.toml` cuando la prueba de aceptación existe y falla por la razón correcta.

### 3. Rojo

Ejecutamos `make verify` dentro de la imagen de desarrollo.
La prueba falla porque el comportamiento todavía no existe.

### 4. Implementar hasta el verde

Implementamos con TDD las piezas internas.
La prueba de aceptación pasa cuando el escenario completo funciona.

## Conclusión

La especificación queda en el repositorio y el canal verifica los criterios en cada push.
El siguiente proyecto empieza con un escenario, su prueba de aceptación y su criterio en la especificación.
Los detalles de qed están en su [documentación](https://github.com/tskovlund/qed).
