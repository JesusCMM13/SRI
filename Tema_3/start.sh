#!/bin/bash
set -e

# ── Configuración ─────────────────────────────────────────────────
DISPLAY_NUM=:0
SCREEN_RES="700x700x24"   # misma resolución que la ventana del juego
VNC_PORT=5900
NOVNC_PORT=6080

# ── 1. Pantalla virtual ───────────────────────────────────────────
echo "[*] Iniciando Xvfb en $DISPLAY_NUM ($SCREEN_RES)..."
Xvfb $DISPLAY_NUM -screen 0 $SCREEN_RES &
sleep 1

export DISPLAY=$DISPLAY_NUM

# ── 2. Servidor VNC ───────────────────────────────────────────────
echo "[*] Iniciando x11vnc en puerto $VNC_PORT..."
x11vnc -display $DISPLAY_NUM \
       -nopw \
       -listen localhost \
       -xkb \
       -forever \
       -rfbport $VNC_PORT \
       -quiet &
sleep 1

# ── 3. noVNC (proxy WebSocket → VNC) ─────────────────────────────
echo "[*] Iniciando noVNC en puerto $NOVNC_PORT..."
websockify --web=/usr/share/novnc \
           $NOVNC_PORT \
           localhost:$VNC_PORT &
sleep 1

# ── 4. El juego ───────────────────────────────────────────────────
echo "[*] Lanzando Pokémon Matching Cards..."
echo ""
echo "  ╔══════════════════════════════════════════════╗"
echo "  ║  Abre en tu navegador:                       ║"
echo "  ║  http://localhost:6080/vnc.html               ║"
echo "  ╚══════════════════════════════════════════════╝"
echo ""

cd /app
python main.py

# Si el juego termina, mantenemos el contenedor vivo
wait
