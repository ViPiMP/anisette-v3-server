#!/bin/sh

# 1. Ersetze die Variablen im Template mit den Werten aus dem Render-Dashboard
envsubst '${PORT} ${SECRET_PATH}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# 2. Starte den Anisette-Server im Hintergrund (Port 6969)
# WICHTIG: Prüfe, wie das Binary in deinem Fork genau heißt! 
# Meistens liegt es einfach im aktuellen Verzeichnis.
./anisette-v3-server &

# 3. Starte Nginx im Vordergrund, damit der Render-Container läuft
nginx -g 'daemon off;'
