# Use a versão específica do Ruby
ARG RUBY_VERSION=3.0.0
FROM ruby:${RUBY_VERSION}

# Dependências
RUN apt-get update -q && \
    apt-get install -y apt-utils build-essential default-libmysqlclient-dev

# Configuração do ambiente
RUN gem install bundler && \
    git config --global init.defaultBranch main && \
    gem update --system && \
    bundle config --global frozen 1

# Crie e defina o diretório de trabalho
WORKDIR /peeper/backend

# Copie apenas os arquivos necessários para instalar as dependências

COPY backend/Gemfile backend/Gemfile.lock ./

# Instale as dependências
RUN bundle install --jobs 4 --retry 3

# Copie o restante dos arquivos
COPY . .

# Migração e seed do banco de dados
RUN rails db:migrate && \
    rails db:seed
