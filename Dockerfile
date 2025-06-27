FROM nginx:alpine

# Copiar arquivos HTML
COPY *.html /usr/share/nginx/html/

# Copiar arquivos CSS
COPY *.css /usr/share/nginx/html/
COPY styles/ /usr/share/nginx/html/styles/

# Copiar arquivos JavaScript
COPY js/ /usr/share/nginx/html/js/

# Copiar assets (imagens, SVGs, etc.)
COPY assets/ /usr/share/nginx/html/assets/

# Copiar configuração customizada do Nginx
COPY default.conf /etc/nginx/conf.d/default.conf

# Expor a porta 80 (padrão do Nginx)
EXPOSE 80