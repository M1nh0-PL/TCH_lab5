# Etap 1
FROM scratch AS builder

# Dodajemy system plików Alpine Linux do etapu budowania
ADD alpine-minirootfs-3.23.3-x86_64.tar.gz /

# Deklaracja argumentu dla wersji aplikacji
ARG VERSION="1.0.0"

# Wygenerowanie skryptu startowego
RUN echo '#!/bin/sh' > /page.sh && \
    echo 'echo "<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title>Laboratorium 5</title></head><body>" > /usr/share/nginx/html/index.html' >> /page.sh && \
    echo 'echo "<h1>Aplikacja Webowa - Lab 5</h1>" >> /usr/share/nginx/html/index.html' >> /page.sh && \
    echo 'echo "<p><strong>Wersja aplikacji:</strong> '${VERSION}'</p>" >> /usr/share/nginx/html/index.html' >> /page.sh && \
    echo 'echo "<p><strong>Adres IP serwera:</strong> $(hostname -i)</p>" >> /usr/share/nginx/html/index.html' >> /page.sh && \
    echo 'echo "<p><strong>Nazwa serwera (hostname):</strong> $(hostname)</p>" >> /usr/share/nginx/html/index.html' >> /page.sh && \
    echo 'echo "</body></html>" >> /usr/share/nginx/html/index.html' >> /page.sh && \
    echo 'exec nginx -g "daemon off;"' >> /page.sh && \
    chmod +x /page.sh

# ETAP 2 
# Obraz bazowy Nginx 
FROM nginx:alpine

# Kopiowanie skryptu startowego
COPY --from=builder /page.sh /page.sh

# Sprawdzanie poprawności działania 
HEALTHCHECK --interval=15s --timeout=3s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

# Skrypt - domyślne polecenie uruchamiane przy starcie kontenera
CMD ["/page.sh"]
