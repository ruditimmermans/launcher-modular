#!/bin/bash
launched=$(lomiri-app-list | grep launchermodular.ubuntouchfr)
appid=$(lomiri-app-launch-appids | grep launchermodular.ubuntouchfr)
if [ -n appid ]
then
    lomiri-app-launch $appid && tail --pid=$(lomiri-app-pid $appid) -f /dev/null
fi
