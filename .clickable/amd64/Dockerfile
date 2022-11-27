FROM clickable/amd64-20.04-amd64

RUN echo set debconf/frontend Noninteractive | debconf-communicate && echo set debconf/priority critical | debconf-communicate
RUN apt-get update && apt-get install -y --force-yes --no-install-recommends qtdeclarative5-ubuntu-history0.1:amd64 history-service:amd64 qtdeclarative5-ubuntu-contacts0.1:amd64 qtdeclarative5-ubuntu-addressbook0.1:amd64 libpam0g-dev:amd64 libgsettings-qt-dev:amd64 qtdeclarative5-gsettings1.0:amd64 && apt-get clean