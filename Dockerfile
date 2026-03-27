FROM node:18-bullseye

# Install system dependencies (Debian)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    curl \
    wget \
    git \
    chromium \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install n8n globally
RUN npm install -g n8n

# Install Python packages
RUN pip3 install --no-cache-dir \
    requests \
    beautifulsoup4 \
    pandas \
    lxml

# Install Playwright (light)
RUN npm install -g playwright

# Set environment
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

EXPOSE 5678

CMD ["n8n"]
