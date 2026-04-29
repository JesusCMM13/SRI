# Actividad 0 - Docker
## Conceptos básicos sobre Docker
Docker es una plataforma de código abierto que permite automatizar el despliegue de aplicaciones dentro de paquetes ligeros llamados contenedores.

Su objetivo principal es solucionar el clásico problema de "en mi máquina funciona, pero en el servidor no". Al empaquetar el software con todas sus dependencias (librerías, configuraciones, etc.), Docker garantiza que la aplicación se ejecute exactamente igual en cualquier entorno.

## Imágenes vs. Contenedores
Es común confundirlos, pero la diferencia es sencilla si piensas en ellos como una receta y un plato de comida:

**Imagen Docker:** Es una plantilla de solo lectura (un "blueprint"). Contiene las instrucciones y archivos necesarios para crear un contenedor. No puedes "ejecutar" una imagen; la usas para construir algo.

**Contenedor Docker:** Es la instancia viva y ejecutable de una imagen. Si la imagen es la receta, el contenedor es el pastel ya horneado. Puedes iniciar, detener, mover o borrar un contenedor de forma independiente.

## Volúmenes de almacenamiento
Por defecto, los contenedores son efímeros: si borras un contenedor, los archivos guardados dentro de él desaparecen para siempre.

Los volúmenes son el mecanismo que utiliza Docker para persistir datos. Son como "discos duros externos" virtuales que se conectan al contenedor. De esta forma, aunque el contenedor se destruya o se actualice, la información (como una base de datos o fotos de usuarios) permanece a salvo en el sistema anfitrión.
