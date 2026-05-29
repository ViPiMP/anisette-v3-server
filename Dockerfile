# Wir nehmen dein geforktes Image als Basis
FROM dadoum/anisette-v3-server:latest 

USER root

# Installiere Nginx und gettext (für envsubst)
# HINWEIS: Falls dein Base-Image auf Alpine basiert, ersetze apt-get durch:
# RUN apk add --no-cache nginx gettext
RUN apt-get update && apt-get install -y nginx gettext-base && rm -rf /var/lib/apt/lists/*

# Kopiere unsere neuen Dateien in den Container
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY entrypoint.sh /app/entrypoint.sh

# Render erwartet, dass wir auf 10000 lauschen, falls kein $PORT übergeben wird
ENV PORT=10000

# Setze den neuen Entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
