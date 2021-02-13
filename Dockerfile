FROM alpine:3.12

RUN apk --no-cache --update add bash git \
    && rm -rf /var/cache/apk/*

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

RUN wget -O - -q "$(wget -q https://api.github.com/repos/owenrumney/squealer/releases/latest -O - | grep -o -E "https://.+?squealer-linux-amd64")" > squealer \
    && install squealer /usr/local/bin/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]