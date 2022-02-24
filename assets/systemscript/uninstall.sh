#!/bin/bash


if [ -f "/home/phablet/.config/upstart/unity8-dash.override" ] 
then 
	rm -f /home/phablet/.config/upstart/unity8-dash.override
elif [ -f "/home/phablet/.config/upstart/launchermodular.conf" ] 
then 
	rm -f /home/phablet/.config/upstart/launchermodular.conf
elif [ -f "/home/phablet/.unity8-dash.bak" ] 
then 
mount -o rw,remount /
	if [ "$(head -n1 /home/phablet/.unity8-dash.bak)" != "#!/bin/bash" ] 
	then 
		mv -f /home/phablet/.unity8-dash.bak /usr/bin/unity8-dash
		rm /home/phablet/.unity8-dash.bak
	else
		rm /home/phablet/.unity8-dash.bak
		apt update
		apt install unity8 --reinstall -y
	fi

mount -o ro,remount /
else  
	apt update
	apt install unity8 --reinstall -y
fi
