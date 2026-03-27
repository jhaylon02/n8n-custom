FROM n8nio/n8n:latest

USER root

# Install Debian system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    curl \
    wget \
    git \
    ca-certificates \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ttf-freefont \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install --no-cache-dir \
    requests \
    beautifulsoup4 \
    pandas \
    lxml

# Install Playwright (CLI only, light version)
RUN npm install -g playwright

# Switch back to n8n user
USER node

# Enable Task Runners
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
