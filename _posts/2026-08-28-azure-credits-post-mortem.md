---
layout: post
title: "Blameless Postmortem: Incidente de créditos de Azure"
author: Memo y Mario
tags: equipo aprendizaje
---

## Resumen del incidente
A partir del viernes 14 hasta el jueves 20 de agosto nos quedamos sin servidores de trabajo.
Esto sucedió una semana antes de que se acabara el patrocinio porque nos quedamos sin créditos antes.
Durante este tiempo no pudimos atender tareas de clase 1 o mayores.
Durante 5 días estuvieron desactivados los servicios para verificar los datos de trampeo.
Durante 3 días no tuvimos servidor de desarrollo.
Nos tomó 3 días de trabajo migrarnos a AWS.
Este fue un incidente de alta severidad debido a que interrumpió el trabajo regular por 6 días.

## ¿Qué nos condujo al evento?
En octubre de 2023 Digital Ocean nos retiró el patrocinio y Azure nos redujo los créditos de $3,500 a $2,000.
Es decir, nos quedamos sin diversidad de proveedores de infraestructura como servicio (IaaS).
Modificamos el consumo de servicios proporcionados por Azure; activamos una computadora en las oficinas para sustituir las funcionalidades que habíamos perdido.
Calculamos que con los créditos disponibles nos sobraba para cubrir el año.
En algún momento comenzamos a proveer herramientas para uso de CD y tramperos.
Con este cambio, aumentamos la capacidad (el costo) del webserver y ya no calculamos el nuevo coste.
Esto provocó que nos quedaramos sin créditos antes de que se terminara el tiempo de la renovación, ~15 días.

## Falla
No teníamos créditos en Azure y, por lo tanto, no contábamos con infraestructura como servicio.

## Impacto
Del 14 al 19 de agosto nos quedamos sin 3 de las 5 máquinas que usamos en el equipo de CD:
- Nos quedamos sin servidor de desarrollo; herramienta principal de trabajo.
- No pudimos proveer las herramientas de CD y tramperos; esto afectó los servicios internos y la verificación de datos de trampeo.
- Nos quedamos sin tablero de reproducibilidad.
Esto implicó que durante este tiempo no pudimos atender tareas de clase 1 o mayores.
Además el director de CD tuvo que atender este asunto durante sus vacaciones.

## Detección
La primer alerta llegó cuando recibimos una factura el domingo 9 de agosto con saldo en rojo.
El director de CD reenvío la factura al equipo y comenzó a gestionar la renovación de la donación de Azure.
El 11 de agosto el equipo de CD solicitamos las credenciales de AWS para gestionar la migración de los servidores.
Para mejorar el tiempo de detección podríamos revisar de alguna manera periodicamente el saldo de nuestros IaaS.
En AWS es posible agregar una alerta automática que nos avise que ya se están acabando los créditos.

## Respuesta
El director de CD contactó al soporte de Azure para pedir la renovación del patrocinio.
El 11 de agosto aprobaron la renovación del patrocinio.
El 14 de agosto nos dimos cuenta que la donación de Azure no se activó inmediatamente debido al saldo vencido.
Fue necesario hacer una solicitud explícita para usar los créditos para pagar el saldo vencido.
Hasta el 14 de agosto el equipo de CD contó con las credenciales en AWS Console para poder utilizar los créditos del patrocinio.
El 17 de agosto comenzamos la migración de los servidores a AWS.
Terminamos con la migración del webserver y el devserver el 19 de agosto.

## Recuperación
Al darnos cuenta que no teníamos servidor de desarrollo, a pesar de haber renovado el patrocinio, decidimos mover nuestros servidores a AWS.
### Reducción del tiempo de recuperación
Si hubiéramos explorado la migración a AWS, una vez que ya nos habían aceptado la donación, hubiera sido menor el tiempo de recuperación.
Teníamos una dependencia fuerte con el director de CD como administrador de los recursos de la donación de Azure y AWS.
Si podemos hacernos cargo de esta responsabilidad, tal vez la detección y la respuesta hubieran sido un poco más ágiles.

