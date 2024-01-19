# Use uma versão específica do Node
FROM node:14

RUN apt-get update -qq && \
    apt-get install -y apt-utils build-essential

WORKDIR /peeper/frontend

RUN npm install -g vue @vue/cli

# Copie apenas os arquivos necessários para instalar as dependências
COPY frontend/package.json yarn.lock ./

# Instale as dependências
RUN yarn install

# Copie o restante dos arquivos
COPY . .
