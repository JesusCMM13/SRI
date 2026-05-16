# Actividad 6 - Creación de imágenes Docker

Lo siento Ignacio, pero no quiero seguir más tutoriales. En su lugar te voy a explicar cómo puedo usar mi proyecto de python (un juego de cartas).  Como la aplicación usa Pygame (ventana gráfica), para ejecutarla en el navegador hay que hacer un pequeño truco: usar Xvfb (pantalla virtual) + x11vnc (servidor VNC) + noVNC (cliente VNC en el navegador). Esto lo vamos a conseguir con un script de bash que se ejecuta dentro del contenedor y lanza los procesos necesarios para tener la interfaz gráfica, en el orden correcto.

<img width="697" height="258" alt="image" src="https://github.com/user-attachments/assets/6c81b63f-85fe-4e1c-bcf0-7bd20cebc169" />

Voy a enseñarte el Dockerfile y te explico lo que hace:

bash
```
# ─────────────────────────────────────────────────────────────────
# Pokémon Matching Cards — accesible desde el navegador vía noVNC
# Puerto expuesto: 6080  →  http://localhost:6080
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


