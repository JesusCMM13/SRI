# Actividad 6 - Creación de imágenes Docker

**Lo siento Ignacio, pero no quiero seguir más tutoriales.** 

En su lugar te voy a explicar cómo puedo usar mi proyecto de python (un juego de cartas) para crear una imágen de Docker.  Como la aplicación usa Pygame (ventana gráfica), para ejecutarla en el navegador hay que hacer un pequeño truco: usar Xvfb (pantalla virtual) + x11vnc (servidor VNC) + noVNC (cliente VNC en el navegador). Esto lo vamos a conseguir con un script de bash que se ejecuta dentro del contenedor y lanza los procesos necesarios para tener la interfaz gráfica, en el orden correcto.

<img width="697" height="258" alt="image" src="https://github.com/user-attachments/assets/6c81b63f-85fe-4e1c-bcf0-7bd20cebc169" />

Voy a enseñarte el Dockerfile y te explico lo que hace:

bash
```
# Puerto expuesto: 6080  →  http://localhost:6080/vnc.html
# ─────────────────────────────────────────────────────────────────
FROM python:3.11-slim

# ── 1. Dependencias del sistema ───────────────────────────────────
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    # Pantalla virtual (Pygame necesita un display)
    xvfb \
    # Servidor VNC que captura esa pantalla virtual
    x11vnc \
    # noVNC: cliente VNC que corre en el navegador
    novnc \
    websockify \
    # Librerías de audio/vídeo que usa pygame internamente
    libsdl2-2.0-0 \
    libsdl2-mixer-2.0-0 \
    libsdl2-image-2.0-0 \
    libsdl2-ttf-2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# ── 2. Clonar el repositorio ──────────────────────────────────────
WORKDIR /app
RUN git clone https://github.com/JesusCMM13/Proyecto_Python_LibreriaPYGAME.git .

# ── 3. Instalar dependencias Python ──────────────────────────────
RUN pip install --no-cache-dir -r requirements.txt

# ── 4. Script de arranque ─────────────────────────────────────────
COPY start.sh /start.sh
RUN chmod +x /start.sh

# ── 5. Puerto noVNC ───────────────────────────────────────────────
EXPOSE 6080

ENTRYPOINT ["/start.sh"]

```


`FROM python:3.11-slim` -> Primero, la imagen oficial de python, básica

`RUN apt-get update & install ... `-> Luego, instala todas las dependencias y paquetes necesarios, git (para clonar el repo), y la pantalla virtual y servidor VNC.
Todo en un solo `RUN` encadenado con `&&` por una razón importante: cada `RUN` crea una capa nueva en la imagen lo cual genera capas innecesarias y ocuparía más espacio. El `rm -rf /var/lib/apt/lists/*` al final elimina la caché de apt, que ya no hace falta una vez instalado todo.


`WORKDIR y RUN git clone` -> `WORKDIR /app` establece el directorio de trabajo dentro del contenedor. Todos los comandos siguientes se ejecutan desde ahí, y si la carpeta no existe, Docker la crea.
`git clone ... `. descarga el código del repositorio directamente en /app (el punto final indica "en el directorio actual", sin crear una subcarpeta).

`RUN pip install` -> Instala las dependencias Python del proyecto, en este caso solo pygame==2.6.1. El flag `--no-cache-dir` evita que pip guarde la caché de paquetes descargados, reduciendo el tamaño de la imagen.

`COPY y RUN chmod `-> `COPY` toma el archivo start.sh de la carpeta y lo copia dentro de la imagen en /start.sh. Esto ocurre en tiempo de build, por lo que el script queda permanentemente integrado en la imagen.
chmod +x le da permisos de ejecución. Sin esto, el archivo existe en el sistema de ficheros pero Linux se negaría a ejecutarlo como programa.

`EXPOSE 6080` -> usaremos el puerto 6080 (el de noVNC). Es declarativo, no abre el puerto por sí solo. El que realmente lo publica es el flag `-p 6080:6080` que pasaremos al hacer docker run. Sin el -p, este EXPOSE no tendría efecto práctico.

`ENTRYPOINT ["/start.sh"]` -> Define el comando que Docker ejecuta cuando arranca el contenedor. Como se explicó antes, la forma de array hace que el script sea el proceso PID 1 del contenedor.

Ya solo queda, en la raíz donde está el archivo dockerfile y el start.sh, hacer `docker build -t juego_cartas .`

<img width="1897" height="383" alt="image" src="https://github.com/user-attachments/assets/c899988e-eb36-4cb9-a610-dc06ff72e172" />

Una vez se han creado todas las capas de la imagen, vamos a echar a andar el contenedor con `docker run --rm -p 6080:6080 juego_cartas`

<img width="674" height="66" alt="image" src="https://github.com/user-attachments/assets/3af178a0-5bbe-4504-bed7-5dfe7b78e40f" />

<img width="1251" height="733" alt="image" src="https://github.com/user-attachments/assets/11d189f5-ee7e-477a-a375-e3e710cb42c1" />

<img width="1268" height="960" alt="image" src="https://github.com/user-attachments/assets/f9adb527-cdff-49c0-8997-c9092816ac1f" />

**NOTA:** Te voy a dejar un enlace con el dockerfile y con el start.sh. Puedes probarlo, he hecho algún cambio en el dockerfile para que no pete por la falta de audiop en el navegador. ENJOY

[Dockerfile](Tema_3/Dockerfile) 

[Script de inicio](Tema_3/start.sh) 



