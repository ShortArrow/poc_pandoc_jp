FROM pandoc/extra:3.5-ubuntu
RUN apt-get update && apt-get install -y \
    vim \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
ENTRYPOINT ["/bin/bash"]
