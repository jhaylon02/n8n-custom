FROM n8nio/n8n:latest

USER root

# Install system dependencies (Alpine uses apk, NOT apt-get)
RUN apk add --no-cache \
  python3 \
  py3-pip \
  ffmpeg \
  curl \
  wget \
  git \
  ca-certificates \
  chromium \
  nss \
  freetype \
  harfbuzz \
  ttf-freefont

# Install Python packages
RUN pip3 install --no-cache-dir \
  requests \
  beautifulsoup4 \
  pandas \
  lxml

# Install Playwright + browsers
RUN npm install -g playwright && \
  playwright install --with-deps

USER node

ENV N8N_RUNNERS_ENABLED=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
