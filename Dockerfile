FROM n8nio/n8n:latest

USER root

# Install Debian system dependencies (n8n base image is Debian-based)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    curl \
    wget \
    git \
    ca-certificates \
    chromium \
    libnss3 \
    libfreetype6 \
    libharfbuzz0b \
    fonts-freefont-ttf \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

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
