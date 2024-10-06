FROM node:lts-buster

FROM gitpod/workspace-full

# Install dependencies
RUN npm install -g npm@latest
RUN npm install -g typescript

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install qrcode-terminal

RUN npm install @supabase/supabase-js

COPY . .

EXPOSE 3000
