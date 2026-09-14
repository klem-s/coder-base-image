FROM codercom/example-base:ubuntu

USER root

# Outils système de base
RUN apt-get update && apt-get install -y --no-install-recommends \
    tmux \
    vim \
    golang-go \
    git \
    curl \
    ca-certificates \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Node.js 22.x (NodeSource)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# Claude Code (CLI Anthropic) en global
RUN npm install -g @anthropic-ai/claude-code

USER coder
