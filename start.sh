#!/bin/sh

# Usar a porta fornecida pelo Railway ou 80 como padrão
PORT=${PORT:-80}

# Criar configuração do Nginx com a porta dinâmica
cat > /etc/nginx/conf.d/default.conf << EOF
server {
    listen $PORT;
    server_name localhost;
    root /usr/share/nginx/html;
    index historia.html index.html;
    
    location / {
        try_files \$uri \$uri/ /historia.html;
    }
    
    # Configuração para servir arquivos estáticos
    location ~* \.(css|js|svg|png|jpg|jpeg|gif|ico|woff|woff2|ttf|eot)\$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
    
    # Configuração para páginas HTML
    location ~* \.html\$ {
        add_header Cache-Control "no-cache, must-revalidate";
    }
}
EOF

# Iniciar o Nginx
nginx -g 'daemon off;'
