FROM docker

RUN wget https://github.com/keboola/keboola-as-code/releases/download/v2.12.1/keboola-cli_2.12.1_linux_amd64.apk
RUN apk add --allow-untrusted ./keboola-cli_2.12.1_linux_amd64.apk

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
