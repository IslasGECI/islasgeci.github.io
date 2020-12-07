### Tablero roto


#### Mayor atención al hacer merge entre ramas

**¿Qué pasó?** Error al no poder reproducir `geci- test make` después de unir un _feature_ a la rama develop.

**¿Cómo pasó?** Al hacer merge de la `develop` hacia una _feature_ nos llevamos y consignamos un error, el cual, después de aprobar el _Pull Request_ de la _feature_, introdujimos una falla en la `develop`. La `develop` estaba más avanzada que la feature. Por malas prácticas (Buscar referencia que avala esta oración), esperábamos que la existencia de un error en esta acción fuera delatado por Git, por lo que, no revisamos detalladamente los pipelines de Bitbucket al hacer merge entre las ramas.

**¿Cuáles son las acciones que tomaremos para evitar que pase en el futuro?** Aplicar correctamente las buenas prácticas (Buscar referencia que avala esta oración) de flujo de trabajo, sin esperar que Git trabaje de manera infalible y con mayor atención en los resultados de _pipelines_ de Bitbucket.
