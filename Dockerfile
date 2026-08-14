FROM nginx:alpine

# Kopiere die statischen Dateien in das Nginx Verzeichnis
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css

# Konfiguriere Nginx, um auf Port 99123 zu lauschen
# Wir nutzen eine temporäre Konfigurationsdatei, um den Port zu ändern
RUN echo 'server { \
    listen 99123; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 99123

CMD ["nginx", "-g", "daemon off;"]
