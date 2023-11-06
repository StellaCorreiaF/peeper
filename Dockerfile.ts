FROM node


RUN apt-get update -qq && apt-get install -y \
 apt-utils \
 build-essential
WORKDIR /peeper

COPY . /peeper/

WORKDIR /peeper/frontend
RUN npm install -g vue
RUN npm install -g @vue/cli
RUN yarn install 
