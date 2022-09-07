FROM clickable/amd64-16.04-arm64:16.04.5

RUN echo set debconf/frontend Noninteractive | debconf-communicate && echo set debconf/priority critical | debconf-communicate
RUN apt-get update && apt-get install -y --force-yes --no-install-recommends qtdeclarative5-ubuntu-history0.1:arm64 history-service:arm64 qtdeclarative5-ubuntu-contacts0.1:arm64 qtdeclarative5-ubuntu-addressbook0.1:arm64 libpam0g-dev:arm64 libgsettings-qt-dev:arm64 qtdeclarative5-gsettings1.0:arm64 && apt-get clean