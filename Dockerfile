FROM jenkins:2.60.3
WORKDIR /tmp/sql/
USER root
RUN apt update && \
    apt install --no-install-recommends mysql-client -y && \
    apt clean && rm -rf /var/lib/apt/lists/*
USER jenkins
