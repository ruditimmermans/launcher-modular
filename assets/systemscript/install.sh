#!/bin/bash

#mount -o rw,remount /

if [ ! -f "/home/phablet/.config/upstart/launchermodular.conf" ]
then
	echo 'env BINARY=/opt/click.ubuntu.com/launchermodular.ubuntouchfr/current/launchermodular
env APP_DIR=/opt/click.ubuntu.com/.click/users/phablet/launchermodular.ubuntouchfr
env XDG_CONFIG_HOME=/home/phablet/.config
env XDG_DATA_HOME=/home/phablet/.local/share
env APP_DESKTOP_FILE_PATH=/opt/click.ubuntu.com/.click/users/phablet/launchermodular.ubuntouchfr/launchermodular.desktop

start on started unity8
stop on stopping unity8

kill timeout 240

respawn
respawn limit unlimited

script
	APP_ID=$(ubuntu-app-launch-appids | grep launchermodular.ubuntouchfr)
	ubuntu-app-launch $APP_ID && tail -f /proc/$(ubuntu-app-pid $APP_ID)/fd/1 2> /dev/null
end script
' >/home/phablet/.config/upstart/launchermodular.conf
fi

#mount -o ro,remount /
