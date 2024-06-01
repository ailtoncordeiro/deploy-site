# Usar a imagem base oficial do nginx
FROM nginx:alpine

#Copiar os arquivos do projeto para o diretório padrão do nginx
COPY ./index.html /usr/share/nginx/html
COPY ./css /usr/share/nginx/html/css
COPY ./js /usr/share/nginx/js

# Copiar o arquivo de configuração do nginx para o deploy
COPY ./.nginx/app.conf /etc/nginx/conf.d/app.conf

# Expor as portas 80 (HTTP) e 443 (HTTPS)
EXPOSE 80
EXPOSE 443