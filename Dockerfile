FROM jenkins:2.60.3
USER root
WORKDIR /mytasks/
RUN apt update && \
    apt install --no-install-recommends mysql-client -y && \
    apt clean && rm -rf /var/lib/apt/lists/*
USER jenkins
