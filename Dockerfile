FROM n8nio/n8n:latest

USER root

# n8n v2.1.0+ removed apk for security hardening — reinstall it first
RUN wget -q https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic/v2.14.4/x86_64/apk.static \
    && chmod +x apk.static \
    && ./apk.static -X https://dl-cdn.alpinelinux.org/alpine/v3.23/main \
                    -X https://dl-cdn.alpinelinux.org/alpine/v3.23/community \
                    -U --allow-untrusted --initdb add apk-tools \
    && rm apk.static

# Now install required packages using restored apk
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
