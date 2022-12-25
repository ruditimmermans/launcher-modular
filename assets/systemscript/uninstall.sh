#!/bin/bash


if [ -f "/home/phablet/.config/upstart/lomiri-dash.override" ] 
then 
	rm -f /home/phablet/.config/upstart/lomiri-dash.override
elif [ -f "/home/phablet/.config/upstart/launchermodular.conf" ] 
then 
	rm -f /home/phablet/.config/upstart/launchermodular.conf
elif [ -f "/home/phablet/.lomiri-dash.bak" ] 
then 
mount -o rw,remount /
	if [ "$(head -n1 /home/phablet/.lomiri-dash.bak)" != "#!/bin/bash" ] 
	then 
		mv -f /home/phablet/.lomiri-dash.bak /usr/bin/lomiri-dash
		rm /home/phablet/.lomiri-dash.bak
	else
		rm /home/phablet/.lomiri-dash.bak
		apt update
		apt install lomiri --reinstall -y
	fi

mount -o ro,remount /
else  
	apt update
	apt install lomiri --reinstall -y
fi
