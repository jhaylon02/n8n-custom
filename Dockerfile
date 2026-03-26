FROM n8nio/n8n:latest

USER root

RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  ffmpeg \
  curl \
  wget \
  git \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
  requests \
  beautifulsoup4 \
  pandas \
  lxml

RUN npm install -g playwright && playwright install

USER node

ENV N8N_RUNNERS_ENABLED=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
