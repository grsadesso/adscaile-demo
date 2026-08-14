FROM nginx:alpine

# Kopieren der statischen Dateien nach /usr/share/nginx/html
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css

# Konfiguration des Ports auf 9123
EXPOSE 9123

# Anpassung der Nginx-Konfiguration, um auf Port 9123 zu lauschen
RUN sed -i 's/listen  80;/listen 9123;/' /etc/nginx/conf.d/default.conf

