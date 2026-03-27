FROM n8nio/n8n:latest

USER root

# Install Alpine system dependencies (n8n base image is Alpine-based)
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
RUN pip3 install --no-cache-dir --break-system-packages \
    requests \
    beautifulsoup4 \
    pandas \
    lxml

# Install Playwright CLI only
RUN npm install -g playwright

# Switch back to n8n user
USER node