## Línea de tiempo
- 2023-10: DigitalOcean nos retiró su donación y Microsoft Azure nos redujo de $3,500 a $2,000.
- 2023-12: Creamos el issue #332 para gestionar la donación de AWS.
- 2026-06-04: [Recibimos](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22Los+grandes+proyectos+merecen+grandes+ahorros%22) la donación de créditos de AWS por medio de TechSoup.
- 2026-08-09: [Recibimos](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22La+factura+de+Microsoft+G175826060+est%C3%A1+lista%22+after%3A2026%2F8%2F8+before%3A2026%2F8%2F11) una factura de Azure donde tenemos un saldo negativo de $92 USD.
- 2026-08-10: El director de CD nos [reenvía](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22La+factura+de+Microsoft+G175826060+est%C3%A1+lista%22+after%3A2026%2F8%2F8+before%3A2026%2F8%2F11) la factura.
- 2026-08-11:
    - [Respondimos al director de CD](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22La+factura+de+Microsoft+G175826060+est%C3%A1+lista%22+after%3A2026%2F8%2F8+before%3A2026%2F8%2F11) si debíamos cambiarnos de Azure a AWS y pidiendo credenciales de AWS.
    - [Nos aprobaron de los créditos](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22We%E2%80%99ve+renewed+your+organization%E2%80%99s+Azure+grant%22) de Azure 4:18 PM
- 2026-08-14:
    - [Amanecimos sin servidores](https://islas.slack.com/archives/GC240U1MF/p1786736401616889) por suspensión de servicios. La herramienta de verificación de datos de trampeo estaba caída.
    - [Creamos una cuenta de AWS](https://islas.slack.com/archives/GC240U1MF/p1786720341119219) y el director de CD nos agregó a la organización 9:12 AM.
    - [Enviamos solicitud](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22Case+2608140040007116%E2%80%89+Your+question+was+successfully+submitted+to+Microsoft+Support+TrackingID%232608140040007116%22) para cubrir el saldo con los créditos de Azure 12:41 PM.
- 2026-08-17 al 2026-08-18: [Migramos](https://github.com/IslasGECI/development_server_setup/compare/8aea0...02409b) el servidor de desarrollo de Azure a AWS.
- 2026-08-19:
    - [Migramos](https://github.com/IslasGECI/islasgeci.org_setup/compare/16eb71e...92c4aa9) el webserver de Azure a AWS. Dedicamos todo el día laboral.
    - Nos dieron seguimiento a la solicitud para cubrir el saldo de Azure 10:59 PM.
- 2026-08-20: Respondimos al seguimiento 2:05 AM.
- 2026-08-25: Nos [respondieron](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22I+want+to+use+my+Azure+credits+to+pay+the+overdue+bill+-+TrackingID%232608140040007116%22) que el saldo estaba cubierto 5:37 PM.
- 2026-08-26: [Comprobamos](https://islas.slack.com/archives/GC240U1MF/p1787779200840209?thread_ts=1787727037.453449&cid=GC240U1MF) que ya nos reanudaron los servicios de Azure 3:20 PM.

## Cinco "¿por qué?"
1. ¿Por qué nos quedamos sin servidores de trabajo?
  - Se acabaron los créditos de Azure y no teníamos otro proveedor activo de IaaS.
2. ¿Por qué no teníamos otro proveedor de IaaS?
  - En octubre de 2023 nos quedamos con menos de la mitad de los recursos que teníamos antes.
  Nos quitaron el patrocinio de DO y nos redujeron la donación de Azure.
  - Comenzamos la gestión de créditos en AWS y la obtuvimos en junio de 2026.
  - No habíamos implementado/probado como usar los recursos de AWS.
3. ¿Por qué no terminamos con la tarea de usar los créditos de AWS?
  - Falta del conocimiento técnico y no darnos el tiempo para aprenderlo.
  - En la priorización no entró está tarea al Kanban.
  - No estaba a la vista de todos los créditos restantes.
4. ¿Por qué no tomamos esta tarea?
  - Esta tarea no entraba en el criterio de tarea relacionada con una especie o isla; por lo tanto no llegaba al Kanban.
  - Este criterio no se ha actualizado después del cambio de estructura del equipo de CD donde no hay coordinador.
5. ¿Por qué no hemos reaccionado al cambio de estructura del equipo de CD sin coordinador?
  - Nada nos había obligado a hacer el cambio de estructura hasta este incidente.
  - Las responsabilidades del coordinador recayeron todas en el director del equipo.
  - Nadie pensó en distribuir las responsabilidades de manera sostenible de acuerdo a la carga de trabajo de todos los miembros del equipo.
  - No era evidente la importancia de esta tarea. Hemos atendido tareas que son más "urgentes".

## Causa raíz
Después del cambio de estructura del equipo de CD sin coordinador, no distribuimos las tareas de este rol en todos los miembros del equipo.
Hasta este incidente, no era evidente la importancia de redistribuir las tareas del coordinador.

## Lecciones aprendidas y cosas ganadas
- Sabemos que hay tareas que atendía el coordinador que no estamos atendiendo.
- Aprendimos como usar los servicios de AWS.

## Acciones correctivas
- Agregar un evento al calendario para que todo el equipo de CD revise cada 15 días los créditos restantes.
- Asegurar la visibilidad de todo el equipo de CD de los créditos nos restan.
- Mantener como equipo la diversidad de proovedores de IaaS.
