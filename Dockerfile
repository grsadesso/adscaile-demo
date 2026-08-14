FROM nginx:alpine

# Kopiere die statischen Dateien in das Nginx-Verzeichnis
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css

# Konfiguriere Nginx, um auf Port 99123 zu lauschen
RUN sed -i 's/listen       80;/listen       99123;/' /etc/nginx/conf.d/default.conf

EXPOSE 99123
