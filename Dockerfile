FROM n8nio/n8n:latest

USER root

# Install Alpine system dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    curl \
    wget \
    git \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ttf-freefont \
    ca-certificates

# Install Python packages
RUN pip3 install --no-cache-dir \
    requests \
    beautifulsoup4 \
    pandas \
    lxml

# Install Playwright CLI only
RUN npm install -g playwright

# Switch back to n8n user
USER node

# Enable Task Runners
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
