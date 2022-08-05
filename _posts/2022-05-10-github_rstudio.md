---
layout: post
title: "Cómo utilizar Git y GitHub desde RStudio"
author: Lizeth Reyes
tags: equipo
---

## Git en RStudio 📸 🗃️
### Introducción
Git es un sistema de control de versiones. Git realiza seguimiento de los cambios de código y 
comparte esos cambios con otros, ya que nos permite fusionar estos cambios. Existen diferentes 
formas de usar Git: desde la línea de comandos, utilizando RStudio o una app independiente 
(GitKraken), etc. Para esta primera etapa nos centraremos en el uso de Git en RStudio. 

RStudio es un entorno de desarrollo integrado para el lenguaje de programación de R, 
dedicado a la computación estadística y gráficos. RStudio incluye una consola, herramientas para 
el trazado, depuración y gestión del espacio de trabajo, la terminal, y la herramienta para trabajar 
con Git. 

### Objetivo

- **_Aprender a usar Git en RStudio._** 

### Configurar la autenticación con una clave SSH
Antes de comenzar a trabajar en RStudio debemos configurar la autenticación con la clave SSH.
Primero revisaremos que no hay ninguna llave generada. Para ello, vamos a correr el comando que mostramos
en la imagen. En la imagen podemos notar que la terminal no despliega ninguna lista de llaves generadas.

<img style="text-align: center;" width="800" alt="001" src="https://user-images.githubusercontent.com/87685163/171294259-9afe7bbd-227e-4531-b98e-871f9aaa7c24.png">

Después, vamos a crear nuestra llave ejecutando el siguiente comando `ssh-keygen`. En seguida, 
se indica la carpeta en donde se almacenará la llave y nos pedirá una contraseña; si lo prefieres
puedes omitir la contraseña con la tecla `enter`.

<img style="text-align: center;" width="800" alt="007" src="https://user-images.githubusercontent.com/87685163/172236182-aae9ba04-341d-46a0-86ca-0ec1df896030.png">

Al finalizar, se mostrará lo siguiente. 

<img width="800" alt="009" src="https://user-images.githubusercontent.com/87685163/172237387-e8013d08-b950-49f8-a3f3-f138240356d3.png">

Ahora vamos a acceder a nuestra llave para copiarla y asociarla a GitHub. Ejecutaremos el 
siguiente comando `cat ~/.ssh/id_rsa.pub`. Copiamos desde **'ssh...** hasta la terminación
**.local'**

<img width="800" alt="011" src="https://user-images.githubusercontent.com/87685163/172238142-22c0d7d0-27cc-4815-a5d7-e46afd325169.png">

A continuación nos dirigiremos a nuestro GitHub. Una vez ahí, buscaremos **Settings**.

<img width="800" alt="003" src="https://user-images.githubusercontent.com/87685163/172238565-2af9e5d1-3079-41e5-88c5-822dc3dbeb1b.png">

En **Settings** encontraremos múltiples opciones para configurar, lo que a nosotros nos 
interesa es el apartado de **Access**, específicamente en **SSH and GPG Keys**.

<img width="800" alt="004" src="https://user-images.githubusercontent.com/87685163/172239163-fc6009b0-98da-4411-a6f7-d3be07bc3081.png">

Damos click en la opción de **New SSH Key**.

<img width="800" alt="005" src="https://user-images.githubusercontent.com/87685163/172239680-4bf91339-f8b7-4fde-aef8-c3abf40193dd.png">

Agregamos un título, pegamos la llave que hemos copiado de la 
terminal y finalmente la agregamos. 

<img width="800" alt="008" src="https://user-images.githubusercontent.com/87685163/172239912-7d689b4b-a433-4762-84dc-db94ecee5bac.png">

### Clonar nuestro repositorio en RStudio
A continuación, buscaremos el repositorio que vamos a clonar. 

<img width="800" alt="002" src="https://user-images.githubusercontent.com/87685163/172240353-eb3604cd-3db7-4068-8353-9b5072f77da3.png">

Daremos click en la opción **Code** que se marca en verde, y después elegimos la 
opción **SSH** y copiamos la dirección con el botón que se encuentra a lado.

<img width="800" alt="010" src="https://user-images.githubusercontent.com/87685163/172240971-afc6d749-f818-4fc6-992f-0aeea0604b4e.png">

En seguida, abriremos la aplicación de **RStudio**. En el apartado **File** 
elegiremos la opción **New Project**. Se desplegará una ventana como la siguiente y seleccionamos 
la opción **Version Control**  e inmediatamente **Git**.

<img width="800" alt="015" src="https://user-images.githubusercontent.com/87685163/172242418-fc0bcbd9-34b8-4d96-9982-21b74686d0e2.png">

<img width="800" alt="014" src="https://user-images.githubusercontent.com/87685163/172242028-e02a6b78-1288-4105-8217-9ccb295f4e2f.png">

