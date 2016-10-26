FROM gitlab/gitlab-ce:8.13.0-ce.0
MAINTAINER tranphanquocnhan@gmail.com

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_1.0.2_amd64 /usr/bin/dumb-init
RUN chmod +x /usr/bin/dumb-init

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y ca-certificates wget apt-transport-https vim nano && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 22 443
VOLUME ['/etc/gitlab', '/var/log/gitlab', '/var/opt/gitlab']

ENTRYPOINT ["/usr/bin/dumb-init", "/assets/wrapper"]