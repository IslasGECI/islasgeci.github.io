---
layout: post
title: "Blameless Postmortem: Incidente de créditos de Azure"
author: Memo y Mario
tags: equipo aprendizaje
---

## Resumen del incidente
A partir del viernes 14 hasta el jueves 20 de agosto nos quedamos sin servidores de trabajo.
Esto sucedió una semana antes de que se acabara el patrocinio porque nos quedamos sin créditos antes.
Durante este tiempo no pudimos atender tareas de clase 2 o mayores.
Estuvimos sin servicios durante 5 días; 3 días sin servidor de desarrollo.
Nos tomó tres días de trabajo migrarnos a AWS. 

## ¿Qué nos condujo al evento?
En octubre de 2023 Digital Ocean nos retiró el patrocinio y Azure nos redujo los créditos de $3,500 a $2,000.
Es decir, nos quedamos sin diversidad de servicios.
Hicimos un cálculo para saber hasta cuándo nos iban a alcanzar la donación. Nos sobraba para cubrir todo el año.
En algún momento comenzamos a usar servicios y aumentamos la capacidad (el costo) del webserver y ya no calculamos el nuevo coste.
Nos quedamos sin créditos antes de que se terminara el tiempo de la renovación, ~15 días.

## Falla
Nos quedamos sin tres de las 5 máquinas que usamos en el equipo de CD:
- Nos quedamos sin servidor de desarrollo; herramienta principal de trabajo.
- Nos quedamos sin servicios; esto afectó los pipelines de bitbucket que usaban los servicios y la herramienta de verificación de datos para los tramperos.
- Nos quedamos sin tablero de reproducibilidad.

## Impacto
Nos quedamos sin servidores de trabajo del 11 al 19 de agosto.
El impacto lo pudo sentir directamente los tramperos al revisar sus datos y el equipo de CD que no tenían las herramientas diarias para trabajar.
Este fallo nos afectó 6 días.
Durante este tiempo no pudimos atender tareas de clase 2 o mayores.
El director tuvo que atender este asunto durante sus vacaciones.

## Detección
La primer alerta llegó cuando nos llega una factura el domingo 9 de agosto con saldo en rojo.
Evaristo reenvío la factura al equipo y comenzó a gestionar la renovación de la donación de Azure.
El 11 de agosto el equipo de CD solicitamos las credenciales de AWS para gestionar la migración de los servidores.
Para mejorar el tiempo de detección podríamos tener una alerta automática, como en AWS, que nos avise que ya se están acabando los créditos.

## Respuesta
Evaristo contactó al soporte de Azure para pedir la renovación del patrocinio. El 11 de agosto ya lo habían aprobado.
La donación de Azure no se activó inmediatamente debido al saldo vencido.
El equipo de CD creo cuentas en AWS Console para poder utilizar los créditos del patrocinio.
El 17 de agosto comenzamos la migración de los servidores a AWS. Terminamos con la migración del webserver y el devserver el 19 de agosto.

## Recuperación

### Reducción del tiempo de recuperación
Si hubieramos explorado la migración a AWS, una vez que ya nos habían aceptado la donación, hubiera sido menor el tiempo de recuperación.
Tenemos una dependencia fuerte con el director de CD como administrador/gestor de la donación de Azure y AWS.
Si podemos hacernos cargo de esta responsabilidad, tal vez la detección y la respuesta hubieran sido un poco más ágiles.

## Línea de tiempo
- Octubre de 2023: DigitalOcean nos retiró su donación y Microsoft Azure nos redujo de $3,500 a $2,000.
- En diciembre de 2023: creamos el issue #332 para gestionar la donación de AWS.
- 2026-06-04: [Recibimos](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22Los+grandes+proyectos+merecen+grandes+ahorros%22) de la donación de créditos de AWS por medio de TechSoup.
- 2026-08-09: [Recibimos](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22La+factura+de+Microsoft+G175826060+est%C3%A1+lista%22+after%3A2026%2F8%2F8+before%3A2026%2F8%2F11) una factura de Azure donde tenemos un saldo negativo de $92 USD.
- 2026-08-10: Evaristo nos [reenvía](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22La+factura+de+Microsoft+G175826060+est%C3%A1+lista%22+after%3A2026%2F8%2F8+before%3A2026%2F8%2F11) la factura.
- 2026-08-11:
    - [Respondimos a Evaristo](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22La+factura+de+Microsoft+G175826060+est%C3%A1+lista%22+after%3A2026%2F8%2F8+before%3A2026%2F8%2F11) si debíamos cambiarnos de Azure a AWS y pidiendo credenciales de AWS.
    - [Nos aprobaron de los créditos](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22We%E2%80%99ve+renewed+your+organization%E2%80%99s+Azure+grant%22) de Azure 4:18 PM
