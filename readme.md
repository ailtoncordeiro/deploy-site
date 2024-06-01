# Meu Site Estático com Nginx e Docker

Este projeto demonstra como utilizar o web server Nginx e Docker para criar um servidor que publica uma página web estática com arquivos HTML, CSS e JS com certificado SSL gratuito. 


## Pré-requisitos

- Ubuntu Server 22.04
- Docker instalado
- Conhecimento básico de HTML, CSS e JavaScript.
- Um dominio válido
- Um IP Público válido

## Passos para Configuração

### 1. Clonar o Repositório

```bash
git clone https://github.com/ailtoncordeiro/deploy-site-estatico.git
cd deploy-site-estatico
```

### 2. Subir o serviço do Nginx

***OBS: Não esqueça de antes editar o arquivo de configuração do NGINX para o seu domínio.***

```bash
docker compose up -d web
```

### 3. Criar o certificado SSL

execute o comando abaixo e siga as instruções que irão surgir.

```bash
docker compose run --rm certbot certonly --webroot --webroot-path /var/www/certbot/ -d [domain-name]
```

### 4. Editar arquivo de configuração do Nginx

No arquivo app.conf que está no diretório .nginx. Descomente a parte referente ao HTTPS e execute o comando

```bash
docker compose up -d web --build
```

###  5. Renovar o certificado

O certificado emitido pela LetsEncrypt tem validade de 90 dias, para renovar o certificado basta executar o comando:

```bash
docker compose run --rm certbot renew
```

Você pode adicionar esse comando no cron para executar periodicamente

***Após renovar o certificado é necessário regarregar o Nginx***

```bash
docker compose exec web nginx -s reload
```

## Licença

Este `README.md` é completo e fornece todas as informações necessárias para alguém que queira clonar e rodar o projeto. Ele inclui instruções passo a passo sobre como montar e executar o contêiner, além de detalhes sobre cada parte do código. Se você gostaria de adicionar ou modificar alguma seção, fique à vontade para me dizer!
