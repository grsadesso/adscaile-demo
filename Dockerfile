# Verwende ein leichtgewichtiges Nginx Alpine Image
FROM nginx:alpine

# Kopiere die statischen Dateien in das Nginx HTML Verzeichnis
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css

# Konfiguriere Nginx, um auf Port 99123 zu hören
# Da Nginx standardmäßig auf 80 hört, müssen wir die Konfiguration anpassen
# oder einfach das Port-Mapping beim Docker-Run nutzen. 
# Um den Port im Container selbst festzulegen, erstellen wir eine kleine Konfig.

RUN echo "server { \
    listen 99123; \
    server_name localhost; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html; \
    } \
}" > /etc/nginx/conf.d/default.conf

# Exportiere den Port als Metadaten
EXPOSE 99123
