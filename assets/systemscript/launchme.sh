#!/bin/bash
launched=$(ubuntu-app-list | grep launchermodular.ubuntouchfr)
appid=$(ubuntu-app-launch-appids | grep launchermodular.ubuntouchfr)
if [ -n appid ]
then
    ubuntu-app-launch $appid && tail --pid=$(ubuntu-app-pid $appid) -f /dev/null
fi
 
