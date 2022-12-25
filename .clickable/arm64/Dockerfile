FROM docker.io/clickable/amd64-20.04-arm64

RUN echo set debconf/frontend Noninteractive | debconf-communicate && echo set debconf/priority critical | debconf-communicate
RUN apt-get update && apt-get install -y --force-yes --no-install-recommends qml-module-lomiri-history0.1:arm64 history-service:arm64 qml-module-lomiri-contacts0.1:arm64 qml-module-lomiri-addressbook0.1:arm64 libpam0g-dev:arm64 libgsettings-qt-dev:arm64 qml-module-gsettings1.0:arm64 && apt-get clean