Pegamos la dirección que habíamos copiado de GitHub. Después de pegar la dirección, el nombre y 
la carpeta de origen se asignan por default, podemos cambiar esto si lo preferimos. 
Finalmente, daremos click en **Create Project**.

<img width="800" alt="012" src="https://user-images.githubusercontent.com/87685163/172243046-2cc8a26d-cfb4-4d98-84f0-cb9d127b3201.png">

Ahora podemos ver el nombre del proyecto en la esquina superior derecha, señal de que el proyecto 
está configurado y listo para trabajar con el repositorio. También, podemos notar que automáticamente 
cambiamos al directorio donde están los archivos del repositorio y diferentes botones nos permiten hacer 
**Pull**, **Push**, y **Commit**.

<img width="800" alt="019" src="https://user-images.githubusercontent.com/87685163/172243832-0228c9c8-cda6-44f2-b780-27d5ce413152.png">

<img width="800" alt="018" src="https://user-images.githubusercontent.com/87685163/172243851-d4b91e1e-9890-4606-8271-549b8ebd4844.png">

### Git _add_, git _commit_ y git _push_
En el panel de cambios notaremos que hay tres archivos con un signo de interrogación. 
Esto significa que estos archivos no tienen ningún seguimiento dentro de nuestro repositorio y
tendrán que ser agregados. Para esto, hay que agregar los archivos seleccionando las casillas. 
Esto hará que las casillas cambien a una A, lo que inidcan que los archivos están siendo agregados. 
El **_mensaje de consignación_** deberá tener un **_título_** y una **_descripción_**. 
El titulo será escrito de forma **_imperativa_**, comenzando con un **_verbo_**, y en **_inglés_**, 
mientras que la descripción explicará el **_porqué se realizaron esos cambios_**. 

<img width="800" alt="Captura de Pantalla 2022-05-05 a la(s) 2 30 35" src="https://user-images.githubusercontent.com/87685163/166879559-12f26800-0fb0-4cf1-a89e-80ed09104b49.png">

<img width="800" alt="Captura de Pantalla 2022-05-05 a la(s) 2 28 50" src="https://user-images.githubusercontent.com/87685163/166879402-524eca23-8ae5-47c0-ad05-6c9f46ab8230.png">

Ahora modificaremos uno de los archivos para diferenciar cuando agregamos o eliminamos líneas de 
código. Notaremos que al agregar una línea de código se marca en color verde, en cambio, 
si la eliminamos se marca en color rojo. 

<img width="800" alt="Captura de Pantalla 2022-05-05 a la(s) 2 34 17" src="https://user-images.githubusercontent.com/87685163/166880363-cd7db233-b204-4405-b21c-600fa7d972f8.png">
 
Haremos nuestra primera consignación y **RStudio** nos dará un aviso de lo que esta pasando. El mensaje 
significa que nuestro repositorio tiene cambios que aún no los tiene el repositorio remoto. 

 Entonces, el último paso es empujar los cambios con el botón **Push** que se encuentra en la parte superior derecha. 
 <img width="800" alt="Captura de Pantalla 2022-07-27 a la(s) 14 24 49" src="https://user-images.githubusercontent.com/87685163/181358933-46c79815-5c65-4b43-8b49-b09e5e4fbefd.png">
 
### Resúmen y comparación entre RStudio y la terminal

<table>
  <tr>
    <th>RStudio</th>
    <th>Git</th>
  </tr>
  <tr>
    <td><img width="297" alt="Captura de Pantalla 2022-07-27 a la(s) 14 31 08" src="https://user-images.githubusercontent.com/87685163/181357653-f0e10de1-5b70-4993-acb9-90fe184592c9.png"></td>
   <td> <em> $ git add file_name </em> </td>
  </tr>
  <tr>
    <td><img width="297" alt="Captura de Pantalla 2022-07-27 a la(s) 14 31 54" src="https://user-images.githubusercontent.com/87685163/181358860-a7581b75-42df-4013-a0dc-82b72ed779bc.png"></td>
    <td><em>$ git commit -m "m e s s a g e" </em> </td>
  </tr>
 <tr>
    <td><img width="297" alt="Captura de Pantalla 2022-07-27 a la(s) 14 24 49" src="https://user-images.githubusercontent.com/87685163/181358933-46c79815-5c65-4b43-8b49-b09e5e4fbefd.png"></td>
    <td><em>$ git push </em> </td>
  </tr>
 <tr>
    <td><img width="297" alt="Captura de Pantalla 2022-07-27 a la(s) 14 46 47" src="https://user-images.githubusercontent.com/87685163/181359353-3656652b-e1ff-4d2c-937a-8a4a27f534a0.png"></td>
  <td><center><em>$ git pull</em> </center> </td>
  </tr>
</table>
