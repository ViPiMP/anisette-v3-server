#!/bin/sh
# Beende das Skript sofort, falls ein Befehl fehlschlägt
set -e 

echo "Generiere Nginx-Config aus Template..."
envsubst '${PORT} ${SECRET_PATH}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

echo "Starte Anisette-Backend im Hintergrund..."
# Globaler Aufruf ohne ./ (für den Fall, dass es in /usr/bin oder /usr/local/bin liegt)
anisette-v3-server &

echo "Starte Nginx-Proxy..."
# 'exec' sorgt dafür, dass Nginx den PID 1 übernimmt und Signale (wie SIGTERM) korrekt empfängt
exec nginx -g 'daemon off;'
