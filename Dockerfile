FROM pandoc/extra:3.5-ubuntu
RUN apt-get update && apt-get install -y \
    vim \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
RUN wget https://github.com/trueroad/HaranoAjiFonts/archive/refs/heads/master.tar.gz
RUN tar -xzf master.tar.gz
RUN mv HaranoAjiFonts-master/* /usr/local/share/fonts/ \
  && rm -rf HaranoAjiFonts-master \
  && rm master.tar.gz
CMD ["/bin/bash"]
