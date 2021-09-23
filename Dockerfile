FROM node:erbium-buster-slimx

LABEL "repository"="https://github.com/lksy0217/git_action"
LABEL "maintainer"="hugh.shin <hugh.shin93@gmail.com>"

RUN set -eux ; \
    apt-get update -y; \
    apt-get install --no-install-recommends -y \
    tzdata; \
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime; \
    mkdir /html; \
    npm install -g http-server

ADD ./index.html /html

WORKDIR /html
EXPOSE 80

CMD ["http-server", "-p80", "./"]