- 2026-08-14:
    - [Amanecimos sin servidores](https://islas.slack.com/archives/GC240U1MF/p1786736401616889) por suspención de servicios.
    - [Creamos una cuenta de AWS](https://islas.slack.com/archives/GC240U1MF/p1786720341119219) y Evaristo nos agregó a la organización 9:12 AM.
    - [Enviamos solicitud](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22Case+2608140040007116%E2%80%89+Your+question+was+successfully+submitted+to+Microsoft+Support+TrackingID%232608140040007116%22) para cubrir el saldo con los créditos de Azure 12:41 PM.
- 2026-08-17 al 2026-08-18: [migramos](https://github.com/IslasGECI/development_server_setup/compare/8aea0...02409b) el devserver de Azure a AWS. 
- 2026-08-19:
    - [Migramos](https://github.com/IslasGECI/islasgeci.org_setup/compare/16eb71e...92c4aa9) el webserver de Azure a AWS. Dedicamos todo el día laboral.
    - Nos dieron seguimiento a la solicitud para cubrir el saldo de Azure 10:59 PM.
- 2026-08-20: Respondimos al seguimiento 2:05 AM.
- 2026-08-25: Nos [respondieron](https://mail.google.com/mail/u/0/?tab=rm&ogbl#search/subject%3A%22I+want+to+use+my+Azure+credits+to+pay+the+overdue+bill+-+TrackingID%232608140040007116%22) que el saldo estaba cubierto 5:37 PM.
- 2026-08-26: [Comprobamos](https://islas.slack.com/archives/GC240U1MF/p1787779200840209?thread_ts=1787727037.453449&cid=GC240U1MF) que ya nos reanudaron los servicios de Azure 3:20 PM.

## Cinco "¿por qué?"
1. ¿Por qué nos quedamos sin servidores de trabajo?
  - Se acabaron los créditos de Azure y no teníamos otro proveedor activo de servicios de Código como infraestructura (IaC).
2. ¿Por qué no teníamos otro proveedor de IaC?
  - En octubre de 2023 nos quedamos con menos de la mitad de los recursos que teníamos antes.
  Nos quitaron el patrocinio de DO y nos redujeron la donación de Azure.
  - Comenzamos la gestión de créditos en AWS y la obtuvimos en junio de 2026.
  - No habíamos implementado/probado como crear la IaC en AWS.
3. ¿Por qué no terminamos con la tarea de usar los créditos AWS?
3. ¿Por qué no habíamos implementado IaC en AWS?
  - Falta del conocimiento técnico y no darnos el tiempo para aprenderlo.
  - En la priorización no entró está tarea al Kanban.
  - No estaba a la vista de todos los créditos restantes.
4. ¿Por qué no entró/tomamos esta tarea?
  - Esta tarea no entraba en el criterio de tarea relacionada con una especie o isla; por lo tanto no llegaba al Kanban.
  - Este criterio no se ha actualizado después del cambio de estructura del equipo de CD.
5. ¿Por qué no hemos reaccionado al cambio de estructura del equipo?
  - Nada nos había obligado a hacer el cambio de estructura hasta este incidente.
  - La responsabilidad de darle el seguimiento a esta tarea quedó en manos de una sola persona con muchas responsabilidades.
  - Las responsabilidades del coordinador recayeron todas en el director del equipo; nadie pensó en distribuirlas de manera sostenible de acuerdo a la carga de trabajo de todos los miembros del equipo.
  - No era evidente la importancia de esta tarea.
  - Hemos atendido tareas que son más "urgentes".

## Causa raíz

## Lecciones aprendidas y cosas ganadas

## Acciones correctivas

