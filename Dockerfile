FROM docker

ARG CLI_VERSION="2.16.4"

RUN echo "https://cli-dist.keboola.com/apk" | tee -a /etc/apk/repositories
RUN wget -P /etc/apk/keys/ https://cli-dist.keboola.com/apk/keboola.rsa.pub
RUN apk update && apk add keboola-cli=$CLI_VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
