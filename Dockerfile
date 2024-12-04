FROM pandoc/extra:3.5-ubuntu

# Core Install
RUN apt-get update && apt-get install \
    vim \
    nodejs \
    npm \
    -y

# Install dependencies for Mermaid
RUN apt-get install \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libxdamage1 \
    libxkbcommon-x11-0 \
    libasound2t64 \
    -y
# Cache clean for apt-get
RUN apt-get clean \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

# Install Mermaid
RUN npm install -g @mermaid-js/mermaid-cli

# Install Japanese font
RUN wget https://github.com/trueroad/HaranoAjiFonts/archive/refs/heads/master.tar.gz
RUN tar -xzf master.tar.gz
RUN mv HaranoAjiFonts-master/* /usr/local/share/fonts/ \
  && rm -rf HaranoAjiFonts-master \
  && rm master.tar.gz

# Install Lua filter
RUN wget https://github.com/pandoc-ext/diagram/archive/refs/heads/main.tar.gz
RUN tar -xzf main.tar.gz
RUN mv diagram-main/*  /usr/local/share/pandoc/filters/ \
  && rm -rf diagram-main \
  && rm main.tar.gz

# Add user
RUN groupadd -r appuser && useradd -r -g appuser appuser \
  && mkdir /home/appuser \
  && chown -R appuser:appuser /home/appuser
RUN chown -R appuser:appuser /data
USER appuser

# Install headless chrome by puppeteer
RUN npx puppeteer browsers install chrome-headless-shell

CMD ["/bin/bash"]
