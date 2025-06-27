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

# Copiar script de inicialização
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expor a porta (Railway usa variável PORT)
EXPOSE $PORT

# Usar o script de inicialização
CMD ["/start.sh"]