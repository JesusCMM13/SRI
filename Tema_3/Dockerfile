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

# ── 5. Variables de entorno SDL ───────────────────────────────────
# Sin estas, pygame falla al no encontrar tarjeta de sonido ni display físico
ENV SDL_AUDIODRIVER=dummy
ENV SDL_VIDEODRIVER=x11

# ── 6. Puerto noVNC ───────────────────────────────────────────────
EXPOSE 6080

ENTRYPOINT ["/start.sh"]
